import 'dart:convert';

import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:dippy_cue/Helpers/helper.dart';
import 'package:dippy_cue/Helpers/qrcode_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class BackgroundQRCodeScanner {
  final BuildContext context;

  BackgroundQRCodeScanner({required this.context});

  CameraController? _cameraController;
  bool _isProcessing = false;
  BarcodeScanner _barcodeScanner = GoogleMlKit.vision.barcodeScanner();
  AppUtility helper = AppUtility();

  /// Initialize the camera
  Future<void> initializeCamera() async {
    final cameras = await availableCameras();
    final backCamera = cameras.firstWhere(
      (camera) => camera.lensDirection == CameraLensDirection.front,
    );

    _cameraController = CameraController(
      backCamera,
      ResolutionPreset.low, // Use low resolution to minimize resource usage
      enableAudio: false,
    );

    await _cameraController!.initialize();
    _startScanning(context);
  }

  /// Start scanning for QR codes
  void _startScanning(context) {
    _cameraController?.startImageStream((CameraImage image) async {
      if (_isProcessing) return;
      _isProcessing = true;

      try {
        final qrCode = await _detectQRCode(image);
        if (qrCode != null) {
          debugPrint('QR Code detected: $qrCode');
          // Handle detected QR code here (e.g., update state or send data)
          showMessageDialog('QR Detected', 'Prcocessing QR Code');

          Response qrCodeResponse = await helper.logUserDTR(qrCode);
          Navigator.of(context).pop();
          String foundName = '';
          String foundMessage = '';
          bool validUser = false;
          bool error = true;
          if (qrCodeResponse.statusCode == 200) {
            print(qrCodeResponse.data);
            var res = json.decode(qrCodeResponse.data);
            error = res['error'];
            validUser = res['valid_user'];
          }

          if (validUser == true && error == false) {
            try {
              String dcimPath = "/storage/emulated/0/DCIM";
              final filePath =
                  '$dcimPath/${DateTime.now().millisecondsSinceEpoch}.jpg';
              await _cameraController!.takePicture().then((file) {
                file.saveTo(filePath); // Save the picture
                print('Picture saved at $filePath');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Picture saved at $filePath')),
                );
              });
            } catch (e) {
              print('Error taking picture: $e');
            }
          }
          //await Future.delayed(const Duration(seconds: 2));
          Provider.of<QRCodeState>(context, listen: false)
              .updateScannedCode(qrCodeResponse.data);
        }
      } catch (e) {
        debugPrint('Error detecting QR code: $e');
      } finally {
        _isProcessing = false;
      }
    });
  }

  /// Detect QR code using Google ML Kit
  Future<String?> _detectQRCode(CameraImage image) async {
    final inputImage = _convertCameraImageToInputImage(image);
    final barcodes = await _barcodeScanner.processImage(inputImage);

    if (barcodes.isNotEmpty) {
      return barcodes.first.value.rawValue; // Return the first detected QR code
    }
    return null;
  }

  /// Convert CameraImage to InputImage for ML Kit
  InputImage _convertCameraImageToInputImage(CameraImage image) {
    final allBytes = WriteBuffer();
    for (final plane in image.planes) {
      allBytes.putUint8List(plane.bytes);
    }

    final bytes = allBytes.done().buffer.asUint8List();
    final size = Size(image.width.toDouble(), image.height.toDouble());
    final rotation = InputImageRotation.Rotation_0deg;

    final format = InputImageFormatMethods.fromRawValue(image.format.raw) ??
        InputImageFormat.NV21;
    final planeData = image.planes.map(
      (plane) {
        return InputImagePlaneMetadata(
          bytesPerRow: plane.bytesPerRow,
          height: plane.height,
          width: plane.width,
        );
      },
    ).toList();

    return InputImage.fromBytes(
      bytes: bytes,
      inputImageData: InputImageData(
        size: size,
        imageRotation: rotation,
        inputImageFormat: format,
        planeData: planeData,
      ),
    );
  }

  void showMessageDialog(String dialogTitle, String message) {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent user from dismissing manually
      builder: (BuildContext context) {
        // Trigger auto-dismiss
        return AlertDialog(
          title: Center(
            child: Text(dialogTitle),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(message),
            ],
          ),
        );
      },
    );
  }

  void _snapPicture(CameraController cam) async {
    try {
      String dcimPath = "/storage/emulated/0/DCIM";
      final filePath = '$dcimPath/${DateTime.now().millisecondsSinceEpoch}.jpg';
      await cam.takePicture().then((file) {
        file.saveTo(filePath); // Save the picture
        print('Picture saved at $filePath');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Picture saved at $filePath')),
        );
      });
    } catch (e) {
      print('Error taking picture: $e');
    }
  }

  Future<void> _takePicture(cameraController) async {
    if (cameraController != null && cameraController!.value.isInitialized) {
      //final directory = await getExternalStorageDirectory();
      String dcimPath = "/storage/emulated/0/DCIM";
      final filePath = '$dcimPath/${DateTime.now().millisecondsSinceEpoch}.jpg';
    }
  }

  /// Dispose resources
  void dispose() {
    _cameraController?.dispose();
    _barcodeScanner.close();
  }
}

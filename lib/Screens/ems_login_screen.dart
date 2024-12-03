import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:dippy_cue/Helpers/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:flutter_zxing/flutter_zxing.dart';

class EMSLoginScreen extends StatefulWidget {
  const EMSLoginScreen({super.key});

  @override
  State<EMSLoginScreen> createState() => _EMSLoginScreenState();
}

class _EMSLoginScreenState extends State<EMSLoginScreen> {
  Uint8List? createdCodeBytes;
  bool showCamera = false;
  Code? result;
  Codes? multiResult;

  bool isMultiScan = false;

  bool showDebugInfo = true;
  int successScans = 0;
  int failedScans = 0;
  TextEditingController responseHandler = TextEditingController();
  AppUtility helper = AppUtility();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: const Text('Employee Management System'),
        ),
      ),
      body: SingleChildScrollView(
          child: BootstrapContainer(children: [
        BootstrapRow(
          children: [
            BootstrapCol(
              sizes: 'col-12 col-sm-12 col-md-6 col-lg-4 col-xl-3',
              child: Column(
                children: [
                  Container(
                    child: Text('Scanner Container'),
                  ),
                  TextButton.icon(
                      onPressed: () {
                        setState(() {
                          showCamera = !showCamera;
                        });
                      },
                      label: Text('${(showCamera) ? 'Hide' : 'Show'} Camera')),
                  TextButton.icon(
                      onPressed: () {
                        sampleLogUser();
                      },
                      label: const Text('Time in User')),
                  showCamera
                      ? Container(
                          height: 500,
                          child: _scannerContainer(),
                        )
                      : Container()
                ],
              ),
            ),
            BootstrapCol(
              sizes: 'col-12 col-sm-12 col-md-6 col-lg-4 col-xl-3',
              child: Column(
                children: [
                  BootstrapRow(children: [
                    BootstrapCol(
                        sizes: 'col-12',
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [Text('Server Time Container')],
                          ),
                        ))
                  ]),
                  BootstrapRow(children: [
                    BootstrapCol(
                        sizes: 'col-md-6',
                        child: Container(
                          child: Text('Time Log Result Container'),
                        )),
                    BootstrapCol(
                        sizes: 'col-md-6',
                        child: Container(
                          child: Text('${responseHandler.text}'),
                        ))
                  ]),
                ],
              ),
            ),
          ],
        ),
      ])),
    );
  }

  Container _localContainer(double screenWidth) {
    return Container(
      child: Column(
        children: [
          Wrap(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                width: (screenWidth / 2),
                child: Column(
                  children: [
                    Container(
                      child: Text('Scanner Container'),
                    ),
                    TextButton.icon(
                        onPressed: () {
                          setState(() {
                            showCamera = !showCamera;
                          });
                        },
                        label: Text('Show Camera')),
                    showCamera
                        ? Container(
                            height: 500,
                            child: _scannerContainer(),
                          )
                        : Container()
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                width: (screenWidth / 2),
                child: Text('Hello World'),
              )
            ],
          )
        ],
      ),
    );
  }

  void sampleLogUser() async {
    Response logResponse = await helper.logUserDTR('626');

    if (logResponse.statusCode == 200) {
      var res = json.decode(logResponse.data);

      responseHandler.text = res['ret_data'];
    } else {
      responseHandler.text = "Error Data";
    }

    setState(() {});
  }

  Widget _scannerContainer() {
    return ReaderWidget(
      onScan: _onScanSuccess,
      onScanFailure: _onScanFailure,
      onMultiScan: _onMultiScanSuccess,
      onMultiScanFailure: _onMultiScanFailure,
      onMultiScanModeChanged: _onMultiScanModeChanged,
      onControllerCreated: _onControllerCreated,
      isMultiScan: isMultiScan,
      scanDelay: Duration(milliseconds: isMultiScan ? 50 : 500),
      resolution: ResolutionPreset.high,
      lensDirection: CameraLensDirection.back,
      flashOnIcon: const Icon(Icons.flash_on),
      flashOffIcon: const Icon(Icons.flash_off),
      flashAlwaysIcon: const Icon(Icons.flash_on),
      flashAutoIcon: const Icon(Icons.flash_auto),
      galleryIcon: const Icon(Icons.photo_library),
      toggleCameraIcon: const Icon(Icons.switch_camera),
      actionButtonsBackgroundBorderRadius: BorderRadius.circular(10),
      actionButtonsBackgroundColor: Colors.black.withOpacity(0.5),
    );
  }

  void _onControllerCreated(_, Exception? error) {
    if (error != null) {
      // Handle permission or unknown errors
      _showMessage(context, 'Error: $error');
    }
  }

  _onScanSuccess(Code? code) {
    setState(() {
      successScans++;
      result = code;
    });

    _showMessage(context, result!.text.toString());
  }

  _onScanFailure(Code? code) {
    setState(() {
      failedScans++;
      result = code;
    });
    if (code?.error?.isNotEmpty == true) {
      _showMessage(context, 'Error: ${code?.error}');
    }
  }

  _onMultiScanSuccess(Codes codes) {
    setState(() {
      successScans++;
      multiResult = codes;
    });
  }

  _onMultiScanFailure(Codes result) {
    setState(() {
      failedScans++;
      multiResult = result;
    });
    if (result.codes.isNotEmpty == true) {
      _showMessage(context, 'Error: ${result.codes.first.error}');
    }
  }

  _onMultiScanModeChanged(bool isMultiScan) {
    setState(() {
      this.isMultiScan = isMultiScan;
    });
  }

  _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  _onReset() {
    setState(() {
      successScans = 0;
      failedScans = 0;
    });
  }
}

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
  TextEditingController amin = TextEditingController();
  TextEditingController amout = TextEditingController();
  TextEditingController pmin = TextEditingController();
  TextEditingController pmout = TextEditingController();
  TextEditingController empFullName = TextEditingController();
  TextEditingController empDepartment = TextEditingController();
  TextEditingController empDutyDescription = TextEditingController();
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
                        sizes: 'col-12',
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('User Information Container'),
                              Icon(
                                Icons.account_circle_rounded,
                                size: 90,
                              ),
                              Text(
                                '${empFullName.text}',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.5),
                              ),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.diversity_3_outlined,
                                        size: 16,
                                      ),
                                      Text(
                                        '${empDepartment.text}',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1.5),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.info,
                                    size: 16,
                                  ),
                                  Text(
                                    '${empDutyDescription.text}',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.5),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ))
                  ]),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Current Logs Container'),
                  BootstrapRow(children: [
                    BootstrapCol(
                        sizes: 'col-xl-6',
                        child: Container(
                          child: Column(
                            children: [
                              Text('Morning'),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Text('In'),
                                          Text('${amin.text}')
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Text('Out'),
                                          Text('${amout.text}')
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )),
                    BootstrapCol(
                        sizes: 'col-xl-6',
                        child: Container(
                          child: Column(
                            children: [
                              Text('Afternoon'),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Text('In'),
                                          Text('${pmin.text}')
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Text('Out'),
                                          Text('${pmout.text}')
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )),
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
      responseHandler.text = res['msg'];
      if (res['error'] == false) {
        //print(res['current_record']['department']);
        AutoDismissDialog("Clever Mooda Fooka", res['msg'], 3);
        empFullName.text = res['current_record']['full_name'];
        empDepartment.text = res['current_record']['department'];
        empDutyDescription.text = res['current_record']['duty_description'];
        amin.text = (res['current_record']['amin'] == null)
            ? ""
            : res['current_record']['amin'];
        amout.text = (res['current_record']['amout'] == null)
            ? ""
            : res['current_record']['amout'];
        pmin.text = (res['current_record']['pmin'] == null)
            ? ""
            : res['current_record']['pmin'];
        pmout.text = (res['current_record']['pmout'] == null)
            ? ""
            : res['current_record']['pmout'];
      }

      if (res['error'] == true) {
        AutoDismissDialog("Fooking Hell?", res['msg'], 5);
      }
    } else {
      responseHandler.text = "Error Data";
    }

    setState(() {});
  }

  void AutoDismissDialog(
      String dialogTitle, String message, int dismissSeconds) {
    showDialog(
      context: context,
      barrierDismissible: true, // Prevent user from dismissing manually
      builder: (BuildContext context) {
        // Trigger auto-dismiss
        Future.delayed(Duration(seconds: dismissSeconds), () {
          if (Navigator.of(context).canPop()) {
            Navigator.of(context).pop(); // Close the dialog after 10 seconds
          }
        });

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

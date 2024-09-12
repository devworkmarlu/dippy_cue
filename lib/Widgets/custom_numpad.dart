import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dippy_cue/Helpers/WebRequest.dart';
import 'package:dippy_cue/Helpers/helper.dart';
import 'package:dippy_cue/dippy_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomNumpad extends StatefulWidget {
  const CustomNumpad({super.key});

  @override
  State<CustomNumpad> createState() => _CustomNumpadState();
}

class _CustomNumpadState extends State<CustomNumpad> {
  TextEditingController zoneController = TextEditingController();
  TextEditingController classController = TextEditingController();
  TextEditingController acctController = TextEditingController();

  TextEditingController controllerWaterBalance = TextEditingController();
  TextEditingController controllerInstallment = TextEditingController();
  TextEditingController controllerMaterials = TextEditingController();
  TextEditingController controllerSeptage = TextEditingController();
  TextEditingController controllerNMWF = TextEditingController();
  TextEditingController controllerOthers = TextEditingController();
  TextEditingController controllerTotal = TextEditingController();

  bool zoneTapped = false;
  bool classTapped = false;
  bool acctTapped = false;
  bool showDetails = false;
  Widget customerDetailsContainer = Container();
  late var deviceOrientation;

  AppUtility appUtil = AppUtility();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double buttonWidth = 100;
    double buttonLetterWidth = 50;
    double inputFontSize = 50.0;
    deviceOrientation = MediaQuery.of(context).orientation;

    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 1,
                child: Container(
                    alignment: Alignment.topLeft,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Flexible(
                                flex: 1,
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: TextFormField(
                                    onTapOutside: (event) {
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                    },
                                    onTap: () {
                                      setState(() {
                                        zoneTapped = true;
                                        classTapped = false;
                                        acctTapped = false;
                                      });
                                    },
                                    controller: zoneController,
                                    style: TextStyle(
                                        fontSize: (deviceOrientation ==
                                                Orientation.portrait)
                                            ? 25
                                            : 50,
                                        fontWeight: FontWeight.bold),
                                    keyboardType: TextInputType.none,
                                    enabled: true,
                                    decoration: const InputDecoration(
                                        labelText: 'Zone Code',
                                        contentPadding: EdgeInsets.all(5)),
                                  ),
                                )),
                            Flexible(
                                flex: 1,
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: TextFormField(
                                    onTapOutside: (event) {
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                    },
                                    onTap: () {
                                      setState(() {
                                        classTapped = true;
                                        zoneTapped = false;
                                        acctTapped = false;
                                      });
                                    },
                                    controller: classController,
                                    style: TextStyle(
                                        fontSize: (deviceOrientation ==
                                                Orientation.portrait)
                                            ? 25
                                            : 50,
                                        fontWeight: FontWeight.bold),
                                    keyboardType: TextInputType.none,
                                    enabled: true,
                                    decoration: const InputDecoration(
                                        labelText: 'Class Code',
                                        contentPadding: EdgeInsets.all(5)),
                                  ),
                                )),
                            Flexible(
                                flex: 1,
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: TextFormField(
                                    onTapOutside: (event) {
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                    },
                                    onTap: () {
                                      acctTapped = true;
                                      classTapped = false;
                                      zoneTapped = false;
                                    },
                                    controller: acctController,
                                    style: TextStyle(
                                        fontSize: (deviceOrientation ==
                                                Orientation.portrait)
                                            ? 25
                                            : 50,
                                        fontWeight: FontWeight.bold),
                                    keyboardType: TextInputType.none,
                                    enabled: true,
                                    decoration: const InputDecoration(
                                        labelText: 'Acct. Series',
                                        contentPadding: EdgeInsets.all(5)),
                                  ),
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        showDetails ? customerDetailsContainer : Container()
                      ],
                    )),
              ),
              Flexible(
                flex: 1,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Flexible(
                          flex: 1,
                          child: Material(
                            // needed
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                _inputString('A');
                              }, // needed
                              child: Image.asset(
                                "assets/icons/letter_a.png",
                                width: buttonLetterWidth,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Material(
                            // needed
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                _inputString('B');
                              }, // needed
                              child: Image.asset(
                                "assets/icons/letter_b.png",
                                width: buttonLetterWidth,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Material(
                            // needed
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                _inputString('C');
                              }, // needed
                              child: Image.asset(
                                "assets/icons/letter_c.png",
                                width: buttonLetterWidth,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Material(
                            // needed
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                _inputString('D');
                              }, // needed
                              child: Image.asset(
                                "assets/icons/letter_d.png",
                                width: buttonLetterWidth,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Material(
                            // needed
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                _inputString('E');
                              }, // needed
                              child: Image.asset(
                                "assets/icons/letter_e.png",
                                width: buttonLetterWidth,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Material(
                            // needed
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                _inputString('F');
                              }, // needed
                              child: Image.asset(
                                "assets/icons/letter_f.png",
                                width: buttonLetterWidth,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Material(
                            // needed
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                _inputString('G');
                              }, // needed
                              child: Image.asset(
                                "assets/icons/letter_g.png",
                                width: buttonLetterWidth,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Material(
                            // needed
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                _inputString('H');
                              }, // needed
                              child: Image.asset(
                                "assets/icons/letter_h.png",
                                width: buttonLetterWidth,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Material(
                            // needed
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                _inputString('1');
                              }, // needed
                              child: Image.asset(
                                "assets/icons/num1.png",
                                width: buttonWidth,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Material(
                            // needed
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                _inputString('2');
                              }, // needed
                              child: Image.asset(
                                "assets/icons/num2.png",
                                width: buttonWidth,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Material(
                            // needed
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                _inputString('3');
                              }, // needed
                              child: Image.asset(
                                "assets/icons/num3.png",
                                width: buttonWidth,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Material(
                            // needed
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                _inputString('4');
                              }, // needed
                              child: Image.asset(
                                "assets/icons/num4.png",
                                width: buttonWidth,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Material(
                            // needed
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                _inputString('5');
                              }, // needed
                              child: Image.asset(
                                "assets/icons/num5.png",
                                width: buttonWidth,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Material(
                            // needed
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                _inputString('6');
                              }, // needed
                              child: Image.asset(
                                "assets/icons/num6.png",
                                width: buttonWidth,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Material(
                            // needed
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                _inputString('7');
                              }, // needed
                              child: Image.asset(
                                "assets/icons/num7.png",
                                width: buttonWidth,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Material(
                            // needed
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                _inputString('8');
                              }, // needed
                              child: Image.asset(
                                "assets/icons/num8.png",
                                width: buttonWidth,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Material(
                            // needed
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                _inputString('9');
                              }, // needed
                              child: Image.asset(
                                "assets/icons/num9.png",
                                width: buttonWidth,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Material(
                            // needed
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                removeString();
                              }, // needed
                              child: Image.asset(
                                "assets/icons/backspace.png",
                                color: Colors.red,
                                width: buttonWidth,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Material(
                            // needed
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                _inputString('0');
                              }, // needed
                              child: Image.asset(
                                "assets/icons/num0.png",
                                width: buttonWidth,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Material(
                            // needed
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                RequestData();
                              }, // needed
                              child: Image.asset(
                                "assets/icons/check.png",
                                color: Colors.green,
                                width: buttonWidth,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWidget(
      String text, VoidCallback? onPressed, double buttonWidth) {
    return Material(
      // needed
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed ?? () => _inputString(text), // needed
        child: Image.asset(
          "assets/icons/num1.png",
          width: buttonWidth,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Future<void> RequestData() async {
    final versioname = "H2Flow.0.7";
    String acctInputData =
        zoneController.text + classController.text + acctController.text;

    final formData = FormData.fromMap({
      'purpose': 'generalpurpose',
      'data': acctInputData,
      'vname': versioname
    });

    Response response2 = await WebRequest.dataFetch(
        'http://119.93.151.12:8003/dipcwd_api/', formData);

    print("From Genral Purpose:${response2.statusCode}");
    if (response2.statusCode == 200) {
      //print(response2.data);
      print('From Genral Purpose:${response2.data}');

      var res = json.decode(response2.data);
      bool isValid = false;
      if (res['error'] == false) {
        isValid = true;
        controllerWaterBalance.text = res['wb_balance'].toString();
        controllerInstallment.text = res['installment'].toString();
        controllerMaterials.text = res['latestMaterials'].toString();
        controllerSeptage.text = res['ar_septage'].toString();
        controllerNMWF.text = res['ar_nwmf'].toString();
        controllerOthers.text = res['ar_others'].toString();
        controllerTotal.text = res['total_payable'].toString();
        customerDetailsContainer = Container(
          child: Column(
            children: [
              appUtil.foundAccountDetails(isValid, res['customer_imagelink'],
                  res['customer_fullname'], res['customer_address'], true),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Flexible(
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: TextFormField(
                                  style: TextStyle(fontSize: 20),
                                  controller: controllerWaterBalance,
                                  keyboardType: TextInputType.none,
                                  decoration:
                                      InputDecoration(labelText: 'Water Bill'),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.all(5),
                                child: TextFormField(
                                  style: TextStyle(fontSize: 20),
                                  controller: controllerInstallment,
                                  keyboardType: TextInputType.none,
                                  decoration:
                                      InputDecoration(labelText: 'Installment'),
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Flexible(
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.all(5),
                                child: TextFormField(
                                  style: TextStyle(fontSize: 20),
                                  controller: controllerMaterials,
                                  keyboardType: TextInputType.none,
                                  decoration:
                                      InputDecoration(labelText: 'Materials'),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.all(5),
                                child: TextFormField(
                                  style: TextStyle(fontSize: 20),
                                  controller: controllerSeptage,
                                  keyboardType: TextInputType.none,
                                  decoration:
                                      InputDecoration(labelText: 'Septage'),
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Flexible(
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.all(5),
                                child: TextFormField(
                                  style: TextStyle(fontSize: 20),
                                  controller: controllerNMWF,
                                  keyboardType: TextInputType.none,
                                  decoration: InputDecoration(
                                      labelText: 'Water Meter Maint.'),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.all(5),
                                child: TextFormField(
                                  style: TextStyle(fontSize: 20),
                                  controller: controllerOthers,
                                  keyboardType: TextInputType.none,
                                  decoration:
                                      InputDecoration(labelText: 'Others'),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          child: TextFormField(
                            controller: controllerTotal,
                            style: TextStyle(fontSize: 30),
                            keyboardType: TextInputType.none,
                            decoration:
                                InputDecoration(labelText: 'Total Payable'),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Proceed to:',
                          style: DippyAppTheme.subtitle,
                        ),
                        Container(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: TextButton.icon(
                                          icon: Icon(Icons.payment_rounded),
                                          onPressed: () {},
                                          label: Text(
                                            'Teller',
                                            style: DippyAppTheme.subtitle,
                                          )),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: TextButton.icon(
                                          icon:
                                              Icon(Icons.support_agent_rounded),
                                          onPressed: () {},
                                          label: Text(
                                            'Cust. Service',
                                            style: DippyAppTheme.subtitle,
                                          )),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      } else {
        customerDetailsContainer = Column(
          children: [
            appUtil.foundAccountDetails(isValid, '', '', '', false),
          ],
        );
      }

      setState(() {
        showDetails = true;
      });
    } else {}
  }

  void _inputString(String input) {
    if (zoneTapped && zoneController.text.length != 3) {
      String currentVal = zoneController.text + input;
      zoneController.text = currentVal;
      return;
    }

    if (classTapped && classController.text.length != 3) {
      String currentVal = classController.text + input;
      classController.text = currentVal;

      return;
    }

    if (acctTapped && acctController.text.length != 4) {
      String currentVal = acctController.text + input;
      acctController.text = currentVal;
      return;
    }

    if (zoneController.text.length != 3 &&
        classController.text.isEmpty &&
        acctController.text.isEmpty) {
      String currentVal = zoneController.text + input;
      zoneController.text = currentVal;
      zoneTapped = true;
      classTapped = false;
      acctTapped = false;
      return;
    }

    if (zoneController.text.length == 3 &&
        classController.text.length != 3 &&
        acctController.text.length == 0) {
      String currentVal = classController.text + input;
      classController.text = currentVal;
      classTapped = true;
      zoneTapped = false;
      acctTapped = false;

      return;
    }

    if (zoneController.text.length == 3 &&
        classController.text.length == 3 &&
        acctController.text.length != 4) {
      String currentVal = acctController.text + input;
      acctController.text = currentVal;
      acctTapped = true;
      classTapped = false;
      zoneTapped = false;
      return;
    }
  }

  void removeString() {
    if (zoneTapped && zoneController.text.isNotEmpty) {
      String value = zoneController.text;
      zoneController.text = value.substring(0, value.length - 1);
      return;
    }

    if (classTapped && classController.text.isNotEmpty) {
      String value = classController.text;
      classController.text = value.substring(0, value.length - 1);
      return;
    }

    if (acctTapped && acctController.text.isNotEmpty) {
      String value = acctController.text;
      acctController.text = value.substring(0, value.length - 1);
      return;
    }

    if (zoneController.text.length == 3 &&
        classController.text.length == 3 &&
        acctController.text.isNotEmpty) {
      String value = acctController.text;
      acctController.text = value.substring(0, value.length - 1);
      acctTapped = true;
      classTapped = false;
      zoneTapped = false;

      return;
    }

    if (zoneController.text.length == 3 &&
        classController.text.isNotEmpty &&
        acctController.text.length == 0) {
      String value = classController.text;
      classController.text = value.substring(0, value.length - 1);
      classTapped = true;
      acctTapped = false;
      zoneTapped = false;
      return;
    }

    if (zoneController.text.isNotEmpty &&
        classController.text.length == 0 &&
        acctController.text.length == 0) {
      String value = zoneController.text;
      zoneController.text = value.substring(0, value.length - 1);
      zoneTapped = true;
      classTapped = false;
      acctTapped = false;
      return;
    }
  }
}

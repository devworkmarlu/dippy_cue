import 'package:dippy_cue/dippy_themes.dart';
import 'package:flutter/material.dart';

class CustomNumpad extends StatefulWidget {
  const CustomNumpad({super.key});

  @override
  State<CustomNumpad> createState() => _CustomNumpadState();
}

class _CustomNumpadState extends State<CustomNumpad> {
  TextEditingController zoneController = TextEditingController();
  TextEditingController classController = TextEditingController();
  TextEditingController acctController = TextEditingController();

  bool zoneTapped = false;
  bool classTapped = false;
  bool acctTapped = false;

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
                                        fontSize: 50.0,
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
                                        fontSize: 50.0,
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
                                        fontSize: 50.0,
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
                          height: 20,
                        ),
                        Column(
                          children: [
                            ClipOval(
                              child: SizedBox.fromSize(
                                size: Size.fromRadius(90), // Image radius
                                child: Image.network(
                                    'http://119.93.151.12:8003/water_flow/assets/img/avatars/1.png',
                                    fit: BoxFit.cover),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              'CAERMARE, RAUL A. (SC)',
                              style: DippyAppTheme.headline,
                            ),
                            Text(
                              'Sta. Felomina, Dipolog City',
                              style: DippyAppTheme.subtitle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '(Active)',
                                  style: DippyAppTheme.statusActive,
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    )),
              ),
              Flexible(
                flex: 1,
                child: Column(
                  children: [
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
                              onTap: () {}, // needed
                              child: Image.asset(
                                "assets/icons/check.png",
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

  void _inputString(String input) {
    /* if (zoneController.text.length == 3 &&
        classController.text.length == 3 &&
        acctController.text.isNotEmpty) {
      acctTapped = true;
      classTapped = false;
      zoneTapped = false;
    } */

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

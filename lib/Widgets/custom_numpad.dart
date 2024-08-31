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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: TextFormField(
                              controller: zoneController,
                              style: TextStyle(
                                  fontSize: 50.0, fontWeight: FontWeight.bold),
                              keyboardType: TextInputType.number,
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
                              controller: classController,
                              style: TextStyle(
                                  fontSize: 50.0, fontWeight: FontWeight.bold),
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
                              controller: acctController,
                              style: TextStyle(
                                  fontSize: 50.0, fontWeight: FontWeight.bold),
                              keyboardType: TextInputType.none,
                              enabled: true,
                              decoration: const InputDecoration(
                                  labelText: 'Acct. Series',
                                  contentPadding: EdgeInsets.all(5)),
                            ),
                          )),
                    ],
                  ),
                ),
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
    if (zoneController.text.length != 3 &&
        classController.text.length == 0 &&
        acctController.text.length == 0) {
      String currentVal = zoneController.text + input;
      zoneController.text = currentVal;
      return;
    }

    if (zoneController.text.length == 3 &&
        classController.text.length != 3 &&
        acctController.text.length == 0) {
      String currentVal = classController.text + input;
      classController.text = currentVal;
      return;
    }

    if (zoneController.text.length == 3 &&
        classController.text.length == 3 &&
        acctController.text.length != 4) {
      String currentVal = acctController.text + input;
      acctController.text = currentVal;
      return;
    }
  }

  void removeString() {
    if (zoneController.text.length == 3 &&
        classController.text.length == 3 &&
        acctController.text.length != 0) {
      String value = acctController.text;
      acctController.text = value.substring(0, value.length - 1);
      return;
    }

    if (zoneController.text.length == 3 &&
        classController.text.length != 0 &&
        acctController.text.length == 0) {
      String value = classController.text;
      classController.text = value.substring(0, value.length - 1);
      return;
    }

    if (zoneController.text.length != 0 &&
        classController.text.length == 0 &&
        acctController.text.length == 0) {
      String value = zoneController.text;
      zoneController.text = value.substring(0, value.length - 1);
      return;
    }
  }
}

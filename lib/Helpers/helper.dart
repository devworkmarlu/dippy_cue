import 'package:dippy_cue/Widgets/box_container.dart';
import 'package:flutter/material.dart';

class AppUtility {
  void showInputAccountDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black45,
      transitionDuration: Duration(milliseconds: 300),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        const double buttonWidth = 100.0;
        return Center(
          child: Material(
            color: Colors.transparent,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: MediaQuery.of(context).size.width - 40,
                padding: EdgeInsets.all(20),
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'Input Account Number',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [Text('Please Input Account Number')],
                    ),
                    Row(
                      children: [
                        Flexible(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                enabled: true,
                                decoration: const InputDecoration(
                                    hintText: 'Zone Code',
                                    contentPadding: EdgeInsets.all(5)),
                              ),
                            )),
                        Flexible(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                              ),
                            )),
                        Flexible(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                              ),
                            )),
                      ],
                    ),
                    SizedBox(height: 20),
                    Column(
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
                                  onTap: () {}, // needed
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
                                  onTap: () {}, // needed
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
                                  onTap: () {}, // needed
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
                                  onTap: () {}, // needed
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
                                  onTap: () {}, // needed
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
                                  onTap: () {}, // needed
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
                                  onTap: () {}, // needed
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
                                  onTap: () {}, // needed
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
                                  onTap: () {}, // needed
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
                                  onTap: () {}, // needed
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
                                  onTap: () {}, // needed
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
                                    "assets/icons/num1.png",
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
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Close'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: Offset(0, 1),
            end: Offset(0, 0),
          ).animate(animation),
          child: child,
        );
      },
    );
  }
}

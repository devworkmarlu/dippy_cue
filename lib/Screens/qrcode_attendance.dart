import 'dart:convert';

import 'package:dippy_cue/Helpers/backgound_scanner.dart';
import 'package:dippy_cue/Helpers/helper.dart';
import 'package:dippy_cue/Widgets/main_card.dart';
import 'package:dippy_cue/dippy_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Helpers/qrcode_state.dart';

class QRCodeAttendance extends StatefulWidget {
  const QRCodeAttendance({super.key});

  @override
  State<QRCodeAttendance> createState() => _QRCodeAttendanceState();
}

class _QRCodeAttendanceState extends State<QRCodeAttendance>
    with TickerProviderStateMixin {
  Animation<double>? topBarAnimation;
  AnimationController? animationController;
  final ScrollController scrollController = ScrollController();
  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  List<Widget> listViews = <Widget>[];

  double topBarOpacity = 0.0;
  double screenWidth = 0.0;
  bool _isLoading = true;
  List<String> listofBills = [];
  AppUtility userFunction = AppUtility();

  @override
  void initState() {
    // TODO: implement initState
    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);

    topBarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: animationController!,
            curve: Interval(0, 0.5, curve: Curves.fastOutSlowIn)));

    scrollController.addListener(() {
      if (scrollController.offset >= 24) {
        if (topBarOpacity != 1.0) {
          setState(() {
            topBarOpacity = 1.0;
          });
        }
      } else if (scrollController.offset <= 24 &&
          scrollController.offset >= 0) {
        if (topBarOpacity != scrollController.offset / 24) {
          setState(() {
            topBarOpacity = scrollController.offset / 24;
          });
        }
      } else if (scrollController.offset <= 0) {
        if (topBarOpacity != 0.0) {
          setState(() {
            topBarOpacity = 0.0;
          });
        }
      }
    });
    //_initializeData();
    super.initState();
  }

  Future<void> _initializeData() async {
    listViews.clear();
    listViews.add(MainCard(
      cardContent: Text('Hello World'),
      animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: animationController!,
          curve: Interval((1 / 1) * 1, 1.0, curve: Curves.fastOutSlowIn))),
      animationController: animationController!,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final scannedCode = Provider.of<QRCodeState>(context).scannedCode;

    return Container(
      child: Scaffold(
        body: FutureBuilder(
            future: loadBackgroundScanner(context),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/bg_banner.jpg"),
                          fit: BoxFit.cover)),
                  child: Stack(
                    children: <Widget>[
                      getMainListViewUI2(scannedCode),
                      getAppBarUI(),
                      SizedBox(
                        height: MediaQuery.of(context).padding.bottom,
                      )
                    ],
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }

  Widget getMainListViewUI2(scannedCode) {
    loadItems(scannedCode);
    return ListView.builder(
      controller: scrollController,
      padding: EdgeInsets.only(
        top: AppBar().preferredSize.height +
            MediaQuery.of(context).padding.top +
            24,
        bottom: 62 + MediaQuery.of(context).padding.bottom,
      ),
      itemCount: listViews.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        animationController?.forward();
        return listViews[index];
        /*BodyMeasurementView(
            animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                parent: animationController!,
                curve:
                Interval(index * 5, 1.0, curve: Curves.fastOutSlowIn))),
            animationController: animationController!
        )*/
      },
    );
  }

  void loadItems(scannedCode) {
    if (scannedCode.isEmpty) {
      listViews.clear();
      listViews.add(MainCard(
        cardContent: Text('No Code Detected'),
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: animationController!,
            curve: Interval((1 / 1) * 1, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: animationController!,
      ));
    } else {
      listViews.clear();
      listViews.add(MainCard(
        cardContent: employeeData(scannedCode),
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: animationController!,
            curve: Interval((1 / 1) * 1, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: animationController!,
      ));
    }
  }

  Widget employeeData(String rawResponse) {
    var res = json.decode(rawResponse);

    if ((res['error'] == true && res['valid_user'] == true) ||
        (res['error'] == true && res['valid_user'] == false))
      return Container(
        padding: EdgeInsets.all(5),
        child: BootstrapRow(children: [
          BootstrapCol(
              sizes: 'col-12',
              child: Column(
                children: [
                  Text(
                    res['msg'],
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ))
        ]),
      );

    String foundFullName = res['current_record']['full_name'];
    String foundDepartment = res['current_record']['department'];
    String foundDescription = res['current_record']['duty_description'];

    return Container(
      child: BootstrapRow(children: [
        BootstrapCol(
            sizes: 'col-12 col-sm-12 col-md-6 col-lg-4 col-xl-3',
            child: Container(
              child: Row(
                children: [
                  const Flexible(
                    flex: 1,
                    child: Icon(
                      Icons.account_circle_rounded,
                      size: 90,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          foundFullName.toUpperCase(),
                          style: const TextStyle(
                              color: DippyAppTheme.darkText,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.groups,
                              size: 15,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              foundDepartment.toUpperCase(),
                              style: const TextStyle(
                                  color: DippyAppTheme.darkText, fontSize: 13),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.info,
                              size: 15,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              foundDescription,
                              style: const TextStyle(
                                  color: DippyAppTheme.darkText, fontSize: 13),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )),
        BootstrapCol(
            sizes: 'col-12 col-sm-12 col-md-6 col-lg-4 col-xl-3',
            child: Container(
              child: Text('Employee Logs Container'),
            )),
      ]),
    );
  }

  Widget getAppBarUI() {
    return Column(
      children: <Widget>[
        AnimatedBuilder(
          animation: animationController!,
          builder: (BuildContext context, Widget? child) {
            return FadeTransition(
              opacity: topBarAnimation!,
              child: Transform(
                transform: Matrix4.translationValues(
                    0.0, 30 * (1.0 - topBarAnimation!.value), 0.0),
                child: Container(
                  decoration: BoxDecoration(
                    /*image: DecorationImage(
                      image: AssetImage('assets/images/waterwallpaper.jpg'), // Replace 'background_image.jpg' with your asset image path
                      fit: BoxFit.cover, // Adjust the BoxFit property according to your needs
                    ),*/
                    color: DippyAppTheme.white.withOpacity(topBarOpacity),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(32.0),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: DippyAppTheme.grey
                              .withOpacity(0.4 * topBarOpacity),
                          offset: const Offset(1.1, 1.1),
                          blurRadius: 10.0),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).padding.top,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: 16 - 8.0 * topBarOpacity,
                            bottom: 12 - 8.0 * topBarOpacity),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Time Log',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: DippyAppTheme.fontName,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 28 + 6 - 6 * topBarOpacity,
                                    letterSpacing: 1.2,
                                    color: DippyAppTheme.nearlyDarkBlue,
                                  ),
                                ),
                              ),
                            ),
                            TextButton.icon(
                                icon: const Icon(Icons.settings),
                                onPressed: () {},
                                label: Text('Settings'))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }

  Future<bool> loadBackgroundScanner(context) async {
    final qrScanner = BackgroundQRCodeScanner(context: context);
    await qrScanner.initializeCamera();
    return true;
  }

  @override
  void dispose() {
    animationController?.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}

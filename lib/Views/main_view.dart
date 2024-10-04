import 'package:dippy_cue/Helpers/helper.dart';
import 'package:dippy_cue/Widgets/animated_glass.dart';
import 'package:dippy_cue/Widgets/custom_numpad.dart';
import 'package:dippy_cue/Widgets/main_card.dart';
import 'package:dippy_cue/Widgets/number_req.dart';
import 'package:dippy_cue/Widgets/pop_card.dart';
import 'package:dippy_cue/components/acct_inquire.dart';
import 'package:dippy_cue/components/bill_payment.dart';
import 'package:dippy_cue/components/header_banner.dart';
import 'package:dippy_cue/dippy_themes.dart';
import 'package:flutter/material.dart';
import 'package:popup_card/popup_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> with TickerProviderStateMixin {
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

    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  Future<bool> _initializeData() async {
    print('Data Binding');
    await cardList();

    /* listViews = [];
    listViews.add(MainCard(
      cardContent: const HeaderBanner(),
      animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: animationController!,
          curve: Interval((1 / 1) * 1, 1.0, curve: Curves.fastOutSlowIn))),
      animationController: animationController!,
    )); */

    return true;
  }

  Future<List<String>> getInitialData() async {
    List<String> retval = [];
    final SharedPreferences pref = await _pref;
    retval = pref.getStringList("unpaidList")!;
    return retval;
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;

    return Container(
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: resetMenu,
          child: FutureBuilder<bool>(
            future: _initializeData(),
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              if (!snapshot.hasData) {
                return const SizedBox();
              } else {
                return Stack(
                  children: <Widget>[loadBody(context)],
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Container loadBody(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/bg_banner.jpg"),
              fit: BoxFit.cover)),
      child: Stack(
        children: <Widget>[
          getMainListViewUI2(),
          /* FutureBuilder(
                future: loadMainCards(),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return snapshot.data!;
                  } else {
                    return CircularProgressIndicator();
                  }
                }), */
          getAppBarUI(),
          SizedBox(
            height: MediaQuery.of(context).padding.bottom,
          )
        ],
      ),
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
                                  'Master Reader',
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

  Future<void> resetMenu() async {
    await Future.delayed(Duration(seconds: 5));
    print('Refreshed');
    setState(() {});
  }

  Future<void> cardList() async {
    listViews = [];
    listViews.add(Container(
      child: Text('Hello World'),
    ));
    listViews.add(Container(
      child: Text('Hello World'),
    ));
    listViews.add(Container(
      child: Text('Hello World'),
    ));
    listViews.add(Container(
      child: Text('Hello World'),
    ));
  }

  Future<Widget> loadMainCards() async {
    print('Is Refreshed');
    await cardList();
    animationController?.forward();
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

  Widget getMainListViewUI2() {
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

  Future<Widget> initData() async {
    return Text('Hello');
  }
}

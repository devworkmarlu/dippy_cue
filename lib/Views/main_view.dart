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
    _initializeData();
    super.initState();
  }

  Future<void> _initializeData() async {
    // Simulate loading data asynchronously

    await Future.delayed(Duration(seconds: 1));
    final SharedPreferences pref = await _pref;
    var deviceOrientation = MediaQuery.of(context).orientation;
    listViews.clear();
    listViews.add(MainCard(
      cardContent: const HeaderBanner(),
      animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: animationController!,
          curve: Interval((1 / 1) * 1, 1.0, curve: Curves.fastOutSlowIn))),
      animationController: animationController!,
    ));
    listViews.add(Container(
      child: (deviceOrientation == Orientation.landscape)
          ? landScapeLayout()
          : portraitLayout(),
    ));

    //listViews.add(NumberRequest(cuetype: 'RT'));

    listViews.add(Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: () async {
                    print('Hello world');
                  },
                  child: Container(
                    child: PopUpCard(
                        popUpDisplay: MainCard(
                          cardContent: Container(
                            padding: EdgeInsets.all(20),
                            child: Row(
                              children: [
                                Icon(Icons.payment_outlined),
                                Text('Regular Teller',
                                    style: DippyAppTheme.headline)
                              ],
                            ),
                          ),
                          animation: Tween<double>(begin: 0.0, end: 1.0)
                              .animate(CurvedAnimation(
                                  parent: animationController!,
                                  curve: Interval((1 / 4) * 1, 1.0,
                                      curve: Curves.fastOutSlowIn))),
                          animationController: animationController!,
                        ),
                        popUpContent: Container(
                          child: NumberRequest(cuetype: 'RT'),
                        ),
                        cardTag: 'regularteller'),
                  ),
                ),
              ),
              Expanded(
                child: PopUpCard(
                    popUpDisplay: MainCard(
                      cardContent: Container(
                        padding: EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Icon(Icons.payment_outlined),
                            Text(
                              'Priority Teller',
                              style: DippyAppTheme.headline,
                            )
                          ],
                        ),
                      ),
                      animation: Tween<double>(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                              parent: animationController!,
                              curve: Interval((1 / 4) * 1, 1.0,
                                  curve: Curves.fastOutSlowIn))),
                      animationController: animationController!,
                    ),
                    popUpContent: NumberRequest(cuetype: 'PT'),
                    cardTag: 'priorityteller'),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: PopUpCard(
                    popUpDisplay: MainCard(
                      cardContent: Container(
                        padding: EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Icon(Icons.payment_outlined),
                            Text('Regular Customer Service',
                                style: DippyAppTheme.headline)
                          ],
                        ),
                      ),
                      animation: Tween<double>(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                              parent: animationController!,
                              curve: Interval((1 / 4) * 1, 1.0,
                                  curve: Curves.fastOutSlowIn))),
                      animationController: animationController!,
                    ),
                    popUpContent: NumberRequest(cuetype: 'RC'),
                    cardTag: 'regularcustservice'),
              ),
              Expanded(
                child: PopUpCard(
                    popUpDisplay: MainCard(
                      cardContent: Container(
                        padding: EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Icon(Icons.payment_outlined),
                            Text(
                              'Priority Customer Service',
                              style: DippyAppTheme.headline,
                            )
                          ],
                        ),
                      ),
                      animation: Tween<double>(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                              parent: animationController!,
                              curve: Interval((1 / 4) * 1, 1.0,
                                  curve: Curves.fastOutSlowIn))),
                      animationController: animationController!,
                    ),
                    popUpContent: NumberRequest(cuetype: 'PC'),
                    cardTag: 'prioritycustomerservice'),
              ),
            ],
          ),
        ],
      ),
    ));

    setState(() {
      _isLoading = false;
    });
  }

  Column landScapeLayout() {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: PopUpCard(
                  popUpDisplay: Stack(
                    children: [
                      MainCard(
                        cardContent: Container(
                          padding: EdgeInsets.only(
                              left: 20, top: 20, right: 100, bottom: 20),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Column(
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.payments_rounded,
                                          size: 60,
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text('Bill Payment',
                                            style: DippyAppTheme.headline)
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  Container(
                                    child: Text(
                                        textAlign: TextAlign.justify,
                                        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
                                        style: DippyAppTheme.body1),
                                  )
                                ],
                              ))
                            ],
                          ),
                        ),
                        animation: Tween<double>(begin: 0.0, end: 1.0).animate(
                            CurvedAnimation(
                                parent: animationController!,
                                curve: Interval((1 / 2) * 1, 1.0,
                                    curve: Curves.fastOutSlowIn))),
                        animationController: animationController!,
                      ),
                      Positioned(
                        top: -10,
                        right: -80,
                        child: SizedBox(
                          width: 300,
                          height: 280,
                          child: Image.asset('assets/images/dippy_whole2.png'),
                        ),
                      ),
                    ],
                  ),
                  popUpContent: Container(
                    padding: EdgeInsets.all(15),
                    child: CustomNumpad(),
                  ),
                  cardTag: 'billingpaymentdialog'),
            ),
            Expanded(
              child: PopUpCard(
                  popUpDisplay: Stack(
                    children: [
                      MainCard(
                        cardContent: Container(
                          padding: EdgeInsets.only(
                              left: 20, top: 20, right: 100, bottom: 20),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Column(
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.support_agent_rounded,
                                          size: 60,
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text('Customer Service',
                                            style: DippyAppTheme.headline)
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  Container(
                                    child: Text(
                                        textAlign: TextAlign.justify,
                                        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
                                        style: DippyAppTheme.body1),
                                  )
                                ],
                              ))
                            ],
                          ),
                        ),
                        animation: Tween<double>(begin: 0.0, end: 1.0).animate(
                            CurvedAnimation(
                                parent: animationController!,
                                curve: Interval((1 / 3) * 1, 1.0,
                                    curve: Curves.fastOutSlowIn))),
                        animationController: animationController!,
                      ),
                      Positioned(
                        top: -10,
                        right: -80,
                        child: SizedBox(
                          width: 300,
                          height: 280,
                          child: Image.asset('assets/images/dippy_whole2.png'),
                        ),
                      ),
                    ],
                  ),
                  popUpContent: Container(
                    padding: EdgeInsets.all(15),
                    child: CustomNumpad(),
                  ),
                  cardTag: 'customerservicedialog'),
            ),
          ],
        )
      ],
    );
  }

  Column portraitLayout() {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: PopUpCard(
                  popUpDisplay: Stack(
                    children: [
                      MainCard(
                        cardContent: Container(
                          padding: EdgeInsets.only(
                              left: 20, top: 20, right: 100, bottom: 20),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Column(
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.payments_rounded,
                                          size: 60,
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text('Bill Payment',
                                            style: DippyAppTheme.headline)
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  Container(
                                    child: Text(
                                        textAlign: TextAlign.justify,
                                        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
                                        style: DippyAppTheme.body1),
                                  )
                                ],
                              ))
                            ],
                          ),
                        ),
                        animation: Tween<double>(begin: 0.0, end: 1.0).animate(
                            CurvedAnimation(
                                parent: animationController!,
                                curve: Interval((1 / 2) * 1, 1.0,
                                    curve: Curves.fastOutSlowIn))),
                        animationController: animationController!,
                      ),
                      Positioned(
                        top: -10,
                        right: -80,
                        child: SizedBox(
                          width: 300,
                          height: 280,
                          child: Image.asset('assets/images/dippy_whole2.png'),
                        ),
                      ),
                    ],
                  ),
                  popUpContent: Container(
                    padding: EdgeInsets.all(15),
                    child: CustomNumpad(),
                  ),
                  cardTag: 'billingpaymentdialog'),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: PopUpCard(
                  popUpDisplay: Stack(
                    children: [
                      MainCard(
                        cardContent: Container(
                          padding: EdgeInsets.only(
                              left: 20, top: 20, right: 100, bottom: 20),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Column(
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.support_agent_rounded,
                                          size: 60,
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text('Customer Service',
                                            style: DippyAppTheme.headline)
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  Container(
                                    child: Text(
                                        textAlign: TextAlign.justify,
                                        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
                                        style: DippyAppTheme.body1),
                                  )
                                ],
                              ))
                            ],
                          ),
                        ),
                        animation: Tween<double>(begin: 0.0, end: 1.0).animate(
                            CurvedAnimation(
                                parent: animationController!,
                                curve: Interval((1 / 3) * 1, 1.0,
                                    curve: Curves.fastOutSlowIn))),
                        animationController: animationController!,
                      ),
                      Positioned(
                        top: -10,
                        right: -80,
                        child: SizedBox(
                          width: 300,
                          height: 280,
                          child: Image.asset('assets/images/dippy_whole2.png'),
                        ),
                      ),
                    ],
                  ),
                  popUpContent: Container(
                    padding: EdgeInsets.all(15),
                    child: CustomNumpad(),
                  ),
                  cardTag: 'customerservicedialog'),
            ),
          ],
        )
      ],
    );
  }

  Future<Widget> requestNumberContainer() async {
    return Container();
  }

  void loadListViews() {
    List.generate(listofBills.length, (index) {
      listViews.add(Text('Hello World'));
    });
  }

  @override
  void dispose() {
    animationController?.dispose();
    // TODO: implement dispose
    super.dispose();
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
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/bg_banner.jpg"),
                  fit: BoxFit.cover)),
          child: Stack(
            children: <Widget>[
              getMainListViewUI2(),
              getAppBarUI(),
              SizedBox(
                height: MediaQuery.of(context).padding.bottom,
              )
            ],
          ),
        ),
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
                                  'Dippy Customer Service Kiosk',
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
        ;
      },
    );
  }

  Widget getMainListViewUI() {
    return FutureBuilder<List<String>>(
      future: getInitialData(),
      builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox();
        } else {
          return ListView.builder(
            controller: scrollController,
            padding: EdgeInsets.only(
              top: AppBar().preferredSize.height +
                  MediaQuery.of(context).padding.top +
                  24,
              bottom: 62 + MediaQuery.of(context).padding.bottom,
            ),
            itemCount: snapshot.data!.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              animationController?.forward();
              return const Text('Hello World');
            },
          );
        }
      },
    );
  }

  Future<Widget> initData() async {
    return Text('Hello');
  }
}

import 'package:dippy_cue/dippy_themes.dart';
import 'package:flutter/material.dart';

class AreaListView extends StatefulWidget {
  const AreaListView(
      {Key? key, this.mainScreenAnimationController, this.mainScreenAnimation})
      : super(key: key);

  final AnimationController? mainScreenAnimationController;
  final Animation<double>? mainScreenAnimation;
  @override
  _AreaListViewState createState() => _AreaListViewState();
}

class _AreaListViewState extends State<AreaListView>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  List<String> areaListData = <String>[
    'assets/fitness_app/service_1.png',
    'assets/fitness_app/service_2.png',
    'assets/fitness_app/service_3.png',
    'assets/fitness_app/service_4.png',
  ];

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.mainScreenAnimationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: widget.mainScreenAnimation!,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 40 * (1.0 - widget.mainScreenAnimation!.value), 0.0),
            child: AspectRatio(
              aspectRatio: 1.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: GridView(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 16, bottom: 16),
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  children: List<Widget>.generate(
                    areaListData.length,
                    (int index) {
                      final int count = areaListData.length;
                      final Animation<double> animation =
                          Tween<double>(begin: 0.0, end: 1.0).animate(
                        CurvedAnimation(
                          parent: animationController!,
                          curve: Interval((1 / count) * index, 1.0,
                              curve: Curves.fastOutSlowIn),
                        ),
                      );
                      animationController?.forward();
                      return AreaView(
                        imagepath: areaListData[index],
                        animation: animation,
                        animationController: animationController!,
                        selectedIndex: index,
                      );
                    },
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 24.0,
                    crossAxisSpacing: 24.0,
                    childAspectRatio: 1.0,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class AreaView extends StatelessWidget {
  const AreaView(
      {Key? key,
      this.imagepath,
      this.animationController,
      this.animation,
      this.selectedIndex})
      : super(key: key);

  final String? imagepath;
  final AnimationController? animationController;
  final Animation<double>? animation;
  final int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 50 * (1.0 - animation!.value), 0.0),
            child: Container(
              decoration: BoxDecoration(
                color: DippyAppTheme.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    bottomLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0),
                    topRight: Radius.circular(8.0)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: DippyAppTheme.grey.withOpacity(0.4),
                      offset: const Offset(1.1, 1.1),
                      blurRadius: 10.0),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  splashColor: DippyAppTheme.nearlyDarkBlue.withOpacity(0.2),
                  onTap: () {
                    print('Selected Index:${selectedIndex}');

                    if (selectedIndex == 0) {}

                    if (selectedIndex == 1) {}
                  },
                  child: selectedIndex == 0
                      ? Column(
                          children: <Widget>[
                            SizedBox(
                              height: 5,
                            ),
                            Text('Search Account'),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 0, left: 16, right: 16),
                              child: Image.asset(imagepath!),
                            ),
                          ],
                        )
                      : selectedIndex == 1
                          ? Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 5,
                                ),
                                Text('Reconnection'),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 0, left: 16, right: 16),
                                  child: Image.asset(imagepath!),
                                ),
                              ],
                            )
                          : selectedIndex == 2
                              ? Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text('Complaints'),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 0, left: 16, right: 16),
                                      child: Image.asset(imagepath!),
                                    ),
                                  ],
                                )
                              : selectedIndex == 3
                                  ? Column(
                                      children: <Widget>[
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text('Bills Payment'),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 0, left: 16, right: 16),
                                          child: Image.asset(imagepath!),
                                        ),
                                      ],
                                    )
                                  : Container(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

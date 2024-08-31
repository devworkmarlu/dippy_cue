import 'package:dippy_cue/dippy_themes.dart';
import 'package:flutter/material.dart';

class BoxContainer extends StatefulWidget {
  final String iconPath;
  final String title;
  final VoidCallback action;

  const BoxContainer(
      {super.key,
      required this.iconPath,
      required this.title,
      required this.action});

  @override
  State<BoxContainer> createState() => _BoxContainerState();
}

class _BoxContainerState extends State<BoxContainer> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        splashColor: DippyAppTheme.nearlyDarkBlue.withOpacity(0.2),
        onTap: () {
          widget.action;
        },
        child: Column(
          children: <Widget>[
            Text(widget.title),
            Padding(
              padding: const EdgeInsets.only(top: 0, left: 5, right: 5),
              child: Image.asset(widget.iconPath),
            ),
          ],
        ),
      ),
    );
  }
}

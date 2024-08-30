import 'dart:ui';
import 'package:dippy_cue/dippy_themes.dart';
import 'package:flutter/material.dart';

class AnimatedGlass extends StatelessWidget {
  final double blur;
  final double opacity;
  final Widget content;
  final Animation<double>? animation;
  final AnimationController? animationController;

  const AnimatedGlass(
      {Key? key,
      required this.animation,
      required this.animationController,
      required this.blur,
      required this.opacity,
      required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: new Transform(
            transform: new Matrix4.translationValues(
                0.0, 30 * (1.0 - animation!.value), 0.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
                  child: Container(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.6),
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(80),
                              bottomLeft: Radius.circular(30)),
                          border: Border.all(
                            width: 1.5,
                            color: Colors.white.withOpacity(0.1),
                          )),
                      child: content),
                ),
              ),
            ),
          ),
        );
      },
    ));
  }
}

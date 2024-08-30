import 'dart:ui';
import 'package:flutter/material.dart';

class GlassCard extends StatelessWidget {
  final double blur;
  final double opacity;
  final Widget content;

  const GlassCard(
      {Key? key,
      required this.blur,
      required this.opacity,
      required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(1.0),
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
    );
  }
}

import 'package:dippy_cue/Widgets/webview_controller.dart';
import 'package:flutter/material.dart';

class HeaderBanner extends StatelessWidget {
  const HeaderBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 250,
                child: WebViewContainer(),
              )
            ],
          )
        ],
      ),
    );
  }
}

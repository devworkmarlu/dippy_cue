import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewContainer extends StatefulWidget {
  const WebViewContainer({super.key});

  @override
  State<WebViewContainer> createState() => _WebViewContainerState();
}

class _WebViewContainerState extends State<WebViewContainer> {
  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(
        Uri.parse("http://119.93.151.12:8003/dippy_webcue/adds_container.php"));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15))),
      margin: const EdgeInsets.only(right: 30.0),
      child: WebViewWidget(
        controller: controller,
      ),
    ));
  }
}

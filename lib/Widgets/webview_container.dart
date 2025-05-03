import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewContainer2 extends StatefulWidget {
  final BuildContext ctx;
  const WebViewContainer2({super.key, required this.ctx});

  @override
  State<WebViewContainer2> createState() => _WebViewContainer2State();
}

class _WebViewContainer2State extends State<WebViewContainer2> {
  //late final WebViewController controller;
  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
      ..enableZoom(false)
      ..setJavaScriptMode(JavaScriptMode.unrestricted)

      /* ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            if (!url.startsWith("https")) {
              controller.loadRequest(Uri.parse(
                  "http://10.0.0.10/dippy_webcue")); // Block non-HTTPS URLs
            }
          },
          onWebResourceError: (WebResourceError error) {
            print("WebView error: ${error.description}");
          },
        ),
      ) */
      ..loadRequest(Uri.parse("http://10.0.0.10/dippy_webcue/cue_num.php"))
      ..addJavaScriptChannel('FlutterChannel',
          onMessageReceived: (JavaScriptMessage message) {
        print(message.message);
        displayMessage(message.message);
      });
    return SafeArea(
        child: Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15))),
      margin: const EdgeInsets.all(15.0),
      child: WebViewWidget(
        controller: controller,
      ),
    ));
  }

  void displayMessage(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Message from WebView"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }
}

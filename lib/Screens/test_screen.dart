import 'package:dippy_cue/Widgets/webview_container.dart';
import 'package:dippy_cue/Widgets/webview_controller.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Flutter Channel'),
      ),
      body: WebViewContainer2(
        ctx: context,
      ),
    );
  }
}

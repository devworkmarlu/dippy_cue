import 'package:dippy_cue/Widgets/glass_card.dart';
import 'package:dippy_cue/dippy_themes.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: DippyAppTheme.nearlyDarkBlue,
        title: const Text(
          'Dippy Kiosk',
          style: TextStyle(color: DippyAppTheme.nearlyWhite),
        ),
      ),
      body: Container(
        child: GlassCard(
            blur: 0.3,
            opacity: 0.3,
            Child: Container(
              padding: EdgeInsets.all(50),
              child: Text('Hello World'),
            )),
      ),
    );
  }
}

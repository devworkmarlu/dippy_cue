import 'package:dippy_cue/Views/main_view.dart';
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
    return const MainView();
  }
}

import 'package:dippy_cue/Screens/ems_login_screen.dart';
import 'package:dippy_cue/Screens/form_sample_page.dart';
import 'package:dippy_cue/Views/main_view.dart';
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
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton.icon(
                icon: const Icon(Icons.supervised_user_circle),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainView()));
                },
                label: const Text('CS')),
            TextButton.icon(
                icon: const Icon(Icons.data_usage_rounded),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EMSLoginScreen()));
                },
                label: const Text('EMS'))
          ],
        ),
      ),
    );
  }
}

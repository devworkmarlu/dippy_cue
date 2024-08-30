import 'package:dippy_cue/dippy_themes.dart';
import 'package:flutter/material.dart';

class AcctInquire extends StatefulWidget {
  const AcctInquire({super.key});

  @override
  State<AcctInquire> createState() => _AcctInquireState();
}

class _AcctInquireState extends State<AcctInquire> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: SizedBox(
        height: 250,
        child: Stack(
          children: [
            Container(
              child: Column(
                children: [
                  Text(
                    'Account Inquire',
                    style: DippyAppTheme.headline,
                  )
                ],
              ),
            ),
            Positioned(
              top: -10,
              right: -80,
              child: SizedBox(
                width: 300,
                height: 280,
                child: Image.asset('assets/images/dippy_whole1.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

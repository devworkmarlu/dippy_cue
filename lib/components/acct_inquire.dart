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
            Positioned(
              top: -10,
              right: -80,
              child: SizedBox(
                width: 300,
                height: 280,
                child: Image.asset('assets/images/dippy_whole1.png'),
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 100, left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Account Inquire',
                    style: DippyAppTheme.headline,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                      textAlign: TextAlign.justify,
                      "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
                      style: DippyAppTheme.body1),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Select Account Inquire',
                        style: DippyAppTheme.body1,
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

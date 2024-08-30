import 'package:dippy_cue/dippy_themes.dart';
import 'package:flutter/material.dart';

class BillPayment extends StatefulWidget {
  const BillPayment({super.key});

  @override
  State<BillPayment> createState() => _BillPaymentState();
}

class _BillPaymentState extends State<BillPayment> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(10),
      child: SizedBox(
        height: 250,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(right: 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bill Payment',
                    style: DippyAppTheme.headline,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    textAlign: TextAlign.justify,
                    "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for.",
                    style: TextStyle(),
                  )
                ],
              ),
            ),
            Positioned(
              top: -10,
              right: -90,
              child: SizedBox(
                width: 300,
                height: 280,
                child: Image.asset('assets/images/dippy_whole2.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

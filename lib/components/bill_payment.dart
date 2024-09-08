import 'package:dippy_cue/Helpers/helper.dart';
import 'package:dippy_cue/Widgets/custom_numpad.dart';
import 'package:dippy_cue/Widgets/pop_card.dart';
import 'package:dippy_cue/dippy_themes.dart';
import 'package:flutter/material.dart';
import 'package:popup_card/popup_card.dart';

class BillPayment extends StatefulWidget {
  const BillPayment({super.key});

  @override
  State<BillPayment> createState() => _BillPaymentState();
}

class _BillPaymentState extends State<BillPayment> {
  AppUtility appUtil = AppUtility();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(10),
      child: Stack(
        children: [
          Positioned(
            top: -10,
            right: -90,
            child: SizedBox(
              width: 300,
              height: 280,
              child: Image.asset('assets/images/dippy_whole2.png'),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 100, left: 10, top: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Text(
                        'Bill Payment',
                        style: DippyAppTheme.headline,
                      ),
                    )
                  ],
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
                PopUpCard(
                    popUpDisplay: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)),
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.payment_rounded,
                            size: 30,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Select Bill Payment',
                            style: DippyAppTheme.title,
                          )
                        ],
                      ),
                    ),
                    popUpContent: Container(child: CustomNumpad()),
                    cardTag: 'billpaymentdialog'),
                //appUtil.showPopUpitem(context),
                /* ElevatedButton(
                    onPressed: () {
                      appUtil.showInputAccountDialog(context);
                    },
                    child: Text(
                      'Select Bill Payment',
                      style: DippyAppTheme.body1,
                    )) */
              ],
            ),
          ),
        ],
      ),
    );
  }
}

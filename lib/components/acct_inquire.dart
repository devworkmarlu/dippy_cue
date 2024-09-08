import 'package:dippy_cue/Widgets/custom_numpad.dart';
import 'package:dippy_cue/Widgets/pop_card.dart';
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
            padding: EdgeInsets.only(right: 100, left: 10, top: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Customer Service',
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
                PopUpCard(
                    popUpDisplay: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)),
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.support_agent_rounded,
                            size: 30,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Select Customer Service',
                            style: DippyAppTheme.title,
                          )
                        ],
                      ),
                    ),
                    popUpContent: Container(child: CustomNumpad()),
                    cardTag: 'customnumpadcontext')
              ],
            ),
          ),
        ],
      ),
    );
  }
}

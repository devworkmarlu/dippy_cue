import 'package:dippy_cue/Helpers/helper.dart';
import 'package:flutter/material.dart';

class NumberRequest extends StatefulWidget {
  final String cuetype;
  const NumberRequest({super.key, required this.cuetype});

  @override
  State<NumberRequest> createState() => _NumberRequestState();
}

class _NumberRequestState extends State<NumberRequest> {
  AppUtility userFunctions = AppUtility();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: userFunctions.requestLatestNumber(widget.cuetype),
        builder: (context, snapShot) {
          if (snapShot.connectionState == ConnectionState.done) {
            String foundNumber = "";
            if (snapShot.hasData) {
              foundNumber = snapShot.data!;
            }

            return Container(
              child: Text('$foundNumber'),
            );
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}

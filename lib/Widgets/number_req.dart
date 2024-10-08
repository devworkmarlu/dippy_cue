import 'package:dippy_cue/Helpers/helper.dart';
import 'package:dippy_cue/dippy_themes.dart';
import 'package:flutter/material.dart';

class NumberRequest extends StatefulWidget {
  final String cuetype;
  const NumberRequest({super.key, required this.cuetype});

  @override
  State<NumberRequest> createState() => _NumberRequestState();
}

class _NumberRequestState extends State<NumberRequest> {
  AppUtility userFunctions = AppUtility();
  AppUtility appHelper = AppUtility();
  late String foundCueNumber;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: userFunctions.requestLatestNumber(widget.cuetype),
        builder: (context, snapShot) {
          if (snapShot.connectionState == ConnectionState.done) {
            var foundNumber = [];
            String cuetype = "";
            String cuenum = "";

            if (snapShot.hasData) {
              foundNumber = snapShot.data!;

              cuetype = foundNumber[0]['cuetype'];
              cuenum = foundNumber[0]['cuenumber'];
              foundCueNumber = cuenum;
            }

            return Container(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.receipt_long_rounded,
                        size: 60,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '$cuetype' + '$cuenum',
                        style: TextStyle(
                            fontSize: 60, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton.icon(
                          icon: Icon(Icons.numbers),
                          onPressed: () async {
                            await proceedNewNumber(context);
                          },
                          label: Text('Request Number')),
                      SizedBox(
                        width: 10,
                      ),
                      TextButton.icon(
                          icon: Icon(Icons.print),
                          onPressed: () {},
                          label: Text('Print & Request'))
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            );
          } else {
            return requestLoading();
          }
        });
  }

  Future<void> proceedNewNumber(BuildContext context) async {
    String addResponse =
        await appHelper.addNewNumber(foundCueNumber, widget.cuetype);

    if (addResponse != 'failed') {
      Navigator.of(context).pop();
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Add New Number'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(addResponse),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Okay'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      Navigator.of(context).pop();
    }
  }

  Container requestLoading() {
    return Container(
      child: Column(
        children: [
          Text(
            'Fetching lastest Number',
            style: DippyAppTheme.title,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: SizedBox(
              height: 100,
              width: 100,
              child: CircularProgressIndicator(),
            ),
          )
        ],
      ),
    );
  }
}

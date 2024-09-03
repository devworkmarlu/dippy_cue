import 'package:dippy_cue/Widgets/box_container.dart';
import 'package:dippy_cue/Widgets/custom_numpad.dart';
import 'package:dippy_cue/dippy_themes.dart';
import 'package:flutter/material.dart';

class AppUtility {
  void showInputCustomerServiceDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black45,
      transitionDuration: Duration(milliseconds: 300),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        const double buttonWidth = 100.0;
        return Center(
          child: Material(
            color: Colors.transparent,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: MediaQuery.of(context).size.width - 40,
                padding: EdgeInsets.all(20),
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'Customer Service',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Dismiss'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: Offset(0, 1),
            end: Offset(0, 0),
          ).animate(animation),
          child: child,
        );
      },
    );
  }

  void showInputAccountDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black45,
      transitionDuration: Duration(milliseconds: 300),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        const double buttonWidth = 100.0;
        return Center(
          child: Material(
            color: Colors.transparent,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: MediaQuery.of(context).size.width - 40,
                padding: EdgeInsets.all(20),
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'Bill Payment',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    CustomNumpad(),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Close'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: Offset(0, 1),
            end: Offset(0, 0),
          ).animate(animation),
          child: child,
        );
      },
    );
  }

  Widget foundAccountDetails(bool foundStatus, String imageUrl, String fullname,
      String address, bool status) {
    Widget retval = Container();

    if (foundStatus) {
      retval = Container(
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: ClipOval(
                    child: SizedBox.fromSize(
                        size: Size.fromRadius(50), // Image radius
                        child: /* Image.network(
                    'http://119.93.151.12:8003/water_flow/assets/img/avatars/1.png',
                    fit: BoxFit.cover) */
                            loadImageNetwork(imageUrl)),
                  ),
                ),
                Flexible(
                    child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        fullname.trim(),
                        style: DippyAppTheme.headline,
                      ),
                      Text(
                        address.trim(),
                        style: DippyAppTheme.subtitle,
                      ),
                      Text(
                        '(Active)',
                        style: DippyAppTheme.statusActive,
                      ),
                    ],
                  ),
                ))
              ],
            ),
          ],
        ),
      );
    } else {
      retval = Container(
        child: const Text(
          'No Account Found, Please Try-again.',
          style: DippyAppTheme.headline,
        ),
      );
    }
    return retval;
  }

  Widget loadImageNetwork(imageUrl) {
    return Image.network(
      fit: BoxFit.cover,
      imageUrl,
      // Handle the loading state
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child; // Image loaded successfully
        } else {
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        }
      },
      // Handle errors when the image fails to load
      errorBuilder:
          (BuildContext context, Object exception, StackTrace? stackTrace) {
        //http://192.168.0.253/readers_api/images/randimage/meme4.JPG
        return Image.network(
            'http://192.168.0.253/readers_api/images/randimage/meme4.JPG');
      },
    );
  }
}

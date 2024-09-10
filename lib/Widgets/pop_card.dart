import 'package:flutter/material.dart';
import 'package:popup_card/popup_card.dart';

class PopUpCard extends StatefulWidget {
  final Widget popUpDisplay;
  final Widget popUpContent;
  final String cardTag;

  const PopUpCard(
      {super.key,
      required this.popUpDisplay,
      required this.popUpContent,
      required this.cardTag});

  @override
  State<PopUpCard> createState() => _PopUpCardState();
}

class _PopUpCardState extends State<PopUpCard> {
  @override
  Widget build(BuildContext context) {
    return PopupItemLauncher(
      tag: widget.cardTag,
      child: widget.popUpDisplay,
      popUp: PopUpItem(
        padding: EdgeInsets.all(8), // Padding inside of the card
        color: Colors.white, // Color of the card
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32)), // Shape of the card
        elevation: 2, // Elevation of the card
        tag: widget.cardTag, // MUST BE THE SAME AS IN `PopupItemLauncher`
        child: Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.close)),
                ],
              ),
              widget.popUpContent,
            ],
          ),
        ), // Your custom child widget.
      ),
    );
  }
}

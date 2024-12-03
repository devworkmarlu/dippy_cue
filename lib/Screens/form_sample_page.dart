import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';

class FormsPage extends StatelessWidget {
  static const route = '/forms';
  static const title = 'Forms';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BootstrapRow(
            height: 0,
            children: [
              BootstrapCol(
                sizes: 'col-12',
                child: Container(
                  child: Text('Hello World'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

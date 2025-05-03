import 'package:flutter/foundation.dart';

class QRCodeState with ChangeNotifier {
  String _scannedCode = '';

  String get scannedCode => _scannedCode;

  void updateScannedCode(String code) {
    _scannedCode = code;
    notifyListeners(); // Notify listeners about the change
  }
}

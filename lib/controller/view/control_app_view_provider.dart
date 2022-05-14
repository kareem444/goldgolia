import 'package:flutter/foundation.dart';

class ControlAppViewProvider with ChangeNotifier {
  bool disConnected = false;
  bool showLoadingScreen = false;

  hendelDisConnected(bool val) {
    disConnected = val;
    notifyListeners();
  }

  handelLoadingScreen(bool val) {
    showLoadingScreen = val;
    debugPrint("loading screen is true");
    notifyListeners();
  }
}

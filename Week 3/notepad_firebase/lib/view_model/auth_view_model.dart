import 'package:flutter/foundation.dart';

class Auth_view_model with ChangeNotifier{

  static bool _loading = false;
  static bool get loading => _loading;

  setlaoding(bool value){
    _loading = value;
    notifyListeners();
  }
}
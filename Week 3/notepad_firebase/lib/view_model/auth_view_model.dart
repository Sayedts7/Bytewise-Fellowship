import 'package:flutter/foundation.dart';

class Auth_view_model with ChangeNotifier{

   static bool _loading = false;
   static bool get loading => _loading;

  void setlaoding(bool value){
    _loading = value;
    notifyListeners();
  }
  
  
  static bool _save = false;
  static bool get save => _save;

  void setSaving(bool value){
    _save = value;
    notifyListeners();
  }
}
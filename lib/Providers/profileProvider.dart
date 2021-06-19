import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileProvider extends ChangeNotifier
{
  bool _isAuthentificated=false;

  bool get isAuthentificated
  {
    return this._isAuthentificated ;
  }

  set isAuthentificated(bool newVal) {
    this._isAuthentificated = newVal;
    this.notifyListeners();
  }
  
}
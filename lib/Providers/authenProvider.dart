import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthenProvider extends ChangeNotifier
{
  String email,mdp;
  GlobalKey<FormState> keyForm = new GlobalKey<FormState>();

  notifier()
  {
    notifyListeners();
  }
}
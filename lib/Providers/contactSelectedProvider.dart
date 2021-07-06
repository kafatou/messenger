import 'package:flutter/material.dart';
import 'package:messenger_project/Models/Contact.dart';
import 'package:provider/provider.dart';

class ContactSelectedProvider extends ChangeNotifier
{
  int nbre=0;
  bool isSelected=false;
  List<Contact> listContactSelected=new List();

  void select()
  {
    //isSelected=true;
    
    notifyListeners();
  }
}
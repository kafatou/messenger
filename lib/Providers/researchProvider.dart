import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResearchProvider extends ChangeNotifier
{
  //String textResearch=null;

  TextEditingController controller=new TextEditingController();

  isChange()
  {
    //textResearch=value;
    notifyListeners();
  }

}
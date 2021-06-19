import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllContactProvider extends ChangeNotifier
{
  int selectItem = 0;

  changeItem(int index)
  {
    selectItem = index;
    notifyListeners();
  }
}
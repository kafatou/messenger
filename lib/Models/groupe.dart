import 'package:messenger_project/Models/Contact.dart';

class Groupe
{
  String _id;
  String _nom;
  String _urlImg;
  List<Contact> _list;

  Groupe(this._nom,this._list);

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  String get nom => _nom;

  set nom(String value) {
    _nom = value;
  }

  String get urlImg => _urlImg;

  set urlImg(String value) {
    _urlImg = value;
  }

  List get list => _list;

  set list(List<Contact> value) {
    _list = value;
  }
}
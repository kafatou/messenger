import 'package:messenger_project/Models/Contact.dart';

class GppArguments
{
  String _nom;
  String _email;
  List<Contact> _list;

  GppArguments(this._nom, this._email, this._list);

  List<Contact> get list => _list;

  set list(List<Contact> value) {
    _list = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get nom => _nom;

  set nom(String value) {
    _nom = value;
  }


}
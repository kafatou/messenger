class Userrr
{
  int _idUser;

  String _nomUser;
  String _prenomUser;
  String _emailUser;
  String _passwordUser;
  String _urlImg;

  Userrr(this._nomUser, this._prenomUser, this._emailUser,
      this._passwordUser,this._urlImg);

  String get passwordUser => _passwordUser;

  set passwordUser(String value) {
    _passwordUser = value;
  }

  String get emailUser => _emailUser;

  set emailUser(String value) {
    _emailUser = value;
  }

  String get prenomUser => _prenomUser;

  set prenomUser(String value) {
    _prenomUser = value;
  }

  String get nomUser => _nomUser;

  set nomUser(String value) {
    _nomUser = value;
  }

  String get urlImg => _urlImg;

  set urlImg(String value) {
    _urlImg = value;
  }

  int get idUser => _idUser;

  set idUser(int value) {
    _idUser = value;
  }


}
class Message
{
  String _email;
  String _message;
  bool _isImg;

  Message(this._email, this._message,this._isImg);

  Message.fromJson(dynamic obj) {
    email = obj["emailSource"];
    message = obj["message"];
    isImg=obj["isImg"];
  }

  String get message => _message;

  set message(String value) {
    _message = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  bool get isImg => _isImg;

  set isImg(bool value) {
    _isImg = value;
  }

}
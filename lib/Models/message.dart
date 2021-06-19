class Message
{
  String _email;
  String _message;

  Message(this._email, this._message);

  Message.fromJson(dynamic obj) {
    email = obj["emailSource"];
    message = obj["message"];
  }

  String get message => _message;

  set message(String value) {
    _message = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }


}
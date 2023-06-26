import 'dart:convert';

class User {
  String firstname;
  String lastname;
  String email;
  String _password;
  String _hash;

  User(this.firstname, this.lastname, this.email,
      [this._password = '', this._hash = '']);

  @override
  String toString() {
    String pwd = _password.replaceAll(RegExp(r'.'), '*');
    return ('User: $firstname $lastname, $email, $pwd');
  }

  set password(String newPassword) {
    _password = newPassword;
    _hash = base64.encode(_password.hashCode.toString().codeUnits);
  }

  void sayHello() {
    print('Hello, I\'m $firstname $lastname !');
  }

  bool authenticate(String password) {
    return _hash == base64.encode(password.hashCode.toString().codeUnits);
  }
}

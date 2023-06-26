import 'package:initiation_dart/05-poo/classes/User.dart';

class Admin extends User {
  int _grade = 1;

  Admin(String firstname, String lastname, String email,
      [String password = '', String hash = ''])
      : super(firstname, lastname, email, password, hash);

  int get grade => _grade;
  set grade(int newGrade) {
    _grade = newGrade;
  }
}

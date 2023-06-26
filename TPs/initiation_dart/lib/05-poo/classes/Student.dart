import 'package:initiation_dart/05-poo/classes/Lesson.dart';

class Student {
  String _firstname;
  String _lastname;
  List<Lesson> _lessons = [];

  Student(this._firstname, this._lastname);

  @override
  String toString() {
    return 'Student: $_firstname $_lastname, lessons: $_lessons';
  }

  String get firstname => _firstname;
  set firstname(String newFirstname) {
    _firstname = newFirstname;
  }

  String get lastname => _lastname;
  set lastname(String newLastname) {
    _lastname = newLastname;
  }

  List<Lesson> get lessons => _lessons;
  set lessons(List<Lesson> newLessons) {
    _lessons = newLessons;
  }
}
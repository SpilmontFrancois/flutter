import 'package:initiation_dart/05-poo/classes/Lesson.dart';
import 'package:initiation_dart/05-poo/classes/Student.dart';
import 'package:initiation_dart/05-poo/classes/User.dart';

void exercice5() {
  final User johndoe = User('John', 'Doe', 'john@doe.com');
  print(johndoe);

  johndoe.password = '123456';
  print(johndoe);

  johndoe.sayHello();

  print(johndoe.authenticate('123456'));
  print(johndoe.authenticate('1234567'));

  final Student johnDoe = Student('John', 'Doe');
  final Lesson italian = Lesson('Italian');

  johnDoe.lessons.add(italian);
  print(johnDoe);

  final Lesson french = Lesson('French');
  johnDoe.lessons.add(french);
  print(johnDoe);

  johnDoe.lessons.remove(italian);
  print(johnDoe);
}

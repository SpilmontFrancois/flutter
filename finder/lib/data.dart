import 'package:finder/models/bachelor.dart';
import 'package:faker/faker.dart';

List<Bachelor> createBachelors() {
  List<Bachelor> bachelors = [];
  for (int i = 0; i < 30; i++) {
    String firstName;
    Gender gender;

    if (i < 15) {
      firstName = maleFirstNames[i];
      gender = Gender.male;
    } else {
      firstName = femaleFirstNames[i - 15];
      gender = Gender.female;
    }

  bachelors.add(Bachelor(firstName, faker.person.lastName(), gender, faker.image.image()));
  }
  return bachelors;
}

List<String> maleFirstNames = [
  'Aiden',
  'Jackson',
  'Mason',
  'Liam',
  'Jacob',
  'Jayden',
  'Ethan',
  'Noah',
  'Lucas',
  'Logan',
  'Caleb',
  'Caden',
  'Jack',
  'Ryan',
  'Connor'
];
List<String> femaleFirstNames = [
  'Sophia',
  'Emma',
  'Isabella',
  'Olivia',
  'Ava',
  'Lily',
  'Chloe',
  'Madison',
  'Emily',
  'Abigail',
  'Addison',
  'Mia',
  'Madelyn',
  'Ella',
  'Hailey'
];

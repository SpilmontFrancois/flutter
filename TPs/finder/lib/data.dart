import 'package:finder/models/bachelor.dart';
import 'package:faker/faker.dart';

List<Bachelor> createBachelors() {
  List<Bachelor> bachelors = [];

  for (int i = 0; i < 30; i++) {
    String firstName;
    Gender gender;
    String image;

    if (i < 15) {
      firstName = maleFirstNames[i];
      gender = Gender.male;
      image = "images/man-${i + 1}.png";
    } else {
      firstName = femaleFirstNames[i - 15];
      gender = Gender.female;
      image = "images/woman-${(i + 1) - 15}.png";
    }

    bachelors.add(Bachelor(firstName, faker.person.lastName(), gender, image,
        null, faker.job.title(), faker.lorem.sentence()));
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

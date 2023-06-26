void exercice3() {
  final List<String> planets = [
    'Mercure',
    'Vénus',
    'Terre',
    'Mars',
    'Jupiter',
    'Saturne',
    'Uranus',
    'Neptune'
  ];
  planets.sort();
  print(planets);

  for (var planet in planets) {
    print(planet.toUpperCase());
  }

  int i = 0;
  while (i < planets.length) {
    print(planets[i][0]);
    i++;
  }

  i = 0;
  do {
    print('${i + 1} - ${planets[i]}');
    i++;
  } while (i < planets.length);

  i = 0;
  final List<String> vowels = ['a', 'e', 'i', 'o', 'u', 'y'];
  while (i < planets.length) {
    final String lastLetter = planets[i][planets[i].length - 1];
    if (vowels.contains(lastLetter.toLowerCase())) {
      print(planets[i]);
    }
    i++;
  }

  planets.add('Pluton');
  print(planets);

  final Planet mercure = Planet('Mercure', 91.69);
  final Planet saturne = Planet('Saturne', 1275);
  final Planet neptune = Planet('Neptune', 4351.40);
  final Planet jupiter = Planet('Jupiter', 628.73);
  final Planet mars = Planet('Mars', 78.34);
  final Planet venus = Planet('Venus', 41.40);
  final Planet uranus = Planet('Uranus', 2723.95);

  final List<Planet> planets2 = [
    mercure,
    saturne,
    neptune,
    jupiter,
    mars,
    venus,
    uranus
  ];

  planets2.sort((Planet a, Planet b) =>
      a.distanceFromEarth.compareTo(b.distanceFromEarth));
  print(planets2);

  Map<String, String> apollo = {
    '07_1969': 'Apollo 11',
    '11_1969': 'Apollo 12',
    '02_1971': 'Apollo 14',
    '07_1971': 'Apollo 15',
    '04_1972': 'Apollo 16',
    '12_1972': 'Apollo 17'
  };

  print(apollo);
  print(apollo['07_1971']);
  print(apollo.keys);
  print(apollo.values);

  apollo['07_1969'] = 'Neil Armstrong + Buzz Aldrin';
  print(apollo['07_1969']);

  SolarSystemElement sun = SolarSystemElement('Soleil', Kind.star);
  SolarSystemElement earth = SolarSystemElement('Terre', Kind.planet);
  SolarSystemElement moon = SolarSystemElement('Lune', Kind.satelitte);
  SolarSystemElement pluton = SolarSystemElement('Pluton', Kind.planet);
  print(sun);
  print(earth);
  print(moon);
  print(pluton);
}

class Planet {
  String name;
  double distanceFromEarth;

  Planet(this.name, this.distanceFromEarth);

  @override
  String toString() {
    return 'Planet{name: $name, distanceFromEarth: $distanceFromEarth}';
  }
}

enum Kind { planet, star, satelitte, asteroid, comet }

class SolarSystemElement {
  String name;
  Kind kind;

  SolarSystemElement(this.name, this.kind);

  @override
  String toString() {
    return 'SolarSystemElement{name: $name, kind: $kind}';
  }
}

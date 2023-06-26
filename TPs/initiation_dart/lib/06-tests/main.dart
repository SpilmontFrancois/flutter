void exercice6() {
  assert(sum(1, 1) == 2);
  assert(sum(1, 2) == 3);

  assert(sum(1, 1) == 2, sumFails(1, 1));

  dynamic something;
  something = 7;
  print(something.runtimeType);
  assert(something is int);

  something = 'Seven';
  print(something.runtimeType);
  assert(something is String);
}

int sum(int a, int b) {
  return (a + b);
}

Never sumFails(int a, int b) {
  throw ArgumentError('Erreur');
}

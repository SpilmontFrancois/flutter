void exercice1() {
  // const String message = 'Hello, World !';
  // print(message);

  // const String hello = 'Hello';
  // const String world = 'World';

  // print('$hello, $world !');

  // print(hello.toUpperCase() + ', ' + world.toUpperCase() + ' !');

  // print(message.split(',')[0]);

  // print(message.length);

  // const String welcome = 'Hello, World !';
  // print(welcome.replaceAll('e', '3').replaceAll('l', '1').replaceAll('o', '8').toUpperCase());

  const String welcome = 'Hello World';
  final List<String> words = welcome.split(' ');
  print(words);

  final String pwd = '';
  print(pwd.isEmpty ? 'Mot de passe manquant' : 'Mot de passe fourni');

  final String email = 'john@doe.com';
  print(email.contains('@') && email.contains('.')
      ? 'Email valide'
      : 'Email invalide');
}

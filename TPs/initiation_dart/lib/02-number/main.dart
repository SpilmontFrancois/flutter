void exercice2() {
  final int price1 = 10;
  final double price2 = 10.27;

  print(price1);
  print(price2);

  final sum = price1 + price2;
  print(sum.runtimeType);

  print(sum.toInt());

  final String strSeven = '7';
  final int numSeven = int.parse(strSeven);
  print(numSeven);
}

void exercice4() {
  print(sayHello('world'));

  print(sum(1, 2));

  final List<int> numbers = [1, 2, 3, 4, 5];
  print(sumMany(numbers));

  sumAndPrint(1, 2, true);
  sumAndPrint(1, 2, false);

  print(sumAndFormat(1, 2));
  print(sumAndFormat(1, 2, ft: 'int'));
  print(sumAndFormat(1, 2, ft: 'double'));
  // print(sumAndFormat(1, 2, ft: 'bool'));

  final String Function(String) strReverse = (String str) {
    return (str.split('').reversed.join());
  };

  final String hello = 'Hello';
  final String reversed = strReverse(hello);
  print(reversed);

  fibonacci(17);
}

String sayHello(String param) {
  return ('Hello, $param !');
}

int sum(int a, int b) {
  return (a + b);
}

int sumMany(List<int> numbers) {
  int sum = 0;
  for (var number in numbers) {
    sum += number;
  }
  return (sum);
}

void sumAndPrint(num param1, num param2, bool? shouldPrint) {
  final num result = param1 + param2;
  if (shouldPrint == true) {
    print(result);
  }
}

num sumAndFormat(num param1, num param2, {String? ft}) {
  final num result = param1 + param2;

  if (ft == null) {
    return (result);
  } else if (ft == 'int') {
    return (result.toInt());
  } else if (ft == 'double') {
    return (result.toDouble());
  } else {
    throw ('ft must be int or double');
  }
}

void fibonacci(int n) {
  int a = 0;
  int b = 1;
  int c = 0;

  for (int i = 0; i < n; i++) {
    print(c);
    a = b;
    b = c;
    c = a + b;
  }
}

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 1;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  bool isPrimeNumber(int number) {
    if (number <= 1) {
      return false;
    }
    for (int i = 2; i < number; i++) {
      if (number % i == 0) return false;
    }
    return true;
  }

  String counterType() {
    if (isPrimeNumber(_counter - 1)) {
      return 'nombre premier';
    } else if ((_counter - 1) % 2 == 0) {
      return 'pair';
    } else {
      return 'impair';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: (_counter - 1) != 0
            ? Text('${_counter - 1} : ${counterType()}')
            : const Text('Pomme, Poire et Ananas'),
      ),
      body: ListView.builder(
        itemCount: _counter - 1,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Row(
              children: [
                if (isPrimeNumber(index + 1))
                  Image.asset(
                    'images/ananas.png',
                    width: 32,
                    height: 32,
                  )
                else if ((index + 1) % 2 == 0)
                  Image.asset(
                    'images/poire.png',
                    width: 32,
                    height: 32,
                  )
                else
                  Image.asset(
                    'images/pomme.png',
                    width: 32,
                    height: 32,
                  ),
                Text('${index + 1}'),
              ],
            ),
            textColor: Colors.white,
            tileColor: index % 2 == 0 ? Colors.cyan : Colors.indigo,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

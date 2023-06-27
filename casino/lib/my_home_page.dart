import 'package:flutter/material.dart';
import 'dart:math';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter1 = 0;
  int _counter2 = 0;
  int _counter3 = 0;
  final Map<int, String> _images = {
    1: 'images/bar.png',
    2: 'images/cerise.png',
    3: 'images/cloche.png',
    4: 'images/diamant.png',
    5: 'images/fer-a-cheval.png',
    6: 'images/pasteque.png',
    7: 'images/sept.png',
  };

  void _incrementCounter() {
    setState(() {
      _counter1 = Random().nextInt(7) + 1;
      _counter2 = Random().nextInt(7) + 1;
      _counter3 = Random().nextInt(7) + 1;
    });
  }

  String _isWon() {
    String result = '';
    if (_counter1 == _counter2 && _counter2 == _counter3) {
      if (_counter1 == 7) {
        result = 'big_win';
      } else {
        result = 'normal_win';
      }
    } else {
      result = 'lost';
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:
            _isWon() != 'lost' && _counter1 != 0 ? Colors.yellow : Colors.white,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Casino'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (_counter1 == 0)
                const Text(
                    'Welcome to the Casino ! \n Press the button to play',
                    style: TextStyle(fontSize: 30))
              else
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      _images[_counter1]!,
                      width: 100,
                    ),
                    Image.asset(
                      _images[_counter2]!,
                      width: 100,
                    ),
                    Image.asset(
                      _images[_counter3]!,
                      width: 100,
                    ),
                  ],
                ),
              if (_isWon() == 'normal_win' && _counter1 != 0)
                const Text(
                  'JACKPOT !',
                  style: TextStyle(fontSize: 30),
                )
              else if (_isWon() == 'big_win' && _counter1 != 0)
                const Text(
                  'BIG JACKPOT !',
                  style: TextStyle(fontSize: 30),
                )
              else if (_counter1 != 0)
                const Text(
                  'You lost, try again !',
                  style: TextStyle(fontSize: 30),
                ),
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Play !',
              child: const Icon(Icons.casino),
            ),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  _counter1 = _counter2 = _counter3 = Random().nextInt(7) + 1;
                });
              },
              tooltip: 'Win !',
              child: const Icon(Icons.one_k_plus),
            ),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  _counter1 = 7;
                  _counter2 = 7;
                  _counter3 = 7;
                });
              },
              tooltip: 'Big Win !',
              child: const Icon(Icons.seven_k_plus),
            ),
          ],
        ));
  }
}

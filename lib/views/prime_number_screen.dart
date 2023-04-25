import 'dart:async';
import 'dart:isolate';
import 'package:flutter/cupertino.dart';

class PrimeNumberScreen extends StatefulWidget {
  const PrimeNumberScreen({Key? key, required this.intensity})
      : super(key: key);

  final int intensity;

  @override
  _PrimeNumberScreenState createState() => _PrimeNumberScreenState();
}

class _PrimeNumberScreenState extends State<PrimeNumberScreen> {
  String _result = '';

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Prime Number Calculation'),
      ),
      child: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 20),
            CupertinoButton.filled(
              onPressed: () async {
                setState(() {
                  _result = 'Calculating...';
                });
                await _findPrimeNumbers(widget.intensity);
              },
              child: const Text('Start Calculation'),
            ),
            const SizedBox(height: 20),
            Text(
              _result,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _findPrimeNumbers(int iterations) async {
    final response = ReceivePort();
    await Isolate.spawn(
      _calculatePrimeNumbers,
      _IsolateData(response.sendPort, iterations),
    );

    response.listen((primeNumber) {
      if (mounted) {
        setState(() {
          _result = 'Latest prime: $primeNumber';
        });
      }
    });
  }
}

class _IsolateData {
  final SendPort sendPort;
  final int iterations;

  _IsolateData(this.sendPort, this.iterations);
}

void _calculatePrimeNumbers(_IsolateData data) {
  int count = 0;
  int n = 2;

  while (count < data.iterations) {
    if (_isPrime(n)) {
      count++;
      data.sendPort.send(n);
    }
    n++;
  }
}

bool _isPrime(int number) {
  if (number < 2) return false;
  for (int i = 2; i <= number ~/ 2; i++) {
    if (number % i == 0) return false;
  }
  return true;
}

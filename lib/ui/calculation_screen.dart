import 'package:flutter/cupertino.dart';

class CalculationScreen extends StatefulWidget {
  final int intensity;

  const CalculationScreen({super.key, required this.intensity});

  @override
  _CalculationScreenState createState() => _CalculationScreenState();
}

class _CalculationScreenState extends State<CalculationScreen> {
  BigInt? _currentNumber;
  bool _calculating = false;
  Stopwatch? _stopwatch;

  BigInt _fibonacci(int n) {
    BigInt a = BigInt.zero, b = BigInt.one, temp;
    for (int i = 0; i < n; i++) {
      temp = a + b;
      a = b;
      b = temp;
    }
    return a;
  }

  void _startCalculation() async {
    _stopwatch = Stopwatch()..start();
    setState(() {
      _calculating = true;
    });
    for (int i = 0; i < widget.intensity; i++) {
      final result = _fibonacci(i);
      setState(() {
        _currentNumber = result;
      });
    }
    setState(() {
      _calculating = false;
    });
    _stopwatch?.stop();
  }

  @override
  Widget build(BuildContext context) {
    final timeElapsed =
        _stopwatch != null ? _stopwatch!.elapsed.inMicroseconds : 0;
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Kalkulacija'),
      ),
      child: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Rezultat: ',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                _calculating
                    ? const CupertinoActivityIndicator()
                    : Text(
                        'Trajanje: $timeElapsed µs',
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                const SizedBox(height: 20),
                Text(
                  '${_currentNumber ?? '-'}',
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 20),
                CupertinoButton.filled(
                  onPressed: _startCalculation,
                  child: const Text('Pokreni zadatak'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

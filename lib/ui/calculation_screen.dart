import 'package:flutter/cupertino.dart';

class CalculationScreen extends StatefulWidget {
  final int intensity;

  const CalculationScreen({required this.intensity, Key? key})
      : super(key: key);

  @override
  _CalculationScreenState createState() => _CalculationScreenState();
}

class _CalculationScreenState extends State<CalculationScreen> {
  double? _currentNumber;
  bool _calculating = false;
  final Stopwatch _stopwatch = Stopwatch();

  double _calculate(int n) {
    double temp = 0;
    for (int i = 0; i < n; i++) {
      temp = temp + 2;
      temp = temp / 4;
      temp = temp * 2;
    }
    return temp;
  }

  void _startCalculation() {
    _stopwatch
      ..reset()
      ..start();
    setState(() {
      _calculating = true;
    });
    final result = _calculate(widget.intensity);
    _currentNumber = result;

    setState(() {
      _calculating = false;
    });
    _stopwatch.stop();
  }

  @override
  Widget build(BuildContext context) {
    final timeElapsed = _stopwatch.elapsedMicroseconds;
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Center(
                    child: Text(
                      _currentNumber == null
                          ? '-'
                          : 'Izvedeno ${widget.intensity}  operacija zbrajanja, dijeljenja i množenja.',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
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

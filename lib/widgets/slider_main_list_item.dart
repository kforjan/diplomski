import 'package:flutter/cupertino.dart';

class MainScreenItem extends StatefulWidget {
  const MainScreenItem({
    required this.title,
    required this.onStart,
    Key? key,
  }) : super(key: key);

  final String title;
  final Function(int) onStart;

  @override
  _MainScreenItemState createState() => _MainScreenItemState();
}

class _MainScreenItemState extends State<MainScreenItem> {
  double _sliderValue = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8.0),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.title,
            style: CupertinoTheme.of(context).textTheme.textStyle,
          ),
        ),
        const SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text('Intenzitet'),
            CupertinoSlider(
              value: _sliderValue,
              min: 1,
              max: 5,
              divisions: 4,
              onChanged: (double value) {
                setState(() {
                  _sliderValue = value;
                });
              },
            ),
            Text(_sliderValue.toInt().toString()),
          ],
        ),
        const SizedBox(height: 8.0),
        CupertinoButton.filled(
          onPressed: () {
            widget.onStart(_sliderValue.toInt());
          },
          child: const Text('Pokreni'),
        ),
      ],
    );
  }
}

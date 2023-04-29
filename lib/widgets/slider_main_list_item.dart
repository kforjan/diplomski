import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class MainScreenItem extends StatefulWidget {
  const MainScreenItem({
    required this.title,
    required this.onStart,
    this.showIntensitySlider = true,
    Key? key,
  }) : super(key: key);

  final String title;
  final Function(int) onStart;
  final bool showIntensitySlider;

  @override
  _MainScreenItemState createState() => _MainScreenItemState();
}

class _MainScreenItemState extends State<MainScreenItem> {
  double _sliderValue = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: CupertinoColors.systemGroupedBackground,
      ),
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            widget.title,
            style: CupertinoTheme.of(context).textTheme.navTitleTextStyle,
          ),
          const SizedBox(height: 8.0),
          widget.showIntensitySlider
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text('Intenzitet'),
                    CupertinoSlider(
                      value: _sliderValue,
                      min: 1,
                      max: 5,
                      divisions: 4,
                      onChanged: (double value) {
                        HapticFeedback.lightImpact();
                        setState(() {
                          _sliderValue = value;
                        });
                      },
                    ),
                    Text(_sliderValue.toInt().toString()),
                  ],
                )
              : Container(),
          const SizedBox(height: 8.0),
          CupertinoButton.filled(
            onPressed: () {
              widget.onStart(_sliderValue.toInt());
            },
            child: const Text('Pokreni'),
          ),
        ],
      ),
    );
  }
}

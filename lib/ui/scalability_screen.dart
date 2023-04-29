import 'package:flutter/cupertino.dart';

class ScalabilityScreen extends StatefulWidget {
  final int intensity;

  const ScalabilityScreen({Key? key, required this.intensity})
      : super(key: key);

  @override
  _ScalabilityScreenState createState() => _ScalabilityScreenState();
}

class _ScalabilityScreenState extends State<ScalabilityScreen> {
  @override
  Widget build(BuildContext context) {
    List<Widget> _buildInterfaceElements() {
      List<Widget> elements = [];

      for (int i = 0; i < widget.intensity; i++) {
        if (i % 4 == 0) {
          elements.add(
            Container(
              margin: const EdgeInsets.all(4.0),
              child: CupertinoButton(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                onPressed: () {},
                color: CupertinoColors.activeBlue,
                child: Text('Gumb $i'),
              ),
            ),
          );
        } else if (i % 4 == 1) {
          elements.add(
            Container(
              margin: const EdgeInsets.all(4.0),
              child: Icon(
                CupertinoIcons.add,
                semanticLabel: 'Ikona $i',
                size: 24,
              ),
            ),
          );
        } else if (i % 4 == 2) {
          elements.add(
            Container(
              margin: const EdgeInsets.all(4.0),
              child: Text(
                'Oznaka $i',
                style: CupertinoTheme.of(context).textTheme.textStyle,
              ),
            ),
          );
        } else {
          elements.add(
            Container(
              margin: const EdgeInsets.all(4.0),
              width: 100,
              child: CupertinoTextField(
                placeholder: 'Mali $i',
              ),
            ),
          );
        }
      }

      return elements;
    }

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Skalabilnost korisničkog sučelja'),
      ),
      child: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Wrap(
              children: _buildInterfaceElements(),
            ),
          ),
        ),
      ),
    );
  }
}

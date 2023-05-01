import 'package:flutter/cupertino.dart';
import 'package:flutter_and_native_ios_comparison/ui/main_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Usporedba Flutter i nativne iOS aplikacije',
      home: CupertinoPageScaffold(
          navigationBar: const CupertinoNavigationBar(
            middle: Text(
              'Usporedba Flutter i nativne iOS aplikacije',
              style: TextStyle(fontSize: 15),
            ),
          ),
          child: MainScreen()),
    );
  }
}

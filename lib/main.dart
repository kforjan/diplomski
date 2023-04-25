import 'package:flutter/cupertino.dart';
import 'package:flutter_and_native_ios_comparison/views/main_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Usporedba Flutter i nativne iOS aplikacije',
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(
            'Usporedba Flutter i nativne iOS aplikacije',
            style: TextStyle(fontSize: 15),
          ),
        ),
        child: MainView(),
      ),
    );
  }
}

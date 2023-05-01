import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_and_native_ios_comparison/data/local/database.dart';
import 'package:flutter_and_native_ios_comparison/ui/animation_screen.dart';
import 'package:flutter_and_native_ios_comparison/ui/calculation_screen.dart';
import 'package:flutter_and_native_ios_comparison/ui/database_screen.dart';
import 'package:flutter_and_native_ios_comparison/ui/native_feature_screen.dart';
import 'package:flutter_and_native_ios_comparison/ui/scalability_screen.dart';
import 'package:flutter_and_native_ios_comparison/widgets/slider_main_list_item.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final database = MyDatabase();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          MainScreenItem(
            title: 'Skalabilnost korisničkog sučelja',
            onStart: (value) {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (context) => ScalabilityScreen(
                    intensity: pow(7, value).toInt(),
                  ),
                ),
              );
            },
          ),
          MainScreenItem(
            title: 'Animacija',
            onStart: (value) {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (context) => AnimationScreen(
                    intensity: pow(10, value).toInt(),
                  ),
                ),
              );
            },
          ),
          MainScreenItem(
            title: 'Računanje - CPU opterečenje',
            onStart: (value) {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (context) => CalculationScreen(
                    intensity: pow(10, value).toInt() * 10000,
                  ),
                ),
              );
            },
          ),
          MainScreenItem(
            title: 'SQLite baza podataka',
            onStart: (value) {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (context) => DatabaseScreen(
                    numberOfUsers: pow(10, value - 1).toInt(),
                    database: database,
                  ),
                ),
              );
            },
          ),
          MainScreenItem(
            title: 'Rad s nativnim značajkama',
            showIntensitySlider: false,
            onStart: (value) {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (context) => const NativeFeaturesScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

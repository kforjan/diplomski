import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_and_native_ios_comparison/views/animation_view.dart';
import 'package:flutter_and_native_ios_comparison/views/prime_number_screen.dart';
import 'package:flutter_and_native_ios_comparison/widgets/slider_main_list_item.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          MainScreenItem(
            title: 'Animacija',
            onStart: (value) {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (context) => IntensiveAnimationScreen(
                    intensity: pow(10, value).toInt(),
                  ),
                ),
              );
            },
          ),
          MainScreenItem(
            title: 'Pokretanje testne animacije',
            onStart: (value) {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (context) => PrimeNumberScreen(
                    intensity: pow(10, value).toInt(),
                  ),
                ),
              );
            },
          ),
          // MainScreenItem(
          //   title: 'Ucitavanje testnog zaslona',
          //   onLeft: () {},
          //   onRight: () {},
          // ),
          // MainScreenItem(
          //   title: 'Ucitavanje testnog zaslona',
          //   onLeft: () {},
          //   onRight: () {},
          // ),
        ],
      ),
    );
  }
}

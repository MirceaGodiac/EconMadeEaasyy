import 'dart:io';
import 'dart:ui';

import 'package:econ_made_easy_files/Aplication_Screens/Exercitii%20Group/SelectExerciseTypeScreen.dart';
import 'package:econ_made_easy_files/Aplication_Screens/manuals%20group/manuals_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_detector/flutter_swipe_detector.dart';

class manualsList extends StatefulWidget {
  const manualsList({super.key});

  @override
  State<manualsList> createState() => _manualsListState();
}

class _manualsListState extends State<manualsList>
    with TickerProviderStateMixin {
  static int pageIndex = 0;
  late AnimationController controller;

  final pageController = PageController(initialPage: 0);
  @override
  void dispose() {
    pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSizeData = MediaQuery.of(context);
    double screenWidth = screenSizeData.size.width;
    return Stack(alignment: Alignment.center, children: [
      Container(
        margin: const EdgeInsets.only(top: 20, bottom: 20),
        width: 1100,
        height: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(60), bottomLeft: Radius.circular(60)),
          child: Image.asset(
            'lib/images/logindoodle.jpg',
            filterQuality: FilterQuality.medium,
            fit: BoxFit.cover,
          ),
        ),
      ),
      SizedBox(
        width: screenWidth * (9 / 10 - 1 / 40) - 50,
        height: double.infinity,
        child: Container(
          color: Colors.black87,
        ),
      ),
      Container(
        width: screenWidth * (9 / 10 - 1 / 40) - 50,
        margin: const EdgeInsets.only(top: 20, bottom: 20),
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Colors.white12,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(60), bottomLeft: Radius.circular(60)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Manuale de matematica, in format digital',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w400),
            ),
            Text(
              'pentru toate clasele de gimnaziu, toate intr-un singur loc.',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const ManualsScreen();
                  },
                ));
              },
              child: Container(
                width: 400,
                height: 60,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Colors.blue),
                child: const Center(
                  child: Text(
                    'Hai sa incepem!',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}

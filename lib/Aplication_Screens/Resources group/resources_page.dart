import 'dart:io';
import 'dart:ui';

import 'package:econ_made_easy_files/Aplication_Screens/Exercitii%20Group/SelectExerciseTypeScreen.dart';
import 'package:econ_made_easy_files/Aplication_Screens/Resources%20group/search_resource_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_detector/flutter_swipe_detector.dart';

class InfoScreen1 extends StatelessWidget {
  const InfoScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 240,
          child: Image.asset(
            'lib/images/Illustration34_1.png',
            filterQuality: FilterQuality.medium,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        const Text(
          'Resurse scrise si video pentru EN',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        const Text(
          'Create de specialist',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}

class InfoScreen2 extends StatelessWidget {
  const InfoScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 240,
          child: Image.asset(
            'lib/images/Illustration37.png',
            filterQuality: FilterQuality.medium,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        const Text(
          'Sute de modele de test in format PDF',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        const Text(
          'Pentru a te ajuta la examen.',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}

class InfoScreen3 extends StatelessWidget {
  const InfoScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 240,
          child: Image.asset(
            'lib/images/Duplicat_2.png',
            filterQuality: FilterQuality.medium,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        const Text(
          'Alege singur ce doresti sa inveti',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        const Text(
          'Pentru a invata mai eficient',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}

class ResourcesList extends StatefulWidget {
  const ResourcesList({super.key});

  @override
  State<ResourcesList> createState() => _ResourcesListState();
}

class _ResourcesListState extends State<ResourcesList>
    with TickerProviderStateMixin {
  static int pageIndex = 0;
  var pages = const [
    InfoScreen1(),
    InfoScreen2(),
    InfoScreen3(),
  ];
  late AnimationController controller;

  final pageController = PageController(initialPage: 0);
  @override
  void dispose() {
    pageController.dispose();
    controller.dispose();

    super.dispose();
  }

  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
      animationBehavior: AnimationBehavior.values.last,
    )..addListener(() {
        setState(() {
          if (controller.value > 0.99) {
            debugPrint('hello');
            if (pageIndex < 3) {
              pageIndex++;
              pageController.jumpToPage(pageIndex);
            } else {
              pageIndex = 0;
              pageController.jumpToPage(pageIndex);
            }
          }
        });
      });

    controller.repeat(reverse: false);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      Container(
        margin: const EdgeInsets.only(top: 20, bottom: 20),
        width: 1100,
        height: double.infinity,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(60),
          ),
          child: Image.asset(
            'lib/images/logindoodle.jpg',
            filterQuality: FilterQuality.medium,
            fit: BoxFit.cover,
          ),
        ),
      ),
      SizedBox(
        width: 1100,
        height: double.infinity,
        child: Container(
          color: Colors.black87,
        ),
      ),
      Container(
        margin: const EdgeInsets.only(top: 20, bottom: 20),
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Colors.white12,
          borderRadius: BorderRadius.all(
            Radius.circular(60),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              'Resurse de invatat pentru EN',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 402,
              width: 600,
              child: PageView(
                controller: pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  InfoScreen1(),
                  InfoScreen2(),
                  InfoScreen3(),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return searchMaterials();
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
            Container(
              width: 600,
              margin: const EdgeInsets.symmetric(horizontal: 250),
              child: LinearProgressIndicator(
                backgroundColor: Colors.white,
                color: Colors.blue.shade200,
                minHeight: 5,
                value: controller.value,
                semanticsLabel: 'Linear progress indicator',
              ),
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    ]);
  }
}

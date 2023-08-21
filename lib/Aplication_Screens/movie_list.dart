import 'dart:ui';

import '../Aplication_Screens/Exercitii%20Group/SelectExerciseTypeScreen.dart';
import 'package:flutter/material.dart';

class InfoScreen1 extends StatelessWidget {
  const InfoScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 300,
          child: Image.asset(
            'lib/images/Illustration34_1.png',
            filterQuality: FilterQuality.medium,
          ),
        ),
        const SizedBox(
          height: 22,
        ),
        const Text(
          'Sute de exerciții pentru EN',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        const Text(
          'Complete cu rezolvări.',
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
          height: 300,
          child: Image.asset(
            'lib/images/eatramen.png',
            filterQuality: FilterQuality.medium,
          ),
        ),
        const SizedBox(
          height: 22,
        ),
        const Text(
          'Mii de teste si modele posibile',
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
          height: 300,
          child: Image.asset(
            'lib/images/Duplicat_2.png',
            filterQuality: FilterQuality.medium,
          ),
        ),
        const SizedBox(
          height: 22,
        ),
        const Text(
          'Alege-ți singur ce dorești să înveți',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        const Text(
          'Pentru a învăța mai eficient',
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

class MovieList extends StatefulWidget {
  const MovieList({super.key});

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> with TickerProviderStateMixin {
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
              height: 20,
            ),
            SizedBox(
              width: 800,
              height: 402,
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
                    return SelectExerciseTypeScreen(
                      length: 0,
                    );
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
                    'Hai să începem!',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
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

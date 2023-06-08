import 'package:flutter/material.dart';

class InfoScreen1 extends StatelessWidget {
  const InfoScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 400,
          child: Image.asset(
            'lib/images/Illustration34_1.png',
            filterQuality: FilterQuality.medium,
          ),
        ),
        Text(
          'Ai nevoie de ajutor la mate pentru Evaluarea Nationala?',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          'Ai venit unde trebuie!',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w400,
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
          height: 400,
          child: Image.asset(
            'lib/images/Illustration37.png',
            filterQuality: FilterQuality.medium,
          ),
        ),
        Text(
          'Zeci de modele de teste si multe resurse de incredere',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          'Pentru a te ajuta la examen.',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w400,
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
          height: 400,
          child: Image.asset(
            'lib/images/Duplicat_2.png',
            filterQuality: FilterQuality.medium,
          ),
        ),
        Text(
          'Teste personalizate pentru orice exercitii de la EN',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          'Cu recompense pe masura.',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }
}

class BootupScreen extends StatefulWidget {
  const BootupScreen({super.key});

  @override
  State<BootupScreen> createState() => _BootupScreenState();
}

class _BootupScreenState extends State<BootupScreen>
    with TickerProviderStateMixin {
  static int pageIndex = 0;
  var pages = [
    InfoScreen1(),
    InfoScreen2(),
    InfoScreen3(),
  ];
  late AnimationController controller;
  @override
  void initState() {
    controller = AnimationController(
      /// [AnimationController]s can be created with `vsync: this` because of
      /// [TickerProviderStateMixin].
      vsync: this,
      duration: const Duration(seconds: 5),
      animationBehavior: AnimationBehavior.values.last,
    )..addListener(() {
        setState(() {});
        print('yes.');
      });
    controller.repeat(reverse: false);

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              'E N  A B L E  ',
              style: TextStyle(fontSize: 80, fontWeight: FontWeight.w100),
            ),
          ),
          pages[pageIndex],
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 250),
            child: LinearProgressIndicator(
              value: controller.value,
              semanticsLabel: 'Linear progress indicator',
            ),
          ),
          const SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}

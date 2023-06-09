import 'package:econ_made_easy_files/Aplication_Screens/Login%20group/welcome_screen.dart';
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
        const Text(
          'Ai nevoie de ajutor la mate pentru Evaluarea Nationala?',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w400,
          ),
        ),
        const Text(
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
          height: 300,
          child: Image.asset(
            'lib/images/Illustration37.png',
            filterQuality: FilterQuality.medium,
          ),
        ),
        const Text(
          'Zeci de modele de teste si multe resurse de incredere',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w400,
          ),
        ),
        const Text(
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
          height: 300,
          child: Image.asset(
            'lib/images/Duplicat_2.png',
            filterQuality: FilterQuality.medium,
          ),
        ),
        const Text(
          'Teste personalizate pentru orice exercitii de la EN',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w400,
          ),
        ),
        const Text(
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

class InfoScreen4 extends StatelessWidget {
  const InfoScreen4({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 300,
          child: Image.asset(
            'lib/images/Duplicat.png',
            filterQuality: FilterQuality.medium,
          ),
        ),
        const Text(
          'Orar personalizat pentru organizarea studiilor',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w400,
          ),
        ),
        const Text(
          'Pentru a te ajuta cu invatatul.',
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
  var pages = const [
    InfoScreen1(),
    InfoScreen2(),
    InfoScreen3(),
    InfoScreen4(),
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
      /// [AnimationController]s can be created with `vsync: this` because of
      /// [TickerProviderStateMixin].
      vsync: this,
      duration: const Duration(seconds: 5),
      animationBehavior: AnimationBehavior.values.last,
    )..addListener(() {
        setState(() {
          if (controller.value >= 0.99) {
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

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SizedBox(
          height: double.infinity,
          child: Image.asset(
            'lib/images/logindoodle.jpg',
            filterQuality: FilterQuality.medium,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: double.infinity,
          margin: const EdgeInsets.only(top: 30, left: 280, right: 280),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(60),
              topRight: Radius.circular(60),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'E N',
                    style: TextStyle(
                      fontSize: 82,
                      fontWeight: FontWeight.w300,
                      color: Colors.blue,
                    ),
                  ),
                  Text(
                    ' A B L E  ',
                    style: TextStyle(fontSize: 80, fontWeight: FontWeight.w100),
                  ),
                ],
              ),
              SizedBox(
                height: 400,
                child: PageView(
                  controller: pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    InfoScreen1(),
                    InfoScreen2(),
                    InfoScreen3(),
                    InfoScreen4(),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 250),
                child: LinearProgressIndicator(
                  backgroundColor: Colors.white,
                  color: Colors.blue.shade200,
                  minHeight: 20,
                  value: controller.value,
                  semanticsLabel: 'Linear progress indicator',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return WelcomePage();
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
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

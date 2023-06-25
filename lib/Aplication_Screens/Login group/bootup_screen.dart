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

class _BootupScreenState extends State<BootupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SizedBox(
          height: double.infinity,
          child: Image.asset(
            'lib/images/welcomeImage.jpeg',
            filterQuality: FilterQuality.medium,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Te-ai pierdut invatand \npentru evaluarea nationala?',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 80),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Hai sa te ducem pe drumul potrivit.',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 40),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                width: 300,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  color: Colors.blue.shade600,
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const WelcomePage();
                      },
                    ));
                  },
                  child: const Center(
                    child: Text(
                      'Incepe',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 20),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 75,
              ),
              const Text(
                'Mii de exercitii pentru evaluarea nationala\nsi sute de resurse pentru a te ajuta.*',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w100,
                    fontSize: 20),
              )
            ],
          ),
        )
      ]),
    );
  }
}

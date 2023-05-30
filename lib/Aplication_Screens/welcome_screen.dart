import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 200,
                child: Image.asset(
                  'lib/images/logo_transparent.png',
                  filterQuality: FilterQuality.medium,
                ),
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 150),
                  child: const Text(
                    "Bine ai Venit!",
                    style: TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Container(
                width: 200,
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  const SizedBox(
                    child: Text(
                      "Ai cont Econ \nMade Easy?",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.w200),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 30),
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          width: 250,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Colors.blue),
                          child: const Center(
                            child: Text(
                              'Da',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 50,
                          width: 250,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Colors.blue),
                          child: const Center(
                            child: Text(
                              'Nu',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 30,
              ),
              Container(
                height: 300,
                child: Image.asset(
                  'lib/images/welcome_avatar',
                  filterQuality: FilterQuality.medium,
                ),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 30,
                width: 220,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    border: Border.all(color: Colors.blue, width: 2.0)),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                height: 30,
                width: 220,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    border: Border.all(color: Colors.blue, width: 2.0)),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                height: 30,
                width: 220,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    border: Border.all(color: Colors.blue, width: 2.0)),
              ),
            ],
          )
        ],
      ),
    );
  }
}

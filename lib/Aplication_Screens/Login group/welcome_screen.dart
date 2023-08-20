import 'package:flutter/material.dart';

import 'Case Does Not Have Email/register_enter_email_page.dart';
import 'Case Has Email/login_enter_email_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
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
        Center(
          child: Container(
            width: double.infinity,
            height: 500,
            color: Colors.white,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(top: 150, left: 30),
                        child: const Text(
                          "Bine ai Venit!",
                          style: TextStyle(
                            fontSize: 90,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 30),
                          child: const Row(
                            children: [
                              Text(
                                "Ai cont ",
                                style: TextStyle(
                                  fontSize: 60,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              Text(
                                "E N ",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 60,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                " M A D E  E A S Y ?",
                                style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 30),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return const LoginEnterEmailPage();
                                    },
                                  ));
                                },
                                child: Container(
                                  height: 50,
                                  width: 300,
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
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return const RegisterEnterEmailPage();
                                    },
                                  ));
                                },
                                child: Container(
                                  height: 50,
                                  width: 300,
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
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 84),
                  height: 640,
                  child: Image.asset(
                    'lib/images/welcome_avatar',
                    filterQuality: FilterQuality.medium,
                  ),
                )
              ],
            ),
            Container(
              alignment: Alignment.bottomRight,
              child: Text("Econ Made Easy v1.1, 2023"),
            )
          ],
        ),
      ]),
    );
  }
}

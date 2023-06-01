import 'package:flutter/material.dart';

import '../../../Other stuff/textfield.dart';

class LoginEnterPasswordPage extends StatefulWidget {
  const LoginEnterPasswordPage({super.key});

  @override
  State<LoginEnterPasswordPage> createState() => _LoginEnterPasswordPageState();
}

class _LoginEnterPasswordPageState extends State<LoginEnterPasswordPage> {
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 70),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 40),
                      child: Text(
                        "Bine ai revenit!",
                        style: TextStyle(
                          fontSize: 90,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 40),
                      child: const Text(
                        'Pentru a intra în cont, introdu\nparola contului tau',
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 30),
                      width: 700,
                      height: 80,
                      child: InputTextField(
                        controller: emailController,
                        hintText: 'Parolă',
                        obscureText: true,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 50),
                height: 600,
                child: Image.asset(
                  'lib/images/Bopa.png',
                  filterQuality: FilterQuality.medium,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 30,
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: const Text(
                    '< Inapoi',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w300,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 30,
                    width: 220,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(40)),
                        border: Border.all(color: Colors.blue, width: 2.0)),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    
                    height: 30,
                    width: 220,
                    decoration: BoxDecoration(color: Colors.blue,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(40)),
                        border: Border.all(color: Colors.blue, width: 2.0)),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 30,
                    width: 220,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(40)),
                        border: Border.all(color: Colors.blue, width: 2.0)),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(right: 20),
                child: const Text(
                  'Inainte >',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w300,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

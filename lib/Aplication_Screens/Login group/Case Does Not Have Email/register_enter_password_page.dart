import 'package:flutter/material.dart';

import '../../../Other stuff/textfield.dart';
import './register_loading_page.dart';

// ignore: must_be_immutable
class RegisterEnterPasswordPage extends StatefulWidget {
  String email;
  String name;

  RegisterEnterPasswordPage(
      {super.key, required this.email, required this.name});

  @override
  State<RegisterEnterPasswordPage> createState() =>
      _RegisterEnterPasswordPageState();
}

class _RegisterEnterPasswordPageState extends State<RegisterEnterPasswordPage> {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        child: ListView(
          scrollDirection: Axis.vertical,
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
                        child: const Text(
                          "Bine ai venit!",
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
                          'Hai sa îți securizăm contul!\nCrează-ți o parolă puternică!',
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
                          controller: passwordController,
                          hintText: 'Parolă',
                          obscureText: true,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 30),
                        width: 700,
                        height: 80,
                        child: InputTextField(
                          controller: confirmPasswordController,
                          hintText: 'Confirmă Parola',
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
                    'lib/images/register_image',
                    filterQuality: FilterQuality.medium,
                  ),
                )
              ],
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
                      width: 160,
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
                      width: 160,
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
                      width: 160,
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
                      width: 160,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(40)),
                          border: Border.all(color: Colors.blue, width: 2.0)),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    if (passwordController.text != '') {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return RegisterLoadingPage(
                            email: widget.email,
                            name: widget.name,
                            password: passwordController.text,
                            confirmPassword: confirmPasswordController.text,
                          );
                        },
                      ));
                    }
                  },
                  child: Container(
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

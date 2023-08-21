import 'package:flutter/material.dart';

import '../../../Other stuff/textfield.dart';
import './login_enter_password_page.dart';

class LoginEnterEmailPage extends StatefulWidget {
  const LoginEnterEmailPage({super.key});

  @override
  State<LoginEnterEmailPage> createState() => _LoginEnterEmailPageState();
}

class _LoginEnterEmailPageState extends State<LoginEnterEmailPage> {
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                        child: Text(
                          'Pentru a intra în cont, introdu-ți\nadresa de email asociată\ncu contul tău.',
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
                          hintText: 'Email',
                          obscureText: false,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: Text(
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
                ),
                InkWell(
                  onTap: () {
                    if (!(emailController.text == "")) {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return LoginEnterPasswordPage(
                            email: emailController.text,
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

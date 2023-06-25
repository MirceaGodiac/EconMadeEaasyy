import 'package:econ_made_easy_files/Aplication_Screens/Login%20group/Case%20Has%20Email/login_loading_page.dart';
import 'package:flutter/material.dart';
import '../../../Other stuff/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import '../auth_page.dart';

class LoginEnterPasswordPage extends StatefulWidget {
  String email;

  LoginEnterPasswordPage({super.key, required this.email});

  @override
  State<LoginEnterPasswordPage> createState() => _LoginEnterPasswordPageState();
}

class _LoginEnterPasswordPageState extends State<LoginEnterPasswordPage> {
  final passwordController = TextEditingController();
  bool hidePassword = true;
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
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 30),
                            width: 700,
                            height: 80,
                            child: InputTextField(
                              controller: passwordController,
                              hintText: 'Parolă',
                              obscureText: hidePassword,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                hidePassword = !hidePassword;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 18),
                              child: Icon(
                                Icons.remove_red_eye,
                                color:
                                    (hidePassword) ? Colors.black : Colors.red,
                                size: 23,
                              ),
                            ),
                          )
                        ],
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
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(40)),
                          border: Border.all(color: Colors.blue, width: 2.0)),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return LoginLoadingPage(
                          email: widget.email,
                          password: passwordController.text,
                        );
                      },
                    ));
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

  void signUserIn() async {
    // try sign user in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: widget.email, password: passwordController.text);

      debugPrint("Trying to log in...");
      AuthPage.loggedIn = true;
      debugPrint(AuthPage.loggedIn.toString());
    } on FirebaseAuthException catch (error) {
      //Navigator.pop(context);

      // WRONG EMAIL
      if (error.code == 'user-not-found') {
        // Show error to user
        wrongEmailMessage();
      } else

      // WRONG PASSWORD
      if (error.code == 'wrong-password') {
        // Show error to user
        wrongPasswordMessage();
      }
    }

    // pop the progress indicator
  }

  // wrong email popup
  void wrongEmailMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            backgroundColor: Color.fromARGB(255, 9, 181, 181),
            title: Text("Email / Nume de utilizator gresit."),
          );
        });
  }

  void wrongPasswordMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            backgroundColor: Color.fromARGB(255, 9, 181, 181),
            title: Text("Parola gresită."),
          );
        });
  }
}

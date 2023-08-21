import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../models/user_model.dart';
import 'package:flutter/material.dart';
import '../../../Other stuff/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../auth_page.dart';

class RegisterLoadingPage extends StatefulWidget {
  static var userSettings = FirebaseAuth.instance.currentUser;
  String email;
  String name;
  String password;
  String confirmPassword;

  RegisterLoadingPage({
    super.key,
    required this.email,
    required this.password,
    required this.name,
    required this.confirmPassword,
  });

  @override
  State<RegisterLoadingPage> createState() => _RegisterLoadingPageState();
}

class _RegisterLoadingPageState extends State<RegisterLoadingPage> {
  Widget build(BuildContext context) {
    // wrong email popup
    debugPrint("started fr now");
    signUserUp();

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
                        child: const Text(
                          "Se crează un cont\ndoar pentru tine!",
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
                          'Daca ai ramas blocat pe acest\necran,verifică-ți conecțiunea\nla internet.',
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
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
            Container(
              margin: const EdgeInsets.only(bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                            color: Colors.blue,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(40)),
                            border: Border.all(color: Colors.blue, width: 2.0)),
                      ),
                    ],
                  ),
                  Container(
                    width: 40,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void signUserUp() async {
    try {
      if (widget.confirmPassword == widget.confirmPassword) {
        // create user
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: widget.email, password: widget.password)
            .then((value) => {
                  FirebaseFirestore.instance
                      .collection('Users')
                      .doc(RegisterLoadingPage.userSettings?.uid)
                      .set({
                    'name': widget.name,
                    'email': widget.email,
                    'credits': 50,
                    'time': DateTime.now(),
                    'questionsCount': 0,
                    'answersCount': 0,
                  })
                });
        debugPrint(
            'Document id (inherited by user id) identified in frontal loading screen as: ${RegisterLoadingPage.userSettings?.uid}');
        debugPrint("______________________________________________");
        AuthPage.loggedIn = true;

        // register details in database
      } else {
        passwordsDontMatchMessage();
      }
    } on FirebaseAuthException catch (error) {
      if (error.code == 'invalid-email') {
        errorMessage('Emailul introdus este invalid.');
      } else if (error.code == 'weak-password') {
        errorMessage('Parola este prea slaba');
      } else {
        errorMessage(error.code);
      }
    }
    // pop the progress indicator
  }

  void passwordsDontMatchMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            backgroundColor: Color.fromARGB(255, 9, 181, 181),
            title: Text("Parolele nu sunt la fel."),
          );
        });
  }

  void errorMessage(String text) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Color.fromARGB(255, 9, 181, 181),
            title: Text(text),
          );
        });
  }
}

import 'package:flutter/material.dart';
import '../../../Other stuff/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../auth_page.dart';

class LoginLoadingPage extends StatefulWidget {
  String email;
  String password;

  LoginLoadingPage({super.key, required this.email, required this.password});

  @override
  State<LoginLoadingPage> createState() => _LoginLoadingPageState();
}

class _LoginLoadingPageState extends State<LoginLoadingPage> {
  @override
  Widget build(BuildContext context) {
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

    void signUserIn() async {
      // try sign user in
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: widget.email, password: widget.password);

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

    signUserIn();
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
                          "Se intra in cont...",
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
                    'lib/images/Bopa.png',
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

  void signUserIn() async {
    // try sign user in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: widget.email, password: widget.password);
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

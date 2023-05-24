import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'dart:math';

import '../Other stuff/loginButton.dart';
import '../Other stuff/textfield.dart';
import 'auth_page.dart';
import 'forgot_password_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  var rng = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              const SizedBox(height: 50),

              // logo
              const Icon(
                Icons.lock,
                size: 100,
              ),

              const SizedBox(height: 50),

              // Bine ai revenit, ti-am simtit lipsa!!
              Center(
                child: Text(
                  'Bine ai revenit, ti-am simtit lipsa!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // username textfield
              InputTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
              ),

              const SizedBox(height: 10),

              // password textfield
              InputTextField(
                controller: passwordController,
                hintText: 'Parolă',
                obscureText: true,
              ),

              const SizedBox(height: 10),

              // forgot password?
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const ForgotPasswordPage();
                          },
                        ));
                      },
                      child: SizedBox(
                        width: 130,
                        height: 20,
                        child: Text(
                          'Ai uitat parola?',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // sign in button
              LoginButton(
                onTap: signUserIn,
                text: "Intra in cont",
              ),

              const SizedBox(
                height: 60,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        ' made with ❤ by g.mirciu ',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // sign user in method
  void signUserIn() async {
    // try sign user in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

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

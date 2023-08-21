import 'package:cloud_firestore/cloud_firestore.dart';
import './auth_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../Other stuff/loginButton.dart';
import '../../Other stuff/textfield.dart';

class EconMadeEasyUser {
  EconMadeEasyUser(
      {required this.userName, required this.credits, required this.email});
  final String email;
  String userName;
  int credits;

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'userName': userName,
      'credits': credits,
    };
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controllers
  final firstnameController = TextEditingController();

  final lastNameController = TextEditingController();

  final usernameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  final ageController = TextEditingController();

  void dispose() {
    firstnameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    ageController.dispose();
    super.dispose();
  }

  // sign user up method
  void signUserUp() async {
    // try creating the user
    try {
      if (passwordController.text == confirmPasswordController.text) {
        // create user
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
        AuthPage.loggedIn = true;

        addUserDetails(firstnameController.text, lastNameController.text,
            usernameController.text, emailController.text, 0);
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

  Future addUserDetails(String firstName, String lastName, String userName,
      String email, int credits) async {
    await FirebaseFirestore.instance.collection('Users').add({
      'name': firstName,
      'email': email,
      'credits': credits,
      'completedLessons': [
        {
          '0': false,
          '1': false,
          '2': false,
          '3': false,
          '4': false,
          '5': false,
          '6': false,
          '7': false,
          '8': false,
          '9': false,
          '10': false
        }
      ]
    });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              // logo
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 300,
                    child: ClipRRect(
                      child: Image.asset(
                        'lib/images/Illustration37.png',
                        filterQuality: FilterQuality.medium,
                      ),
                    ),
                  ),

                  //const SizedBox(height: 50),

                  // Bine ai revenit, ti-am simtit lipsa!!
                  Center(
                    child: Text(
                      'Hai sa iti cream un cont!',
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 28,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),

              InputTextField(
                controller: firstnameController,
                hintText: 'Nume',
                obscureText: false,
              ),

              const SizedBox(height: 10),

              InputTextField(
                controller: lastNameController,
                hintText: 'Prenume',
                obscureText: false,
              ),

              const SizedBox(height: 10),

              // username textfield
              InputTextField(
                controller: usernameController,
                hintText: 'Nume de utilizator',
                obscureText: false,
              ),

              const SizedBox(height: 10),

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

              // confirm password textfield
              InputTextField(
                controller: confirmPasswordController,
                hintText: 'Confirmă',
                obscureText: true,
              ),

              const SizedBox(height: 10),

              // sign up button
              LoginButton(
                onTap: signUserUp,
                text: "Creeaza cont",
              ),
              const SizedBox(height: 50),
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
              const SizedBox(height: 25),

              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}

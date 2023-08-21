import './bootup_screen.dart';
import './loading_screen.dart';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  static bool loggedIn = false;

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isRegistered = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            // user is logged in
            if (snapshot.hasData) {
              debugPrint("logined");

              // boot loading screen
              return LoadingScreen();
            }
            // user is NOT nogged in
            else {
              debugPrint("not logined");

              return const BootupScreen();
            }
            // create a "Aw, Snap! something went wrong. please restart the app and try again" page here
          },
        ),
      ),
    );
  }
}

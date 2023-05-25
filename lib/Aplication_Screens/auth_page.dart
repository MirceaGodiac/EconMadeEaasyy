import 'package:econ_made_easy_files/Aplication_Screens/loading_screen.dart';
import 'package:econ_made_easy_files/Aplication_Screens/register_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:line_icons/line_icons.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'login_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  static bool loggedIn = false;

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isRegistered = false;

  int _selectedIndex = 0;

  List<Widget> pages = [
    const LoginPage(),
    const RegisterPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: GNav(
          selectedIndex: _selectedIndex,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          backgroundColor: Colors.black,
          color: Colors.white,
          activeColor: const Color.fromARGB(255, 7, 139, 139),
          gap: 8,
          tabs: [
            GButton(
              icon: LineIcons.doorOpen,
              text: 'Intra in cont',
              onPressed: () => {
                setState(() {
                  _selectedIndex = 0;
                  debugPrint(_selectedIndex.toString());
                })
              },
              border: Border.all(
                color: Colors.grey.shade800,
              ),
            ),
            GButton(
              icon: Icons.create,
              text: 'Creeaza cont',
              onPressed: () => {
                setState(() {
                  _selectedIndex = 1;
                  debugPrint(_selectedIndex.toString());
                })
              },
              border: Border.all(color: Colors.grey.shade800),
            ),
          ],
        ),
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            // user is logged in
            if (snapshot.hasData) {
              debugPrint("logined");

              // boot loading screen
              return const LoadingScreen();
            }
            // user is NOT nogged in
            else {
              debugPrint("not logined");

              return pages[_selectedIndex];
            }
            // create a "Aw, Snap! something went wrong. please restart the app and try again" page here
          },
        ),
      ),
    );
  }
}

/*
ECON MADE EASY

authors: Godiac Mircea (developer)
         Ana Farcas    (artist)

Software to assist individuals with learning disorders to learn about economy

*/

// Main menu

import 'package:econ_made_easy_files/Aplication_Screens/account_page.dart';
import 'package:econ_made_easy_files/Aplication_Screens/auth_page.dart';
import 'package:econ_made_easy_files/Aplication_Screens/movie_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:line_icons/line_icons.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter/material.dart';

import 'Aplication_Screens/home_page.dart';

import 'package:firebase_core/firebase_core.dart';
import 'Aplication_Screens/rebus_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    const AuthPage(),
  );
}

class EconMadeEasy extends StatefulWidget {
  const EconMadeEasy({super.key});

  @override
  State<EconMadeEasy> createState() => _EconMadeEasyState();
}

class _EconMadeEasyState extends State<EconMadeEasy> {
  int _selectedIndex = 0;
  List<Widget> pages = [
    const HomePage(),
    const MovieList(),
    const AccountPage(),
    RebusPage(),
  ];

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 200,
                child: ClipRRect(
                  child: Image.asset(
                    'lib/images/logo_transparent.png',
                    filterQuality: FilterQuality.medium,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              // buttons(better bottom navigation bar but it's on the side)
              Container(
                margin: const EdgeInsets.only(left: 40),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _selectedIndex = 0;
                    });
                  },
                  child: Row(
                    children: [
                      Icon(LineIcons.home, size: 30, color: Colors.grey[800]),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Acasă',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.only(left: 40),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _selectedIndex = 1;
                    });
                  },
                  child: Row(
                    children: [
                      Icon(Icons.movie_outlined,
                          size: 30, color: Colors.grey[800]),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Lecții',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.only(left: 40),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _selectedIndex = 2;
                    });
                  },
                  child: Row(
                    children: [
                      Icon(Icons.person, size: 30, color: Colors.grey[800]),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Cont',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(left: 40),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _selectedIndex = 3;
                    });
                  },
                  child: Row(
                    children: [
                      Icon(Icons.access_time,
                          size: 30, color: Colors.grey[800]),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Rebus',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 50,
          ),
          pages[_selectedIndex]
        ],
      ),
    ));
  }
}

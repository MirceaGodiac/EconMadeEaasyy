/*
ECON MADE EASY

authors: Godiac Mircea (developer)
         Ana Farcas    (artist)

Software to assist individuals to study for EN

*/

// Main menu

import 'package:econ_made_easy_files/Aplication_Screens/Questions%20Group/view_questions_page.dart';
import 'package:econ_made_easy_files/api/firebase_api.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:econ_made_easy_files/Aplication_Screens/Login%20group/auth_page.dart';
import 'package:econ_made_easy_files/Aplication_Screens/Resources%20group/resources_page.dart';
import 'package:econ_made_easy_files/Aplication_Screens/movie_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter/material.dart';

import 'Aplication_Screens/home_page.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'api/firebase_api.dart';

bool first = true;
final _firebaseMessaging = FirebaseMessaging.instance;

Future<void> initNotifications() async {
  await _firebaseMessaging.requestPermission();
  final fCMToken = await _firebaseMessaging.getToken();
  print('Token: $fCMToken');
}

Future<void> main() async {
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
    const ResourcesList(),
    const ViewQuestionsPage(),
  ];

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    var screenSizeData = MediaQuery.of(context);
    double screenWidth = screenSizeData.size.width;
    double screenHeight = screenSizeData.size.height;
    return MaterialApp(
        theme: ThemeData(fontFamily: 'Coolvetica'),
        home: Scaffold(
          backgroundColor: Colors.black,
          body: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: screenWidth * 1 / 10,
                    child: ClipRRect(
                      child: Image.asset(
                        'lib/images/logo_transparent.png',
                        filterQuality: FilterQuality.medium,
                      ),
                    ),
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
                      child: const Column(
                        children: [
                          Icon(LineIcons.home, size: 15, color: Colors.white),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            'Acasă',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w100),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // end of item 1 (Home)
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
                      child: const Column(
                        children: [
                          Icon(
                            Icons.menu_book_rounded,
                            size: 20,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            'Exercitii',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w100,
                            ),
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
                      child: const Column(
                        children: [
                          Icon(Icons.library_books_outlined,
                              size: 20, color: Colors.white),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            'Resurse',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w100),
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
                          _selectedIndex = 3;
                        });
                      },
                      child: const Column(
                        children: [
                          Icon(Icons.info_outline_rounded,
                              size: 20, color: Colors.white),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            'Ajutor Personal',
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                                fontWeight: FontWeight.w100),
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
                          _selectedIndex = 0;
                        });
                      },
                      child: const Column(
                        children: [
                          Icon(Icons.edit, size: 20, color: Colors.white),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            'Simulare',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w100),
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
                          _selectedIndex = 0;
                        });
                      },
                      child: const Column(
                        children: [
                          Icon(Icons.schedule_rounded,
                              size: 20, color: Colors.white),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            'Orar',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w100),
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
                          _selectedIndex = 0;
                        });
                      },
                      child: const Column(
                        children: [
                          Icon(Icons.store, size: 20, color: Colors.white),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            'Magazin',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w100),
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
                          _selectedIndex = 0;
                        });
                      },
                      child: const Column(
                        children: [
                          Icon(Icons.person, size: 20, color: Colors.white),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            'Cont',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w100),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: screenWidth * (1 / 40),
              ),
              pages[_selectedIndex]
            ],
          ),
        ));
  }
}

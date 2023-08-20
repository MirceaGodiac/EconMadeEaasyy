/*
ECON MADE EASY

authors: Godiac Mircea (developer)
         Ana Farcas    (artist)

Software to assist individuals to study for EN

*/

// Main menu

import 'package:econ_made_easy_files/Aplication_Screens/Questions%20Group/view_questions_page.dart';
import 'package:econ_made_easy_files/Aplication_Screens/manuals%20group/manuals_list.dart';
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
import 'package:firedart/firedart.dart' as fireDart;

bool first = true;
final _firebaseMessaging = FirebaseMessaging.instance;

Future<void> initNotifications() async {
  await _firebaseMessaging.requestPermission();
  final fCMToken = await _firebaseMessaging.getToken();
  print('Token: $fCMToken');
}

const ApiKey = 'AIzaSyAKGVyVQ_yENRFfMsHXZ8BFaXodSLJFAv0';
const projectID = 'made-easy-a99a4';

Future<void> main() async {
  fireDart.Firestore.initialize(projectID);
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
    const manualsList(),
  ];

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    var screenSizeData = MediaQuery.of(context);
    double screenWidth = screenSizeData.size.width;
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
                    margin: const EdgeInsets.only(left: 50, top: 20),
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
                            Icons.edit,
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
                                fontSize: 15,
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
                          _selectedIndex = 4;
                        });
                      },
                      child: const Column(
                        children: [
                          Icon(Icons.edit, size: 20, color: Colors.white),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            'Manuale',
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
                      onTap: () async {
                        FirebaseAuth.instance.signOut().then((res) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AuthPage()),
                          );
                        });
                        AuthPage.loggedIn = false;
                      },
                      child: const Column(
                        children: [
                          Icon(Icons.logout, size: 25, color: Colors.white),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            'Iesire din cont',
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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/home_screen_answer_model.dart';
import 'Login group/auth_page.dart';
import 'Login group/loading_screen.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<dynamic> _personalQueryReference;
  late Future<dynamic> _personalDataQueryreference;

  @override
  @override
  void initState() {
    super.initState();

    _personalQueryReference = extractPersonalAnswers();
    _personalDataQueryreference = extractAccountData();
  }

  Future<dynamic> extractPersonalAnswers() async {
    final db = FirebaseFirestore.instance;
    final personalQueryReference = await db
        .collection('questions')
        .orderBy('id', descending: true)
        .where('authorEmail', isEqualTo: LoadingScreen.userSettings?.email)
        .get();
    return personalQueryReference;
  }

  Future<dynamic> extractAccountData() async {
    final db = FirebaseFirestore.instance;
    final personalDataQueryReference =
        await db.collection('Users').doc(LoadingScreen.userSettings?.uid).get();
    return personalDataQueryReference;
  }

  Widget build(BuildContext context) {
    var screenSizeData = MediaQuery.of(context);
    double screenWidth = screenSizeData.size.width;
    double screenHeight = screenSizeData.size.height;
    return Row(
      children: [
        Stack(
          children: [
            Container(
              height: double.infinity,
              width: screenWidth * (9 / 10 - 1 / 40) - 50,
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    bottomLeft: Radius.circular(60)),
                color: Colors.white,
              ),
              child: SizedBox(
                height: double.infinity,
                width: screenWidth * (9 / 10 - 1 / 40) - 50,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(60),
                  ),
                  child: Image.asset(
                    'lib/images/logindoodle.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              height: double.infinity,
              width: screenWidth * (9 / 10 - 1 / 40) - 50,
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(56),
                    bottomLeft: Radius.circular(56)),
                color: Colors.black87,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                        color: Colors.white24),
                    height: double.infinity,
                    width: screenWidth / 3,
                    margin: const EdgeInsets.only(top: 20, left: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 20, left: 30),
                          child: const Text(
                            'Intrebarile Tale',
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: screenWidth / 3,
                          height: screenHeight / 1.3,
                          child: FutureBuilder(
                            future: _personalQueryReference,
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                var personalQuestionsQuesryReference =
                                    snapshot.data!;

                                return ListView(
                                  scrollDirection: Axis.vertical,
                                  children: [
                                    for (int i = 0;
                                        i <
                                            personalQuestionsQuesryReference
                                                .docs.length;
                                        i++)
                                      HomePageQuestionModel(
                                        width: screenWidth / 4,
                                        title: personalQuestionsQuesryReference
                                            .docs[i]['title'],
                                        text: personalQuestionsQuesryReference
                                            .docs[i]['text'],
                                        nrOfAnswers:
                                            personalQuestionsQuesryReference
                                                .docs[i]['nrOfQuestions'],
                                        index: i,
                                        questionQueryReference:
                                            personalQuestionsQuesryReference,
                                      )
                                  ],
                                );
                              } else {
                                return Center(
                                    child: Container(
                                        width: 40,
                                        height: 40,
                                        child:
                                            const CircularProgressIndicator()));
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  const VerticalDivider(
                    color: Colors.white38,
                    endIndent: 10,
                    thickness: 2.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          height: screenWidth / 4 * (3 / 4),
                          width: screenWidth / 3,
                          margin: const EdgeInsets.only(top: 40, right: 40),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            color: Colors.white38,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 20),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.person,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    Text(
                                      '  ${LoadingScreen.userData.firstName}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              FutureBuilder(
                                future: _personalDataQueryreference,
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {
                                  if (snapshot.hasData) {
                                    var _snapshotData = snapshot.data;
                                    return Container(
                                      margin: const EdgeInsets.only(left: 20),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 50,
                                            child: Image.asset(
                                              'lib/images/flower.png',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Text(
                                            '  ${_snapshotData['credits'].toString()} flori',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 30,
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  } else {
                                    return const CircularProgressIndicator();
                                  }
                                },
                              ),
                              FutureBuilder(
                                future: _personalDataQueryreference,
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {
                                  if (snapshot.hasData) {
                                    var _snapshotData = snapshot.data;
                                    String formattedDate = DateFormat.yMd()
                                        .format(_snapshotData['time'].toDate());
                                    return Container(
                                      margin: const EdgeInsets.only(left: 20),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.access_time,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                          Text(
                                            '  Cont creat in: ${formattedDate}',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 30,
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  } else {
                                    return const CircularProgressIndicator();
                                  }
                                },
                              ),
                              FutureBuilder(
                                future: _personalDataQueryreference,
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {
                                  if (snapshot.hasData) {
                                    var _snapshotData = snapshot.data;

                                    return Container(
                                      margin: const EdgeInsets.only(left: 20),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.question_mark_rounded,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                          Text(
                                            '   Numar de intrebari: ${_snapshotData['questionsCount']}',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 30,
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  } else {
                                    return const CircularProgressIndicator();
                                  }
                                },
                              ),
                              FutureBuilder(
                                future: _personalDataQueryreference,
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {
                                  if (snapshot.hasData) {
                                    var _snapshotData = snapshot.data;

                                    return Container(
                                      margin: const EdgeInsets.only(left: 20),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.lightbulb_outline,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                          Text(
                                            '   Numar de raspunsuri: ${_snapshotData['answersCount']}',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 30,
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  } else {
                                    return const CircularProgressIndicator();
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              'Bine ai venit in EN _ made-easy!',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: const Text(
                                  'Această aplicație te va ajuta sa înveți\npentru examen!',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w100,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: const Text(
                                  'Profită de o mulțime de modele de examen oficiale',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w100,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: const Text(
                                  'Și teste personalizate si simulări cool',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w100,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: const Text(
                                  'Toate in aceasta aplicație alaturi de Dinu!',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w100,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 100,
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:econ_made_easy_files/Aplication_Screens/Exercitii%20Group/secondSelectExerciseTypeScreen.dart';
import 'package:econ_made_easy_files/Aplication_Screens/Exercitii%20Group/subiect_3_quiz.dart';
import 'package:econ_made_easy_files/Aplication_Screens/Exercitii%20Group/testModel.dart';
import 'package:econ_made_easy_files/Aplication_Screens/Login%20group/loading_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class thirdSelectExerciseTypeScreenSubjectScreenI extends StatefulWidget {
  int length;
  int materiiLength;
  var materie;
  String subject;
  thirdSelectExerciseTypeScreenSubjectScreenI({
    super.key,
    required this.subject,
    required this.length,
    required this.materie,
    required this.materiiLength,
  });

  @override
  State<thirdSelectExerciseTypeScreenSubjectScreenI> createState() =>
      _thirdSelectExerciseTypeScreenSubjectScreenIState();
}

class _thirdSelectExerciseTypeScreenSubjectScreenIState
    extends State<thirdSelectExerciseTypeScreenSubjectScreenI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 210, 60, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 40, left: 40),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) {
                            return secondSelectExerciseTypeScreen(
                              subject: widget.subject,
                              materie: widget.materie,
                              selectedLength: widget.materiiLength,
                              saveData: true,
                              length: widget.length,
                            );
                          },
                        ));
                      },
                      child: const Row(
                        children: [
                          Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white,
                            size: 30,
                          ),
                          Text(
                            '  Inapoi',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w100),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 40),
                child: const Text(
                  'Alege cate exercitii doresti sa rezolvi:',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w200),
                ),
              ),
              InkWell(
                onTap: () async {
                  // get nr of credits
                  int nrOfCredits = 0;

                  await FirebaseFirestore.instance
                      .collection('Users')
                      .doc(LoadingScreen.userSettings!.uid)
                      .get()
                      .then((value) {
                    nrOfCredits = value['credits'];
                  });

                  // extract some exercises ig

                  List<Map<int, List<int>>> exercises = [];

                  for (int i = 0; i < selectedMaterials.length; i++) {
                    if (selectedMaterials[i]) {
                      int requestedQuestions = numberOfSelectedMaterials[i];
                      int possibleQuestions =
                          widget.materie.docs[i]['exercitii'].length;

                      List<int>? questions =
                          List<int>.filled(possibleQuestions, 0);

                      int x = 0;

                      for (int j = 0; j < possibleQuestions; j++) {
                        questions[j] = x;
                        x++;
                      }

                      exercises.add({
                        i: questions!
                            .take(numberOfSelectedMaterials[i])
                            .toList(),
                      });
                      print('-> $exercises');
                    }
                  }

                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      if (widget.subject == 'Subiect I') {
                        return testTypePage(
                          levelColor: const Color.fromRGBO(255, 210, 60, 1),
                          correctAnswer: widget
                              .materie.docs[0]['exercitii'][0].values
                              .toList()[0],
                          imageURL: widget.materie.docs[0]['exercitii'][0].keys
                              .toList()[0],
                          materie: widget.materie,
                          questions: exercises,
                          nrOfCredits: nrOfCredits,
                          reward: 5,
                        );
                      } else if (widget.subject == 'Subiect II') {
                        return testTypePage(
                          levelColor: const Color.fromRGBO(255, 210, 60, 1),
                          correctAnswer: widget
                              .materie.docs[0]['exercitii'][0].values
                              .toList()[0],
                          imageURL: widget.materie.docs[0]['exercitii'][0].keys
                              .toList()[0],
                          materie: widget.materie,
                          questions: exercises,
                          nrOfCredits: nrOfCredits,
                          reward: 10,
                        );
                      } else {
                        return testType3Page(
                          levelColor: const Color.fromRGBO(255, 210, 60, 1),
                          correctAnswer: widget
                              .materie.docs[0]['exercitii'][0].values
                              .toList()[0],
                          imageURL: widget.materie.docs[0]['exercitii'][0].keys
                              .toList()[0],
                          materie: widget.materie,
                          questions: exercises,
                          nrOfCredits: nrOfCredits,
                        );
                      }
                    },
                  ));
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 40, right: 40),
                  child: const Row(
                    children: [
                      Text(
                        'Incepe! ',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w100),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.white,
                        size: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  left: 40,
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(60)),
                  color: Colors.amber,
                ),
                width: 650,
                height: 600,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    for (int i = 0; i < widget.length; i++)
                      if (selectedMaterials[i] == true)
                        Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 150,
                                  width: 500,
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(40),
                                      ),
                                      color: Colors.amber.shade600,
                                      border: Border.all(
                                          color: Colors.black12, width: 5)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        child: Text(
                                          widget.materie.docs[i].id,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 30,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(right: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  if (numberOfSelectedMaterials[
                                                          i] >
                                                      1) {
                                                    numberOfSelectedMaterials[
                                                        i]--;
                                                  }
                                                });
                                              },
                                              child: const SizedBox(
                                                width: 40,
                                                height: 40,
                                                child: Icon(
                                                  Icons.arrow_back_ios_new,
                                                  color: Colors.white,
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 40,
                                            ),
                                            Text(
                                              numberOfSelectedMaterials[i]
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                            const SizedBox(
                                              width: 40,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  if (numberOfSelectedMaterials[
                                                          i] <
                                                      widget
                                                          .materie
                                                          .docs[i]['exercitii']
                                                          .length) {
                                                    numberOfSelectedMaterials[
                                                        i]++;
                                                  }
                                                });
                                              },
                                              child: const SizedBox(
                                                width: 40,
                                                height: 40,
                                                child: Icon(
                                                  Icons
                                                      .arrow_forward_ios_outlined,
                                                  color: Colors.white,
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 480,
                                  alignment: Alignment.topRight,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedMaterials[i] = false;
                                      });
                                    },
                                    child: Container(
                                        margin: const EdgeInsets.only(top: 20),
                                        child: const Icon(
                                          Icons.cancel_outlined,
                                          color: Colors.white,
                                        )),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            )
                          ],
                        )
                  ],
                ),
              ),
              Container(
                height: 650,
                margin: const EdgeInsets.only(right: 50, top: 7),
                child: Image.asset(
                  'lib/images/Illustration34_1.png',
                  fit: BoxFit.contain,
                  filterQuality: FilterQuality.medium,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

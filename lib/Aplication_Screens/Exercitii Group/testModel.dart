import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:econ_made_easy_files/Aplication_Screens/Exercitii%20Group/redeem_credits.dart';
import 'package:econ_made_easy_files/Aplication_Screens/Exercitii%20Group/resultPage.dart';
import 'package:econ_made_easy_files/Aplication_Screens/Exercitii%20Group/secondSelectExerciseTypeScreen.dart';
import 'package:econ_made_easy_files/Aplication_Screens/Login%20group/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:countup/countup.dart';

class testTypePage extends StatefulWidget {
  String imageURL;
  String correctAnswer;
  Color levelColor;
  var materie;
  int nrOfCredits;
  int reward;
  int creditsEarned = 0;
  List<Map<int, List<int>>> questions;
  testTypePage({
    super.key,
    required this.levelColor,
    required this.correctAnswer,
    required this.imageURL,
    required this.materie,
    required this.questions,
    required this.nrOfCredits,
    required this.reward,
  });

  @override
  State<testTypePage> createState() => _testTypePageState();
}

int iterabletoint(var x) {
  x.skip(0).take(1).map((e) => e.toInt());
  return x as int;
}

int? iterableToListLength(var x) {
  int? sum = 0;
  x.map((e) => e.toList()).forEach((element) {
    sum = (sum! + element) as int?;
  });
  return sum;
}

class _testTypePageState extends State<testTypePage> {
  bool showReward = false;
  bool isCorrect = false;
  int selectedAnswer = -1;
  bool rewardSent = false;
  final PageController _controller = PageController(initialPage: 0);
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    var screenSizeData = MediaQuery.of(context);
    double screenWidth = screenSizeData.size.width;
    double screenHeight = screenSizeData.size.height;

    int numberOfExercises = 0;
    for (int i = 0; i < numberOfSelectedMaterials.length; i++) {
      if (selectedMaterials[i])
        numberOfExercises += numberOfSelectedMaterials[i];
    }

    int numberOfChapters = 0;
    for (int i = 0; i < selectedMaterials.length; i++) {
      if (selectedMaterials[i]) numberOfChapters++;
    }

    List<int> questionsHash = List.filled(numberOfChapters, 0);
    List<int> docIDs = List.filled(numberOfChapters, 0);

    int x = 0;
    for (int j = 0; j < selectedMaterials.length; j++) {
      if (selectedMaterials[j]) {
        docIDs[x] = j;
        x++;
      }
    }
    print('${numberOfExercises - 1} <-');
    questionsHash[0] = widget.questions[0].values.last.length;

    for (int i = 1; i < numberOfChapters; i++) {
      questionsHash[i] = questionsHash[i - 1] +
          widget.questions[i].values.last.toList().length;
    }

    int returnChapterNr(List<int> questionsHash, int chapterIndex) {
      int i = 0;
      while (chapterIndex > questionsHash[i] - 1) {
        i++;
      }

      return i;
    }

    int returnChapterElementNr(List<int> qh, int _index) {
      int start = 0, i = 0;
      print(qh);
      if (returnChapterNr(questionsHash, _index) == 0) {
        start = 0;
      } else {
        start = qh[returnChapterNr(questionsHash, _index) - 1];
      }

      while (start != _index) {
        start++;
        i++;
      }
      return i;
    }

    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              'lib/images/logindoodle.jpg',
            ),
          ),
          SizedBox.expand(
            child: Container(
              color: Colors.black87,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  const SizedBox(
                    height: 85,
                  ),
                  SizedBox(
                    width: screenWidth,
                    height: screenHeight,
                    child: PageView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: _controller,
                      onPageChanged: (value) async {
                        setState(() {
                          selectedAnswer = -1;
                        });
                      },
                      itemCount: numberOfExercises,
                      itemBuilder: (context, index) {
                        print('index is: ${index}');
                        print(
                            'material is: ${widget.materie.docs[docIDs[returnChapterNr(questionsHash, index)]].id}');

                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        top: 50, left: 50),
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
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 50),
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                    border: Border.all(
                                        color: Colors.black12, width: 5),
                                    color: Colors.amber.shade300,
                                  ),
                                  child: Container(
                                    margin: const EdgeInsets.all(20),
                                    child: Text(
                                      '${widget.materie.docs[docIDs[returnChapterNr(questionsHash, index)]].id}',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontWeight: FontWeight.w200),
                                    ),
                                  ),
                                ),
                                Container(
                                    margin: const EdgeInsets.only(
                                        top: 50, right: 50),
                                    child: (selectedAnswer == -1 && !showReward)
                                        ? InkWell(
                                            onTap: () async {
                                              _controller.nextPage(
                                                duration:
                                                    Duration(milliseconds: 1),
                                                curve: Curves.linear,
                                              );
                                            },
                                            child: const SizedBox(
                                              width: 150,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    'Skip ',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 30,
                                                        fontWeight:
                                                            FontWeight.w100),
                                                  ),
                                                  Icon(
                                                    Icons
                                                        .arrow_forward_ios_rounded,
                                                    color: Colors.white,
                                                    size: 30,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        : (showReward)
                                            ? InkWell(
                                                onTap: () {
                                                  print(
                                                      '$index index, $numberOfExercises number of exercises');
                                                  if (index ==
                                                      numberOfExercises - 1) {
                                                    Navigator.push(context,
                                                        MaterialPageRoute(
                                                      builder: (context) {
                                                        return redeem_credits(
                                                            obtainedCredits: widget
                                                                .creditsEarned);
                                                      },
                                                    ));
                                                  } else {
                                                    print('next page...');
                                                    _controller.nextPage(
                                                      duration: Duration(
                                                          milliseconds: 1),
                                                      curve: Curves.linear,
                                                    );
                                                    setState(() {
                                                      showReward = false;
                                                      selectedAnswer = -1;
                                                    });
                                                  }
                                                },
                                                child: const SizedBox(
                                                  width: 162,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        'Urmatorul!',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 30,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w100),
                                                      ),
                                                      Icon(
                                                        Icons
                                                            .arrow_forward_ios_rounded,
                                                        color: Colors.white,
                                                        size: 30,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            : InkWell(
                                                onTap: () {
                                                  List<String> answers = [
                                                    'a',
                                                    'b',
                                                    'c',
                                                    'd'
                                                  ];
                                                  if (answers[selectedAnswer]
                                                          .toString() ==
                                                      widget
                                                          .materie
                                                          .docs[
                                                              docIDs[returnChapterNr(
                                                                  questionsHash,
                                                                  index)]]
                                                              ['exercitii'][
                                                              returnChapterElementNr(
                                                                  questionsHash,
                                                                  index)]
                                                          .values
                                                          .first
                                                          .toString()) {
                                                    setState(() {
                                                      showReward = true;
                                                      isCorrect = true;
                                                      widget.creditsEarned +=
                                                          widget.reward;
                                                      print(
                                                          widget.creditsEarned);
                                                    });
                                                  } else {
                                                    setState(() {
                                                      showReward = true;
                                                      isCorrect = false;
                                                    });
                                                  }
                                                },
                                                child: const SizedBox(
                                                  width: 150,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        'Verifica! ',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 30,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w100),
                                                      ),
                                                      Icon(
                                                        Icons
                                                            .arrow_forward_ios_rounded,
                                                        color: Colors.white,
                                                        size: 30,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )),
                              ],
                            ),
                            (!showReward)
                                ? Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.amber,
                                              width: 5,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(35)),
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(30),
                                          ),
                                          child: SizedBox(
                                            width: 900,
                                            child: Image.network(widget
                                                .materie
                                                .docs[docIDs[returnChapterNr(
                                                        questionsHash, index)]]
                                                    ['exercitii'][
                                                    returnChapterElementNr(
                                                        questionsHash, index)]
                                                .keys
                                                .first
                                                .toString()),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: screenHeight / 30,
                                      ),
                                      Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  if (selectedAnswer != 0)
                                                    selectedAnswer = 0;
                                                  else
                                                    selectedAnswer = -1;
                                                });
                                              },
                                              child: Container(
                                                width: screenWidth / 5,
                                                height: 140,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    color: Colors.red.shade300,
                                                    border: (selectedAnswer ==
                                                            0)
                                                        ? Border.all(
                                                            color: Colors.white,
                                                            width: 10)
                                                        : Border.all(
                                                            color:
                                                                Colors.black12,
                                                            width: 10)),
                                                child: const Center(
                                                  child: Text(
                                                    'Varianta A',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 40,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  if (selectedAnswer != 1)
                                                    selectedAnswer = 1;
                                                  else
                                                    selectedAnswer = -1;
                                                });
                                              },
                                              child: Container(
                                                width: screenWidth / 5,
                                                height: 140,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    color: Colors.amber,
                                                    border: (selectedAnswer ==
                                                            1)
                                                        ? Border.all(
                                                            color: Colors.white,
                                                            width: 10)
                                                        : Border.all(
                                                            color:
                                                                Colors.black12,
                                                            width: 10)),
                                                child: const Center(
                                                  child: Text(
                                                    'Varianta B',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 40,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  if (selectedAnswer != 2)
                                                    selectedAnswer = 2;
                                                  else
                                                    selectedAnswer = -1;
                                                });
                                              },
                                              child: Container(
                                                width: screenWidth / 5,
                                                height: 140,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    color: Colors.green[300],
                                                    border: (selectedAnswer ==
                                                            2)
                                                        ? Border.all(
                                                            color: Colors.white,
                                                            width: 10)
                                                        : Border.all(
                                                            color:
                                                                Colors.black12,
                                                            width: 10)),
                                                child: const Center(
                                                  child: Text(
                                                    'Varianta C',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 40,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  if (selectedAnswer != 3) {
                                                    selectedAnswer = 3;
                                                  } else {
                                                    selectedAnswer = -1;
                                                  }
                                                });
                                              },
                                              child: Container(
                                                width: screenWidth / 5,
                                                height: 140,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    color: Colors.blue.shade200,
                                                    border: (selectedAnswer ==
                                                            3)
                                                        ? Border.all(
                                                            color: Colors.white,
                                                            width: 10)
                                                        : Border.all(
                                                            color:
                                                                Colors.black12,
                                                            width: 10)),
                                                child: const Center(
                                                  child: Text(
                                                    'Varianta D',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 40,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                : (isCorrect)
                                    ? Column(children: [
                                        Text(
                                          'Raspuns Corect, +${widget.reward}',
                                          style: TextStyle(
                                            fontSize: 80,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          'Punctele tale',
                                          style: TextStyle(
                                            fontSize: 80,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Countup(
                                          begin: widget.nrOfCredits.toDouble() +
                                              widget.creditsEarned -
                                              widget.reward,
                                          end: widget.nrOfCredits.toDouble() +
                                              widget.creditsEarned,
                                          duration: Duration(seconds: 2),
                                          style: TextStyle(
                                            fontSize: 72,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          height: screenHeight * (1 / 4),
                                        )
                                      ])
                                    : Column(
                                        children: [
                                          Text(
                                            'Raspuns gresit',
                                            style: TextStyle(
                                              fontSize: 80,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            'varianta corecta era: ${widget.materie.docs[docIDs[returnChapterNr(questionsHash, index)]]['exercitii'][returnChapterElementNr(questionsHash, index)].values.first.toString()}',
                                            style: TextStyle(
                                              fontSize: 80,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:econ_made_easy_files/Aplication_Screens/Exercitii%20Group/redeem_credits.dart';
import 'package:econ_made_easy_files/Aplication_Screens/Exercitii%20Group/secondSelectExerciseTypeScreen.dart';
import 'package:flutter/material.dart';

class testType3Page extends StatefulWidget {
  String imageURL;
  String correctAnswer;
  Color levelColor;
  var materie;
  int nrOfCredits;
  int obtainedCredits = 0;
  List<Map<int, List<int>>> questions;
  testType3Page({
    super.key,
    required this.levelColor,
    required this.correctAnswer,
    required this.imageURL,
    required this.materie,
    required this.questions,
    required this.nrOfCredits,
  });

  @override
  State<testType3Page> createState() => _testType3PageState();
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

class _testType3PageState extends State<testType3Page> {
  int selectedAnswer = -1;
  final PageController _controller = PageController(initialPage: 0);
  int showBarem = 0;
  double _currentSliderValue = 0;
  Widget build(BuildContext context) {
    var screenSizeData = MediaQuery.of(context);
    double screenWidth = screenSizeData.size.width;
    double screenHeight = screenSizeData.size.height;

    int numberOfExercises = 0;
    for (int i = 0; i < numberOfSelectedMaterials.length; i++) {
      if (selectedMaterials[i]) {
        numberOfExercises += numberOfSelectedMaterials[i];
      }
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
                      onPageChanged: (value) {
                        setState(() {
                          selectedAnswer = -1;
                        });
                      },
                      itemCount: numberOfExercises,
                      itemBuilder: (context, index) {
                        print('index is: ${index}');
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
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
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontWeight: FontWeight.w200),
                                    ),
                                  ),
                                ),
                                Container(
                                    margin: const EdgeInsets.only(
                                        top: 50, right: 50),
                                    child: (showBarem == 0)
                                        ? InkWell(
                                            onTap: () {
                                              setState(() {
                                                showBarem = 1;
                                              });
                                            },
                                            child: const SizedBox(
                                              width: 200,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    'barem ',
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
                                        : (showBarem == 1)
                                            ? InkWell(
                                                onTap: () {
                                                  _controller.nextPage(
                                                    duration: Duration(
                                                        milliseconds: 1),
                                                    curve: Curves.linear,
                                                  );
                                                  setState(() {
                                                    showBarem = 2;
                                                  });
                                                },
                                                child: const SizedBox(
                                                  width: 150,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        'Continua',
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
                                                  widget.obtainedCredits +=
                                                      _currentSliderValue
                                                          .toInt();
                                                  if (index ==
                                                      numberOfExercises - 1) {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) {
                                                        return redeem_credits(
                                                            obtainedCredits:
                                                                (widget.obtainedCredits /
                                                                        10)
                                                                    .toInt());
                                                      }),
                                                    );
                                                  } else {
                                                    _controller.nextPage(
                                                      duration: Duration(
                                                          milliseconds: 1),
                                                      curve: Curves.linear,
                                                    );
                                                  }

                                                  setState(() {
                                                    showBarem = 0;
                                                  });
                                                },
                                                child: const SizedBox(
                                                  width: 200,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        'Urmatorul ',
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
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.amber,
                                    width: 5,
                                  ),
                                  borderRadius: BorderRadius.circular(35)),
                              child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(30),
                                  ),
                                  child: (showBarem == 0)
                                      ? SizedBox(
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
                                        )
                                      : (showBarem == 1)
                                          ? SizedBox(
                                              width: 900,
                                              child: Image.network(widget
                                                  .materie
                                                  .docs[docIDs[returnChapterNr(
                                                          questionsHash,
                                                          index)]]['exercitii'][
                                                      returnChapterElementNr(
                                                          questionsHash, index)]
                                                  .values
                                                  .first
                                                  .toString()),
                                            )
                                          : SizedBox(
                                              width: screenWidth * (8 / 10),
                                              child: Column(children: [
                                                const Text(
                                                  'Da-ti o nota, dupa cum te-ai descurcat la acest exercitiu!',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 30,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                Text(
                                                  '${_currentSliderValue / 10} puncte',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 40,
                                                  ),
                                                ),
                                                Slider(
                                                  value: _currentSliderValue,
                                                  max: 150,
                                                  divisions: 15,
                                                  label: _currentSliderValue
                                                      .round()
                                                      .toString(),
                                                  onChanged: (double value) {
                                                    setState(() {
                                                      _currentSliderValue =
                                                          value;
                                                    });
                                                  },
                                                ),
                                              ]),
                                            )),
                            ),
                            SizedBox(),
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

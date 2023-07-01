import 'package:econ_made_easy_files/Aplication_Screens/Exercitii%20Group/secondSelectExerciseTypeScreen.dart';
import 'package:flutter/material.dart';

class testTypePage extends StatefulWidget {
  String imageURL;
  String correctAnswer;
  Color levelColor;
  var materie;
  List<Map<int, List<int>>> questions;
  testTypePage({
    super.key,
    required this.levelColor,
    required this.correctAnswer,
    required this.imageURL,
    required this.materie,
    required this.questions,
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
  int selectedAnswer = -1;
  final PageController _controller = PageController(initialPage: 0);
  Widget build(BuildContext context) {
    var screenSizeData = MediaQuery.of(context);
    double screenWidth = screenSizeData.size.width;
    double screenHeight = screenSizeData.size.height;

    int numberOfExercises = 0;
    for (int i = 0; i < numberOfSelectedMaterials.length; i++) {
      numberOfExercises += numberOfSelectedMaterials[i];
    }

    int numberOfChapters = 0;
    for (int i = 0; i < selectedMaterials.length; i++) {
      if (selectedMaterials[i]) numberOfChapters++;
    }

    List<int> questionsHash = List.filled(numberOfChapters, 0);

    questionsHash[0] = widget.questions[0].values.last.length;
    print('__');
    print(widget.questions[0].values.last.toList().length);

    for (int i = 1; i < numberOfChapters; i++) {
      questionsHash[i] = questionsHash[i - 1] +
          widget.questions[i].values.last.toList().length;
      debugPrint(
          'equation: ${questionsHash[i - 1]} + ${widget.questions[i].values.last.toList().length} = ${questionsHash[i]}');
    }
    print('__');
    print(questionsHash);

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
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 50, left: 50),
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
                          border: Border.all(color: Colors.black12, width: 5),
                          color: Colors.amber.shade300,
                        ),
                        child: Container(
                          margin: const EdgeInsets.all(20),
                          child: Text(
                            '${widget.materie.docs[0].id}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w200),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 50, right: 50),
                        child: (selectedAnswer == -1)
                            ? const SizedBox(
                                width: 150,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Skip ',
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
                              )
                            : InkWell(
                                onTap: () {
                                  List<String> answers = ['a', 'b', 'c', 'd'];
                                  if (answers[selectedAnswer].toString() ==
                                      widget.correctAnswer) {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return const AlertDialog(
                                            title: Text(
                                              'Raspuns corect!',
                                            ),
                                          );
                                        });
                                  } else {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return const AlertDialog(
                                            title: Text(
                                              'Raspuns gresit!',
                                            ),
                                          );
                                        });
                                  }
                                },
                                child: SizedBox(
                                  width: 150,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Verifica! ',
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
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 85,
                  ),
                  SizedBox(
                    width: screenWidth,
                    height: screenHeight * (2 / 3),
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
                        return Column(
                          children: [
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
                                child: SizedBox(
                                  width: 900,
                                  child: Image.network(
                                    widget
                                        .materie
                                        .docs[iterabletoint(
                                                widget.questions[index].values)]
                                            ['exercitii'][widget
                                                .questions[index].values
                                                .toList()[0]]
                                        .keys,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 50),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                      width: 250,
                                      height: 140,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: Colors.red.shade300,
                                          border: (selectedAnswer == 0)
                                              ? Border.all(
                                                  color: Colors.white,
                                                  width: 10)
                                              : Border.all(
                                                  color: Colors.black12,
                                                  width: 10)),
                                      child: const Center(
                                        child: Text(
                                          'Varianta A',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 40,
                                            fontWeight: FontWeight.w500,
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
                                      width: 250,
                                      height: 140,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: Colors.amber,
                                          border: (selectedAnswer == 1)
                                              ? Border.all(
                                                  color: Colors.white,
                                                  width: 10)
                                              : Border.all(
                                                  color: Colors.black12,
                                                  width: 10)),
                                      child: const Center(
                                        child: Text(
                                          'Varianta B',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 40,
                                            fontWeight: FontWeight.w500,
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
                                      width: 250,
                                      height: 140,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: Colors.green[300],
                                          border: (selectedAnswer == 2)
                                              ? Border.all(
                                                  color: Colors.white,
                                                  width: 10)
                                              : Border.all(
                                                  color: Colors.black12,
                                                  width: 10)),
                                      child: const Center(
                                        child: Text(
                                          'Varianta C',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 40,
                                            fontWeight: FontWeight.w500,
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
                                      width: 250,
                                      height: 140,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: Colors.blue.shade200,
                                          border: (selectedAnswer == 3)
                                              ? Border.all(
                                                  color: Colors.white,
                                                  width: 10)
                                              : Border.all(
                                                  color: Colors.black12,
                                                  width: 10)),
                                      child: const Center(
                                        child: Text(
                                          'Varianta D',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 40,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

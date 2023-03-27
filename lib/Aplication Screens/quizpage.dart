import 'package:econ_made_easy_files/data/questions_list.dart';
import 'package:econ_made_easy_files/models/question_model.dart';
import 'package:econ_made_easy_files/Aplication%20Screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../data/quizzes_list.dart';

class QuizApp extends StatefulWidget {
  int index;

  QuizApp({super.key, required this.index});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QuizPage(
        quizID: widget.index,
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  int quizID;
  QuizPage({super.key, required this.quizID});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final FlutterTts flutterTts = FlutterTts();
  Color mainColor = const Color.fromARGB(255, 16, 19, 32);
  Color secondColor = const Color(0xFF117eeb);
  // Create controller for pageview
  final PageController _controller = PageController(initialPage: 0);

  //Setting the game Variable

  bool isPressed = false;
  bool lastQuestion = false;

  Color trueAnswer = Colors.green;
  Color wrongAnswer = Colors.red;
  Color btnColor = const Color(0xFF117eeb);

  int score = 0;

  @override
  Widget build(BuildContext context) {
    speak(String text) async {
      await flutterTts.setLanguage('ro');
      await flutterTts.setPitch(1.0);
      await flutterTts.speak(text);
    }

    return Scaffold(
      body: Container(
        width: 1300,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: _controller,
              onPageChanged: (page) {
                setState(() {
                  isPressed = false;
                });
              },
              itemCount: quizzes[widget.quizID].length,
              itemBuilder: (context, index) {
                debugPrint('quiz index is: ${widget.quizID}');
                return Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 420,
                              child: Text(
                                "Intrebarea ${index + 1} / ${quizzes[widget.quizID].length}",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 32.0),
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            SizedBox(
                              width: 400,
                              child: Text(
                                quizzes[widget.quizID][index].question!,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 32.0,
                                ),
                              ),
                            ),
                            const SizedBox(height: 25.0),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            OutlinedButton(
                                onPressed: isPressed
                                    ? () {
                                        if (index ==
                                            quizzes[widget.quizID].length - 1) {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: ((context) => ResultPage(
                                                    result: FinalResult(score),
                                                    index: widget.quizID,
                                                  )),
                                            ),
                                          );
                                        } else {
                                          _controller.nextPage(
                                              duration: const Duration(
                                                  milliseconds: 1),
                                              curve: Curves.linear);
                                        }
                                      }
                                    : null,
                                style: OutlinedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  side: const BorderSide(
                                      color: Colors.orange, width: 1.0),
                                ),
                                child:
                                    (index == quizzes[widget.quizID].length - 1)
                                        ? const Text(
                                            "Afiseaza rezultate",
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          )
                                        : const Text(
                                            "Urmatoarea intrebare",
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          )),
                          ],
                        ),
                        const SizedBox(height: 50),
                        // Generate answers
                        Container(
                          margin: const EdgeInsets.only(left: 80),
                          height: 300,
                          child: ClipRRect(
                            child: Image.asset(
                              'lib/images/Illustration34_1.png',
                              filterQuality: FilterQuality.medium,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                      ],
                    ),
                    Container(
                      height: 540,
                      width: 820,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(40),
                          ),
                          color: Colors.blue.shade50),
                      child: Column(
                        children: [
                          const SizedBox(height: 60),
                          for (int i = 0;
                              i < quizzes[widget.quizID][index].answer!.length;
                              i++)
                            Container(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      const SizedBox(width: 20),
                                      InkWell(
                                        onTap: () {
                                          speak(quizzes[widget.quizID][index]
                                              .answer!
                                              .keys
                                              .toList()[i]);
                                        },
                                        child: Center(
                                          child: Container(
                                            width: 60,
                                            height: 60,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                              color: Colors.blueGrey.shade100,
                                            ),
                                            child: Icon(
                                              Icons.volume_up,
                                              color: Colors.grey.shade600,
                                              size: 30,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      SizedBox(
                                        width: 700,
                                        child: OutlinedButton(
                                            style: OutlinedButton.styleFrom(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 20.0),
                                              shape: const StadiumBorder(),
                                              side: isPressed
                                                  ? quizzes[widget.quizID]
                                                              [index]
                                                          .answer!
                                                          .entries
                                                          .toList()[i]
                                                          .value
                                                      ? BorderSide(
                                                          color: trueAnswer,
                                                          width: 6.0)
                                                      : BorderSide(
                                                          color: wrongAnswer,
                                                          width: 0.0)
                                                  : BorderSide(
                                                      color: secondColor,
                                                      width: 0.0),
                                            ),
                                            onHover: (value) {
                                              const BorderSide(
                                                  color: Colors.blueGrey,
                                                  width: 0.0);
                                            },
                                            onPressed: isPressed
                                                ? () {}
                                                : () {
                                                    setState(() {
                                                      isPressed = true;
                                                      debugPrint(i.toString());
                                                    });
                                                    if (quizzes[widget.quizID]
                                                            [index]
                                                        .answer!
                                                        .entries
                                                        .toList()[i]
                                                        .value) {
                                                      score++;
                                                    }
                                                  },
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 40),
                                                  child: Text(
                                                    quizzes[widget.quizID]
                                                            [index]
                                                        .answer!
                                                        .keys
                                                        .toList()[i],
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20.0,
                                                    ),
                                                  ),
                                                ),
                                                if (isPressed)
                                                  if (quizzes[widget.quizID]
                                                          [index]
                                                      .answer!
                                                      .entries
                                                      .toList()[i]
                                                      .value)
                                                    Container(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 40),
                                                      child: Icon(
                                                        Icons
                                                            .check_circle_outline_sharp,
                                                        color: trueAnswer,
                                                        size: 35,
                                                      ),
                                                    ),
                                              ],
                                            )),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 40),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}

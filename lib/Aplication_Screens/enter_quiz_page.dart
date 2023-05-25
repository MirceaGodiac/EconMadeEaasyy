import 'package:econ_made_easy_files/Aplication_Screens/quizpage.dart';
import 'package:econ_made_easy_files/Aplication_Screens/video_player.dart';
import 'package:econ_made_easy_files/Other%20stuff/lessons_list.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EnterQuizPage extends StatefulWidget {
  int index;

  EnterQuizPage({super.key, required this.index});

  @override
  State<EnterQuizPage> createState() => _EnterQuizPageState();
}

class _EnterQuizPageState extends State<EnterQuizPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 400,
                  child: ClipRRect(
                    child: Image.asset('lib/images/Bopa.png'),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      lessons[widget.index].lessonTitle,
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Capitolul ${lessons[widget.index].chapter}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Capitolul ${lessons[widget.index].lessonDescription}',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () {
                        debugPrint('index is: ${widget.index}');
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => QuizApp(
                                    index: widget.index,
                                  )),
                        );
                      },
                      child: Container(
                        width: 180.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                            color: Colors.blueGrey[400],
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            )),
                        child: const Center(
                            child: Text(
                          'Continua spre quiz',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        )),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  VideoPlayer(index: widget.index)),
                        );
                      },
                      child: Container(
                        width: 280.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                            color: Colors.blueGrey[400],
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            )),
                        child: const Center(
                            child: Text(
                          'Inapoi spre film',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        )),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        )));
  }
}

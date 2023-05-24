import 'package:econ_made_easy_files/Aplication%20Screens/video_player.dart';
import 'package:econ_made_easy_files/Other%20stuff/lessons_list.dart';
import 'package:econ_made_easy_files/main.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EnterLessonPage extends StatelessWidget {
  int index;

  EnterLessonPage({super.key, required this.index});

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
                      lessons[index].lessonTitle,
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
                      'Capitolul ${lessons[index].chapter}',
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
                      lessons[index].lessonDescription,
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
                        debugPrint('index is: $index');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VideoPlayer(
                                    index: index,
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
                          'Incepe lectia',
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
                              builder: (context) => const EconMadeEasy()),
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
                          'Inapoi pe pagina principala',
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

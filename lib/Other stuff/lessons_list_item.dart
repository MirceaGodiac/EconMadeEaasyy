import 'package:flutter/material.dart';

import '../Aplication_Screens/enter_lesson_page.dart';
import '../Aplication_Screens/Login group/loading_screen.dart';
import 'lessons_list.dart';

// ignore: must_be_immutable
class LessonsListItem extends StatelessWidget {
  int index;

  LessonsListItem({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => EnterLessonPage(
                    index: index,
                  )),
        );
      },
      child: Container(
        width: 600,
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.blue.shade500,
          borderRadius: const BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                        height: 150.0,
                        margin: const EdgeInsets.only(left: 30, top: 40),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(lessons[index].lessonThumbnailURL),
                        )),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 30, top: 10),
                          child: Text(
                            lessons[index].lessonTitle,
                            style: const TextStyle(
                              fontSize: 40.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 30, top: 10),
                          child: Text(
                            'Capitolul ${lessons[index].chapter}: ${lessons[index].ChapterDescription}',
                            style: const TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 30, top: 10),
                          child: Text(
                            lessons[index].lessonDescription,
                            style: const TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                    alignment: Alignment.centerRight,
                    margin: const EdgeInsets.only(right: 30),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: LoadingScreen.userData.completedLessons[0]
                              [index.toString()]
                          ? Colors.green[700]
                          : Colors.black54,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(40.0),
                      ),
                    ),
                    // ignore: sort_child_properties_last
                    child: Center(
                        child: LoadingScreen.userData.completedLessons[0]
                                [index.toString()]
                            ? const Text(
                                "Completat",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )
                            : const Text(
                                "Necompletat",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )))
              ],
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

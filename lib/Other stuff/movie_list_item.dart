import 'package:econ_made_easy_files/Aplication%20Screens/enter_lesson_page.dart';
import 'package:flutter/material.dart';

import 'lessons_list.dart';

// ignore: must_be_immutable
class MovieListItem extends StatelessWidget {
  int index;

  MovieListItem({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //debugPrint('index is: ${lessons[index].lessonNo}');
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => EnterLessonPage(
                          index: index,
                        )),
              );
            },
            child: Center(
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: 125.0,
                        margin:
                            const EdgeInsets.only(top: 10, bottom: 10, left: 5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.asset(lessons[index].lessonThumbnailURL),
                        )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 30, top: 10),
                          child: Text(
                            lessons[index].lessonTitle,
                            style: const TextStyle(
                                fontSize: 35.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 30),
                          child: Text(
                            'Capitolul ' + lessons[index].chapter.toString(),
                            style: const TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 30, top: 20),
                          child: Text(
                            lessons[index].lessonDescription,
                            style: const TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

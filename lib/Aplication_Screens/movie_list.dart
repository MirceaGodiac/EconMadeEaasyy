import 'package:econ_made_easy_files/Other%20stuff/lessons_list.dart';
import 'package:flutter/material.dart';

import '../Other stuff/lessons_list_item.dart';
import 'Login group/loading_screen.dart';

class ChapterListItem extends StatefulWidget {
  final int index;
  const ChapterListItem({super.key, required this.index});

  @override
  State<ChapterListItem> createState() => _ChapterListItemState();
}

class _ChapterListItemState extends State<ChapterListItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          color: Colors.grey.shade100),
                      child: Center(
                          child: Text(
                        lessons[widget.index].chapter.toString(),
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade600),
                      ))),
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Capitolul ${(lessons[widget.index].chapter).toString()}',
                              style: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              lessons[widget.index]
                                  .ChapterDescription
                                  .toString(),
                              style: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class MovieList extends StatefulWidget {
  const MovieList({super.key});

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  int index = 0;
  int lessonBuilt = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20),
          width: 750,
          height: double.infinity,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
              color: Colors.blue.shade50),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 40),
                child: const Text(
                  'Toate lecțiile',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 45,
                ),
                child: const Text(
                  'Econ Made Easy',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 23,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                height: 75,
              ),
              Container(
                margin: const EdgeInsets.only(left: 50),
                child: Text(
                  'Cursuri:',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[500],
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              for (int index = 1;
                  index <= lessons[lessons.length - 1].chapter;
                  index++)
                for (int lessonBuilt = 0;
                    lessonBuilt < lessons.length;
                    lessonBuilt++)
                  if (index == lessons[lessonBuilt].chapter)
                    LessonsListItem(index: lessonBuilt),
            ],
          ),
        ),
        SizedBox(
          height: double.infinity,
          width: 280,
          child: Column(
            children: [
              const SizedBox(
                height: 63,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        color: Colors.grey[100],
                        border: Border.all(
                          color: Colors.black12,
                          width: 1,
                        )),
                    child: const Icon(
                      Icons.movie_creation_outlined,
                      size: 20,
                      color: Colors.black45,
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${LoadingScreen.userData.firstName} ${LoadingScreen.userData.lastName}",
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            LoadingScreen.userData.email,
                            style: const TextStyle(
                              color: Colors.blue,
                              fontSize: 10,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.person_outlined,
                        size: 40,
                        color: Colors.grey.shade700,
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 60),
              Container(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    const SizedBox(width: 20),
                    Text(
                      'Capitole',
                      style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 30,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              const ChapterListItem(index: 0),
              const ChapterListItem(index: 2),
              const ChapterListItem(index: 5),
              const ChapterListItem(index: 7),
              const ChapterListItem(index: 10)
            ],
          ),
        )
      ],
    );
  }
}

import 'package:econ_made_easy_files/Aplication_Screens/Login%20group/loading_screen.dart';
import 'package:econ_made_easy_files/Aplication_Screens/Questions%20Group/view_photo_page.dart';
import 'package:econ_made_easy_files/Aplication_Screens/Questions%20Group/view_questions_page.dart';
import 'package:econ_made_easy_files/data/questions_list.dart';
import 'package:econ_made_easy_files/main.dart';
import 'package:econ_made_easy_files/models/questionForumModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class viewYourQuestionPage extends StatefulWidget {
  var queryData;
  var questionsData;
  viewYourQuestionPage(
      {super.key, required this.questionsData, required this.queryData});

  @override
  State<viewYourQuestionPage> createState() => _viewYourQuestionPageState();
}

class _viewYourQuestionPageState extends State<viewYourQuestionPage> {
  int selectedAnswer = -1;
  int correctAnswer = 2;
  bool selectedAction = true; // true -> type    false -> attach file

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              'lib/images/logindoodle.jpg',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox.expand(
            child: Container(
              color: Colors.black87,
            ),
          ),
          SizedBox.expand(
            child: ListView(scrollDirection: Axis.vertical, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      top: 50,
                      left: 50,
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) {
                            return EconMadeEasy();
                          },
                        ));
                      },
                      child: Container(
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
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Column(
                children: [
                  for (int i = 0; i < widget.queryData.docs.length; i += 2)
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            questionModel(
                              title: widget.questionsData[i]['title'],
                              path: 'Subiect oficial EN mate 2020',
                              userName: widget.questionsData[i]['author'],
                              description: widget.questionsData[i]['text'],
                              reward: widget.questionsData[i]['reward'],
                              backgroundcolor: Colors.green.shade200,
                              id: widget.questionsData[i]['id'],
                              imageURL: widget.questionsData[i]['imageURL'],
                              authorEmail: widget.questionsData[i]
                                  ['authorEmail'],
                              time: widget.questionsData[i]['time'],
                              hidden: widget.questionsData[i]['isActive'],
                            ),
                            if (i + 1 < widget.queryData.docs.length ||
                                widget.queryData.docs.length % 2 == 0)
                              questionModel(
                                title: widget.questionsData[i + 1]['title'],
                                path: 'Subiect oficial EN mate 2020',
                                userName: widget.questionsData[i + 1]['author'],
                                description: widget.questionsData[i + 1]
                                    ['text'],
                                reward: widget.questionsData[i + 1]['reward'],
                                backgroundcolor: Colors.green.shade200,
                                id: widget.questionsData[i + 1]['id'],
                                imageURL: widget.questionsData[i + 1]
                                    ['imageURL'],
                                authorEmail: widget.questionsData[i + 1]
                                    ['authorEmail'],
                                time: widget.questionsData[i + 1]['time'],
                                hidden: widget.questionsData[i + 1]['isActive'],
                              ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                ],
              ),
            ]),
          )
        ],
      ),
    );
  }
}

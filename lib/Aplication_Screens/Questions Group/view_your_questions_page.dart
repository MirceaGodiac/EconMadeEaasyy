import 'package:econ_made_easy_files/Aplication_Screens/Login%20group/loading_screen.dart';
import 'package:econ_made_easy_files/Aplication_Screens/Questions%20Group/view_photo_page.dart';
import 'package:econ_made_easy_files/Aplication_Screens/Questions%20Group/view_questions_page.dart';
import 'package:econ_made_easy_files/data/questions_list.dart';
import 'package:econ_made_easy_files/models/questionForumModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class viewYourQuestionPage extends StatefulWidget {
  var questionsData;
  viewYourQuestionPage({super.key, required this.questionsData});

  @override
  State<viewYourQuestionPage> createState() => _viewYourQuestionPageState();
}

class _viewYourQuestionPageState extends State<viewYourQuestionPage> {
  int selectedAnswer = -1;
  int correctAnswer = 2;
  bool selectedAction = true; // true -> type    false -> attach file
  var myQuestions = {};

  Widget build(BuildContext context) {
    int x = 0;
    for (int i = 0; i < questionsLength; i++) {
      debugPrint(LoadingScreen.userData.email +
          questionsData['questions'][i]['authorEmail']);
      if (LoadingScreen.userData.email ==
          questionsData['questions'][i]['authorEmail']) {
        setState(() {
          myQuestions[x] = questionsData['questions'][i];
        });
        x++;
      }
    }
    print(myQuestions);
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
                        Navigator.pop(context);
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
                  for (int i = 0; i < myQuestions.length; i += 2)
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            questionModel(
                                title: myQuestions[i]['title'],
                                path: 'Subiect oficial EN mate 2020',
                                userName: myQuestions[i]['author'],
                                description: myQuestions[i]['text'],
                                reward: myQuestions[i]['reward'],
                                backgroundcolor: Colors.green.shade200,
                                id: myQuestions[i]['id'],
                                imageURL: myQuestions[i]['imageURL'],
                                authorEmail: myQuestions[i]['authorEmail']),
                            if (i + 1 < myQuestions.length ||
                                myQuestions.length % 2 == 0)
                              questionModel(
                                  title: myQuestions[i + 1]['title'],
                                  path: 'Subiect oficial EN mate 2020',
                                  userName: myQuestions[i + 1]['author'],
                                  description: myQuestions[i + 1]['text'],
                                  reward: myQuestions[i + 1]['reward'],
                                  backgroundcolor: Colors.green.shade200,
                                  id: myQuestions[i + 1]['id'],
                                  imageURL: myQuestions[i + 1]['imageURL'],
                                  authorEmail: myQuestions[i + 1]
                                      ['authorEmail']),
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

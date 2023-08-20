import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:econ_made_easy_files/Aplication_Screens/Login%20group/loading_screen.dart';
import 'package:econ_made_easy_files/Aplication_Screens/Questions%20Group/ask_question.dart';
import 'package:econ_made_easy_files/Aplication_Screens/Questions%20Group/view_question_page.dart';
import 'package:econ_made_easy_files/Aplication_Screens/Questions%20Group/view_your_questions_page.dart';
import 'package:econ_made_easy_files/models/questionForumModel.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class ViewQuestionsPage extends StatefulWidget {
  const ViewQuestionsPage({super.key});
  State<ViewQuestionsPage> createState() => _ViewQuestionsPageState();
}

class questionModel extends StatefulWidget {
  String title;
  String path;
  String userName;
  String description;
  int reward;
  Color backgroundcolor;
  int id;
  String imageURL;
  String authorEmail;
  bool hidden;
  var time;
  questionModel({
    super.key,
    required this.title,
    required this.path,
    required this.userName,
    required this.description,
    required this.reward,
    required this.backgroundcolor,
    required this.id,
    required this.imageURL,
    required this.authorEmail,
    required this.time,
    required this.hidden,
  });

  @override
  State<questionModel> createState() => _questionModelState();
}

class _questionModelState extends State<questionModel> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(widget.id);
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return viewQuestionPage(
              questionForumModel: QuestionForumModel(
                QuestionTitle: widget.title,
                QuestionText: widget.description,
                reward: widget.reward,
                author: widget.userName,
                date: widget.time,
                id: widget.id,
                imageURL: widget.imageURL,
                authorEmail: widget.authorEmail,
                hidden: widget.hidden,
              ),
              hidden: widget.hidden,
              isAnswered: false,
              locked: false,
            );
          },
        ));
      },
      child: Container(
        height: 200,
        width: 450,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black12, width: 5),
          color: widget.backgroundcolor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 430,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 300,
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Text(
                                widget.title,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 35,
                                    fontWeight: FontWeight.w200),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 15, right: 15),
                          child: Row(
                            children: [
                              Text(
                                'x${widget.reward}  ',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                              SizedBox(
                                height: 40,
                                child: Image.asset('lib/images/flower.png'),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Text(
                    widget.path,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w200),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    (widget.description.length > 50)
                        ? widget.description.substring(0, 50)
                        : widget.description,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w200),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'autor: ${widget.userName}',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w200),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

int questionsLength = 0;
int questionsLoaded = 0;
var questionsData;

class _ViewQuestionsPageState extends State<ViewQuestionsPage> {
  DateTime previous = DateTime.now();
  @override
  Widget build(BuildContext context) {
    bool askPageLoaded = true;
    return Stack(alignment: Alignment.center, children: [
      Container(
        margin: const EdgeInsets.only(top: 20, bottom: 20),
        width: 1100,
        height: double.infinity,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(60),
          ),
          child: Image.asset(
            'lib/images/logindoodle.jpg',
            filterQuality: FilterQuality.medium,
            fit: BoxFit.cover,
          ),
        ),
      ),
      SizedBox(
        width: 1100,
        height: double.infinity,
        child: Container(
          color: Colors.black87,
        ),
      ),
      Container(
        width: 950,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Start of content in container

            Container(
              margin: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'Cele mai noi întrebări:',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: () async {
                          setState(() {
                            askPageLoaded = true;
                          });
                          int credits = 0;
                          await FirebaseFirestore.instance
                              .collection('Users')
                              .doc(LoadingScreen.userSettings?.uid)
                              .get()
                              .then((value) {
                            credits = value['credits'];
                          });
                          setState(() {
                            askPageLoaded = false;
                          });
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return askQuestionPage(
                                credits: credits,
                              );
                            },
                          ));
                        },
                        child: Container(
                          width: 200,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue,
                          ),
                          child: (askPageLoaded)
                              ? Center(
                                  child: Text(
                                    'Pune o intrebare',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                )
                              : Center(
                                  child: Text(
                                    'Se incarca...',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 10),
                      InkWell(
                        onTap: () async {
                          setState(() {
                            questionsLoaded = 1;
                          });
                          debugPrint(
                              'initialized question submitting protocol');
                          final db = FirebaseFirestore.instance;

                          DateTime now = DateTime.now();

                          Duration duration = now.difference(previous);

                          if (duration.inSeconds > 10 || first) {
                            first = false;

                            final db = FirebaseFirestore.instance;
                            final queryReference = await db
                                .collection('questions')
                                .orderBy('id', descending: true)
                                .where('isActive', isEqualTo: true)
                                .limit(50)
                                .get();
                            setState(() {
                              questionsLoaded = 2;
                            });
                            questionsData = await queryReference.docs;
                            questionsLength = await queryReference.docs.length;

                            previous = DateTime.now();
                          } else {
                            setState(() {
                              questionsLoaded = 2;
                            });

                            showDialog(
                              context: context,
                              builder: (context) {
                                return const AlertDialog(
                                  title: Text(
                                      'Poți da refresh odată la 10 secunde'),
                                );
                              },
                            );
                          }
                        },
                        child: Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: Colors.black12, width: 2),
                              color: Colors.blue.shade200),
                          child: const Center(
                            child: Text(
                              'Refresh',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () async {
                          var personalQuestionsData;
                          int personalQuestionsLength = 0;
                          debugPrint(
                              'initialized question submitting protocol');
                          final db = FirebaseFirestore.instance;

                          final personalQueryReference = await db
                              .collection('questions')
                              .orderBy('id', descending: true)
                              .where('authorEmail',
                                  isEqualTo: LoadingScreen.userData.email)
                              .get();

                          personalQuestionsData =
                              await personalQueryReference.docs;
                          debugPrint(
                              'initialized question submitting protocol');

                          personalQuestionsLength =
                              await personalQueryReference.docs.length;
                          print(personalQuestionsLength);

                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return viewYourQuestionPage(
                              queryData: personalQueryReference,
                              questionsData: personalQuestionsData,
                            );
                          }));
                        },
                        child: Container(
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: Colors.black12, width: 3),
                              color: Colors.blue.shade200),
                          child: const Center(
                            child: Text(
                              'Intrebarile tale',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 30),
              width: 950,
              height: 560,
              child: (questionsLoaded == 2)
                  ? ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        for (int i = 0; i < questionsLength; i += 2)
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  questionModel(
                                    title: questionsData[i]['title'],
                                    path: 'Subiect oficial EN mate 2020',
                                    userName: questionsData[i]['author'],
                                    description: questionsData[i]['text'],
                                    reward: questionsData[i]['reward'],
                                    backgroundcolor: Colors.green.shade200,
                                    id: questionsData[i]['id'],
                                    imageURL: questionsData[i]['imageURL'],
                                    authorEmail: questionsData[i]
                                        ['authorEmail'],
                                    time: questionsData[i]['time'],
                                    hidden: questionsData[i]['isActive'],
                                  ),
                                  if (i % 2 == 0 && i < questionsLength - 1)
                                    questionModel(
                                      title: questionsData[i + 1]['title'],
                                      path: 'Subiect oficial EN mate 2020',
                                      userName: questionsData[i + 1]['author'],
                                      description: questionsData[i + 1]['text'],
                                      reward: questionsData[i + 1]['reward'],
                                      backgroundcolor: Colors.green.shade200,
                                      id: questionsData[i + 1]['id'],
                                      imageURL: questionsData[i + 1]
                                          ['imageURL'],
                                      authorEmail: questionsData[i + 1]
                                          ['authorEmail'],
                                      time: questionsData[i]['time'],
                                      hidden: questionsData[i]['isActive'],
                                    ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                      ],
                    )
                  : (questionsLoaded == 1)
                      ? const Center(
                          child: Text(
                            'se incarca intrebarile...',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                        )
                      : const Center(
                          child: Text(
                            'Apasă refresh pentru a încărca întrebările!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                        ),
            ),
          ],
        ),
      ),
    ]);
  }
}

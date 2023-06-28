import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:econ_made_easy_files/Aplication_Screens/Questions%20Group/ask_question.dart';
import 'package:econ_made_easy_files/Aplication_Screens/Questions%20Group/view_question_page.dart';
import 'package:econ_made_easy_files/Aplication_Screens/Questions%20Group/view_your_questions_page.dart';
import 'package:econ_made_easy_files/models/questionForumModel.dart';
import 'package:flutter/material.dart';

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
                  QuestionTitle: questionsData['questions'][widget.id]['title'],
                  QuestionText: questionsData['questions'][widget.id]['text'],
                  reward: questionsData['questions'][widget.id]['reward'],
                  author: questionsData['questions'][widget.id]['author'],
                  date: questionsData['questions'][widget.id]['time'],
                  id: questionsData['questions'][widget.id]['id'],
                  imageURL: questionsData['questions'][widget.id]['imageURL'],
                  authorEmail: questionsData['questions'][widget.id]
                      ['authorEmail']),
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

var questionsData;
int questionsLength = 0;
void extractQuestions() async {
  final db = FirebaseFirestore.instance;
  await db
      .collection('questions')
      .doc('questions_list')
      .get()
      .then((DocumentSnapshot documentData) {
    debugPrint('accesed questions data. yaaay!');
    questionsData =
        documentData.data() as Map<String, dynamic>; // Magic. Do not touch!!!
    debugPrint('decoded questions data');
    List questions = questionsData['questions'];
    questionsLength = questions.length;
  });
}

class _ViewQuestionsPageState extends State<ViewQuestionsPage> {
  @override
  void initState() {
    setState(() {
      extractQuestions();
    });

    super.initState();
  }

  Widget build(BuildContext context) {
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
                        'Cele mai noi intrebari:',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return askQuestionPage();
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
                          child: Center(
                            child: Text(
                              'Pune o intrebare',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Filtre',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w100),
                          ),
                          Icon(
                            Icons.filter_alt_sharp,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      SizedBox(width: 10),
                      InkWell(
                        onTap: () {
                          setState(() {
                            extractQuestions();
                          });
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
                        onTap: () {
                          setState(() {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return viewYourQuestionPage(
                                questionsData: questionsData,
                              );
                            }));
                          });
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
              height: 570,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  for (int i = 0; i < questionsLength; i += 2)
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            questionModel(
                                title: questionsData['questions'][i]['title'],
                                path: 'Subiect oficial EN mate 2020',
                                userName: questionsData['questions'][i]
                                    ['author'],
                                description: questionsData['questions'][i]
                                    ['text'],
                                reward: questionsData['questions'][i]['reward'],
                                backgroundcolor: Colors.green.shade200,
                                id: questionsData['questions'][i]['id'],
                                imageURL: questionsData['questions'][i]
                                    ['imageURL'],
                                authorEmail: questionsData['questions'][i]
                                    ['authorEmail']),
                            if (i + 1 < questionsLength ||
                                questionsLength % 2 == 0)
                              questionModel(
                                  title: questionsData['questions'][i + 1]
                                      ['title'],
                                  path: 'Subiect oficial EN mate 2020',
                                  userName: questionsData['questions'][i + 1]
                                      ['author'],
                                  description: questionsData['questions'][i + 1]
                                      ['text'],
                                  reward: questionsData['questions'][i + 1]
                                      ['reward'],
                                  backgroundcolor: Colors.green.shade200,
                                  id: questionsData['questions'][i + 1]['id'],
                                  imageURL: questionsData['questions'][i + 1]
                                      ['imageURL'],
                                  authorEmail: questionsData['questions'][i]
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
            )
          ],
        ),
      ),
    ]);
  }
}

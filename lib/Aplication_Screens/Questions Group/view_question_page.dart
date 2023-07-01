import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:econ_made_easy_files/Aplication_Screens/Login%20group/loading_screen.dart';
import 'package:econ_made_easy_files/Aplication_Screens/Questions%20Group/answer_question.dart';
import 'package:econ_made_easy_files/Aplication_Screens/Questions%20Group/view_photo_page.dart';
import 'package:econ_made_easy_files/Aplication_Screens/Questions%20Group/view_questions_page.dart';
import 'package:econ_made_easy_files/models/questionForumModel.dart';
import 'package:flutter/material.dart';

class answerElement extends StatefulWidget {
  String authorID;
  String Text;
  String imageURL;
  answerElement({
    super.key,
    required this.Text,
    required this.authorID,
    required this.imageURL,
  });

  @override
  State<answerElement> createState() => _answerElementState();
}

class _answerElementState extends State<answerElement> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1100,
      margin: const EdgeInsets.only(bottom: 20, left: 50, right: 50),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.green.shade100,
        border: Border.all(
          color: Colors.black12,
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20, left: 20),
            child: Text(
              'Raspuns de la ${widget.authorID}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Text(
                  widget.Text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),
          (widget.imageURL != '')
              ? Center(
                  child: SizedBox(
                    width: 900,
                    child: Image.network(
                      widget.imageURL,
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}

class viewQuestionPage extends StatefulWidget {
  final QuestionForumModel questionForumModel;
  bool hidden;
  viewQuestionPage(
      {super.key, required this.questionForumModel, required this.hidden});

  @override
  State<viewQuestionPage> createState() => _viewQuestionPageState();
}

class _viewQuestionPageState extends State<viewQuestionPage> {
  int selectedAnswer = -1;
  int correctAnswer = 2;
  final textcontroller = TextEditingController();
  final titlecontroller = TextEditingController();
  bool selectedAction = true; // true -> see answers    false -> write answer
  bool isLoaded = false;
  var answersData;
  int answersLength = 0; // for the ui only
  bool answersExist = true; // for the ui as well
  @override
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
          ListView(
            scrollDirection: Axis.vertical,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              margin: const EdgeInsets.only(top: 50, left: 50),
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
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              if (widget.questionForumModel.authorEmail !=
                                  LoadingScreen.userData.email)
                                Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(left: 50),
                                      child: Text(
                                        'Intrebarea #${widget.questionForumModel.id + 1} de la ${widget.questionForumModel.author}',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      width: 200,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.blue.shade300,
                                      ),
                                      child: Center(
                                          child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Recompensa:     x30',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 30,
                                            child: Image.asset(
                                                'lib/images/flower.png'),
                                          )
                                        ],
                                      )),
                                    )
                                  ],
                                )
                              else
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 50,
                                    ),
                                    Container(
                                      width: 240,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.blue.shade300,
                                      ),
                                      child: Center(
                                          child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Aceasta intrebare iti apartine',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      )),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        await FirebaseFirestore.instance
                                            .collection('questions')
                                            .doc(widget.questionForumModel.id
                                                .toString())
                                            .get()
                                            .then((docReference) {
                                          if (docReference.exists) {
                                            setState(() {
                                              widget.hidden =
                                                  docReference['isActive'];
                                            });
                                            print('1');
                                            print(widget.hidden);
                                          } else {
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title: Text(
                                                      'Intrebarea nu mai exista in baza noastra de date :/',
                                                    ),
                                                  );
                                                });
                                          }
                                        });
                                        if (widget.hidden) {
                                          FirebaseFirestore.instance
                                              .collection('questions')
                                              .doc(widget.questionForumModel.id
                                                  .toString())
                                              .update({
                                            'isActive': false,
                                          });
                                          setState(() {
                                            widget.hidden = false;
                                          });
                                          print('2');
                                          print(widget.hidden);
                                        } else {
                                          FirebaseFirestore.instance
                                              .collection('questions')
                                              .doc(widget.questionForumModel.id
                                                  .toString())
                                              .update({
                                            'isActive': true,
                                          });
                                          setState(() {
                                            widget.hidden = true;
                                          });
                                        }
                                      },
                                      child: Container(
                                          width: 160,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.blue.shade300,
                                          ),
                                          child: (widget.hidden)
                                              ? Center(
                                                  child: Text(
                                                    'Ascunde acest thread',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                )
                                              : Center(
                                                  child: Text(
                                                    'Dezvaluie acest thread',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                )),
                                    )
                                  ],
                                ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 50),
                            child: Text(
                              widget.questionForumModel.QuestionTitle,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Container(
                            width: 800,
                            height: 200,
                            child: Container(
                              padding: const EdgeInsets.only(left: 10),
                              margin: const EdgeInsets.only(left: 50),
                              color: Colors.white,
                              width: 800,
                              child: ListView(
                                scrollDirection: Axis.vertical,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        widget.questionForumModel.QuestionText,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(fontSize: 20),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 50, top: 20),
                        child: Row(
                          children: [
                            (widget.questionForumModel.imageURL != "")
                                ? Row(
                                    children: [
                                      Container(
                                        width: 200,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.blue.shade300,
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                              builder: (context) {
                                                return ViewPhotoPage(
                                                    ImageURL: widget
                                                        .questionForumModel
                                                        .imageURL);
                                              },
                                            ));
                                          },
                                          child: const Center(
                                              child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.attach_file_rounded,
                                                color: Colors.white,
                                                size: 30,
                                              ),
                                              Text(
                                                'Vezi atasament...',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ],
                                          )),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 50,
                                      ),
                                    ],
                                  )
                                : const SizedBox(
                                    width: 0,
                                  ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () async {
                          if (selectedAction) {
                            setState(() {
                              selectedAction = !selectedAction;
                            });
                          }
                          debugPrint(
                              'initialized question answer submitting protocol');

                          final db = FirebaseFirestore.instance;
                          var questionsData;
                          int questionsLength = 1;
                          await db
                              .collection('answers')
                              .doc(widget.questionForumModel.id.toString())
                              .get()
                              .then((documentData) async {
                            if (documentData.exists) {
                              debugPrint('accesed answers data. yaaay!');
                              answersData = documentData.data() as Map<String,
                                  dynamic>; // Magic. Do not touch!!!

                              List answers = answersData['questionAnswers'];
                              answersLength = answers.length;
                              print(answersData);
                              setState(() {
                                isLoaded = true;
                              });
                            } else {
                              setState(() {
                                answersExist = false;
                                isLoaded = true;
                              });
                            }
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(left: 60),
                          width: 180,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.blue.shade200,
                              border: (!selectedAction)
                                  ? Border.all(
                                      color: Colors.white,
                                      width: 2,
                                    )
                                  : null),
                          child: Center(
                            child: Text(
                              'Vezi Raspunsurile',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          if (!selectedAction) {
                            setState(() {
                              selectedAction = !selectedAction;
                            });
                          }
                        },
                        child: Container(
                          margin: const EdgeInsets.only(left: 20),
                          width: 180,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.blue.shade200,
                              border: (selectedAction)
                                  ? Border.all(
                                      color: Colors.white,
                                      width: 2,
                                    )
                                  : null),
                          child: Center(
                            child: Text(
                              'Scrie un raspuns',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                child: (!selectedAction)
                    ? (answersExist)
                        ? (isLoaded)
                            ? Column(
                                children: [
                                  for (int i = 0; i < answersLength; i++)
                                    Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            answerElement(
                                              Text:
                                                  answersData['questionAnswers']
                                                      [i]['text'],
                                              authorID:
                                                  answersData['questionAnswers']
                                                      [i]['author'],
                                              imageURL:
                                                  answersData['questionAnswers']
                                                      [i]['imageURL'],
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
                            : Center(
                                child: Text(
                                  'Loading...',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                  ),
                                ),
                              )
                        : Center(
                            child: Text(
                              'Nu ai raspunsuri deocamdata. reintra in pagina pentru a da refresh...',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                              ),
                            ),
                          )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(),
                          InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return answerQuestionPage(
                                    questionData: widget.questionForumModel);
                              }));
                            },
                            child: InkWell(
                              child: Container(
                                margin: const EdgeInsets.only(right: 25),
                                width: 250,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blue.shade200,
                                ),
                                child: Center(
                                  child: Text(
                                    'Raspunde!',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w100,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:econ_made_easy_files/Aplication_Screens/Questions%20Group/view_photo_page.dart';
import 'package:econ_made_easy_files/Aplication_Screens/Questions%20Group/view_questions_page.dart';
import 'package:econ_made_easy_files/data/questions_list.dart';
import 'package:econ_made_easy_files/models/questionForumModel.dart';
import 'package:flutter/material.dart';

class viewQuestionPage extends StatefulWidget {
  QuestionForumModel questionForumModel;
  viewQuestionPage({super.key, required this.questionForumModel});

  @override
  State<viewQuestionPage> createState() => _viewQuestionPageState();
}

class _viewQuestionPageState extends State<viewQuestionPage> {
  int selectedAnswer = -1;
  int correctAnswer = 2;
  final textcontroller = TextEditingController();
  final titlecontroller = TextEditingController();
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
          ListView(
            scrollDirection: Axis.vertical,
            children: [
              Column(
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
                          Container(
                            margin: const EdgeInsets.only(left: 50),
                            child: Text(
                              'Intrebarea #${widget.questionForumModel.id} de la ${widget.questionForumModel.author}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300),
                            ),
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    widget.questionForumModel.QuestionText,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(fontSize: 20),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 40,
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
                            Container(
                              width: 250,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blue.shade300,
                              ),
                              child: Center(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Recompensa:     x30',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                    child: Image.asset('lib/images/flower.png'),
                                  )
                                ],
                              )),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                'Trimite intrebarea scrisa pana acum?',
                              ),
                              content: Text(
                                  'Va rugam sa va pastrati daddy issuesurile in afara intrebarilor.'),
                              actions: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 25),
                                    width: 150,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.blue.shade200,
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Mai incerc odata',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w100,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 25),
                                    width: 150,
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
                              ],
                            );
                          });
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
              )
            ],
          ),
        ],
      ),
    );
  }
}

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../Login group/loading_screen.dart';
import '../../models/questionForumModel.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class titleInputTextField extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final String hintText;
  final bool obscureText;
  const titleInputTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 25.0,
      ),
      margin: const EdgeInsets.only(right: 300),
      child: TextField(
        maxLines: 20,
        minLines: 1,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 10),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            fillColor: Colors.grey.shade200,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey)),
      ),
    );
  }
}

class questionInputTextField extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final String hintText;
  final bool obscureText;

  const questionInputTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 25.0,
      ),
      margin: const EdgeInsets.only(right: 300),
      child: TextField(
        maxLines: 20,
        minLines: 1,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(top: 200, left: 10),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            fillColor: Colors.grey.shade200,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey)),
      ),
    );
  }
}

void submitAnswer(
    String _answerTitle,
    String _answerText,
    String _author,
    DateTime _date,
    String _imageURL,
    String _authorEmail,
    int questionID) async {
  debugPrint('initialized question answer submitting protocol');

  final db = FirebaseFirestore.instance;
  var questionsData;
  int questionsLength = 1;
  await db
      .collection('answers')
      .doc("${questionID}")
      .get()
      .then((documentData) async {
    if (documentData.exists) {
      debugPrint('accesed answers data. yaaay!');
      questionsData =
          documentData.data() as Map<String, dynamic>; // Magic. Do not touch!!!

      List questions = questionsData['questionAnswers'];
      questionsLength = questions.length;
      debugPrint('______________________ ${questionsLength}');
      print(questionsData);
      await db.collection('answers').doc("${questionID}").set({
        'questionAnswers': [
          for (int i = 0; i < questionsLength; i++)
            {
              'text': questionsData['questionAnswers'][i]['text'],
              'author': questionsData['questionAnswers'][i]['author'],
              'time': questionsData['questionAnswers'][i]['time'],
              'imageURL': questionsData['questionAnswers'][i]['imageURL'],
              'authorEmail': questionsData['questionAnswers'][i]['authorEmail'],
              'isBest': questionsData['questionAnswers'][i]['isBest'],
              'authorUID': questionsData['questionAnswers'][i]['authorUID'],
            },
          {
            'text': _answerText,
            'author': _author,
            'time': _date,
            'imageURL': _imageURL,
            'authorEmail': _authorEmail,
            'isBest': false,
            'authorUID': LoadingScreen.userSettings?.uid,
          }
        ]
      });
    } else {
      await db.collection('answers').doc("${questionID}").set({
        'questionAnswers': [
          {
            'text': _answerText,
            'author': _author,
            'time': _date,
            'imageURL': _imageURL,
            'authorEmail': _authorEmail,
            'isBest': false,
            'authorUID': LoadingScreen.userSettings?.uid,
          }
        ]
      });
    }
    await db.collection('questions').doc(questionID.toString()).update({
      'nrOfQuestions': FieldValue.increment(1),
    });
    db.collection('Users').doc(LoadingScreen.userSettings?.uid).update({
      'answersCount': FieldValue.increment(1),
    });
  });
}

class answerQuestionPage extends StatefulWidget {
  final QuestionForumModel questionData;
  answerQuestionPage({super.key, required this.questionData});

  @override
  State<answerQuestionPage> createState() => _answerQuestionPageState();
}

class _answerQuestionPageState extends State<answerQuestionPage> {
  final textcontroller = TextEditingController();
  final titlecontroller = TextEditingController();
  bool selectedAction = true; // true -> type    false -> attach file
  String ImageURL = ''; // url of attacehd image
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
                      Container(
                        margin: const EdgeInsets.only(left: 50),
                        child: Text(
                          'Raspunde intrebarii #${widget.questionData.id} de la ${widget.questionData.author}',
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
                          margin: const EdgeInsets.only(left: 25),
                          child: (selectedAction)
                              ? questionInputTextField(
                                  controller: textcontroller,
                                  hintText: 'Scrie aici raspunsul tau!',
                                  obscureText: false,
                                )
                              : InkWell(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text(
                                              'Ce fel de poza vrei sa atasezi?',
                                            ),
                                            actions: [
                                              InkWell(
                                                onTap: () async {
                                                  // initialize image Picker
                                                  ImagePicker imagePicker =
                                                      ImagePicker();
                                                  XFile? file =
                                                      await imagePicker
                                                          .pickImage(
                                                              source:
                                                                  ImageSource
                                                                      .gallery);
                                                  Navigator.pop(context);
                                                  print('${file?.path}');

                                                  if (file == null) return;
                                                  //Import dart:core
                                                  String uniqueFileName =
                                                      DateTime.now()
                                                          .millisecondsSinceEpoch
                                                          .toString();

                                                  /*Step 2: Upload to Firebase storage*/
                                                  //Install firebase_storage
                                                  //Import the library

                                                  //Get a reference to storage root
                                                  Reference referenceRoot =
                                                      FirebaseStorage.instance
                                                          .ref();
                                                  Reference referenceDirImages =
                                                      referenceRoot
                                                          .child('images');

                                                  //Create a reference for the image to be stored
                                                  Reference
                                                      referenceImageToUpload =
                                                      referenceDirImages.child(
                                                          uniqueFileName);

                                                  //Handle errors/success
                                                  try {
                                                    //Store the file
                                                    await referenceImageToUpload
                                                        .putFile(
                                                            File(file.path));
                                                    //Success: get the download URL
                                                    ImageURL =
                                                        await referenceImageToUpload
                                                            .getDownloadURL();
                                                  } catch (error) {
                                                    //Some error occurred
                                                  }
                                                },
                                                child: Container(
                                                  margin: const EdgeInsets.only(
                                                      right: 25),
                                                  width: 150,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.blue.shade200,
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      'Galerie',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w100,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () async {
                                                  // initialize image Picker
                                                  ImagePicker imagePicker =
                                                      ImagePicker();
                                                  XFile? file =
                                                      await imagePicker
                                                          .pickImage(
                                                              source:
                                                                  ImageSource
                                                                      .camera);
                                                  Navigator.pop(context);
                                                  print('${file?.path}');

                                                  if (file == null) return;
                                                  //Import dart:core
                                                  String uniqueFileName =
                                                      DateTime.now()
                                                          .millisecondsSinceEpoch
                                                          .toString();

                                                  /*Step 2: Upload to Firebase storage*/
                                                  //Install firebase_storage
                                                  //Import the library

                                                  //Get a reference to storage root
                                                  Reference referenceRoot =
                                                      FirebaseStorage.instance
                                                          .ref();
                                                  Reference referenceDirImages =
                                                      referenceRoot
                                                          .child('images');

                                                  //Create a reference for the image to be stored
                                                  Reference
                                                      referenceImageToUpload =
                                                      referenceDirImages.child(
                                                          uniqueFileName);

                                                  //Handle errors/success
                                                  try {
                                                    //Store the file
                                                    await referenceImageToUpload
                                                        .putFile(
                                                            File(file.path));
                                                    //Success: get the download URL
                                                    ImageURL =
                                                        await referenceImageToUpload
                                                            .getDownloadURL();
                                                  } catch (error) {
                                                    //Some error occurred
                                                  }
                                                },
                                                child: Container(
                                                  margin: const EdgeInsets.only(
                                                      right: 25),
                                                  width: 150,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.blue.shade200,
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      'Camera',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w100,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        });
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        left: 25, right: 330),
                                    height: 220,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.white,
                                    ),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Ataseaza o poza ',
                                            style: TextStyle(
                                              fontSize: 40,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                          Icon(
                                            Icons.add,
                                            size: 60,
                                            color: Colors.blue.shade900,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )),
                      Container(
                        margin: const EdgeInsets.only(left: 80, top: 20),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (selectedAction == false)
                                    selectedAction = !selectedAction;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: Colors.blue.shade200,
                                  border: (selectedAction)
                                      ? Border.all(
                                          color: Colors.white,
                                          width: 2,
                                        )
                                      : null,
                                ),
                                child: Icon(
                                  Icons.type_specimen,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (selectedAction == true)
                                    selectedAction = !selectedAction;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: Colors.blue.shade200,
                                  border: (!selectedAction)
                                      ? Border.all(
                                          color: Colors.white,
                                          width: 2,
                                        )
                                      : null,
                                ),
                                child: Icon(
                                  Icons.attach_file_rounded,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 50,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 50),
                    child: const Text(
                      'Formuleaza-ti raspunsurile cat mai clar si respectuos pentru a avea sanse mai mari de a primi recompensa ;)',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w100),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      submitAnswer(
                        titlecontroller.text,
                        textcontroller.text,
                        LoadingScreen.userData.firstName,
                        DateTime.now(),
                        ImageURL,
                        LoadingScreen.userData.email,
                        widget.questionData.id,
                      );
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
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
                          'Trimite!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w100,
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

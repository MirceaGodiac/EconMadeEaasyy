import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:econ_made_easy_files/Aplication_Screens/Login%20group/auth_page.dart';
import 'package:econ_made_easy_files/Aplication_Screens/Login%20group/loading_screen.dart';
import 'package:econ_made_easy_files/models/question_model.dart';
import 'package:flutter/material.dart';
import '../../data/quizzes_list.dart';

// ignore: must_be_immutable
class ResultPage extends StatelessWidget {
  FinalResult result;
  int index;

  ResultPage({Key? key, required this.result, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    result.score = ((result.score / quizzes[index].length) * 100).round();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Rezultat"),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Felicitari",
              style: TextStyle(
                color: Colors.black,
                fontSize: 80.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "scorul tau este:",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 20.0),
            Text(
              result.score.toString(),
              style: const TextStyle(
                color: Colors.blue,
                fontSize: 100.0,
              ),
            ),
            MaterialButton(
              onPressed: () {
                LoadingScreen.userData.completedLessons[0][index.toString()] =
                    true;
                print(LoadingScreen.userData.completedLessons);
                FirebaseFirestore.instance
                    .collection('Users')
                    .doc(LoadingScreen.documentID.toString())
                    .update({
                  'completedLessons': [
                    {
                      '0': LoadingScreen.userData.completedLessons[0]['0'],
                      '1': LoadingScreen.userData.completedLessons[0]['1'],
                      '2': LoadingScreen.userData.completedLessons[0]['2'],
                      '3': LoadingScreen.userData.completedLessons[0]['3'],
                      '4': LoadingScreen.userData.completedLessons[0]['4'],
                      '5': LoadingScreen.userData.completedLessons[0]['5'],
                      '6': LoadingScreen.userData.completedLessons[0]['6'],
                      '7': LoadingScreen.userData.completedLessons[0]['7'],
                      '8': LoadingScreen.userData.completedLessons[0]['8'],
                      '9': LoadingScreen.userData.completedLessons[0]['9'],
                      '10': LoadingScreen.userData.completedLessons[0]['10'],
                    }
                  ],
                  'credits': LoadingScreen.userData.completedLessons[0]
                          [index.toString()]
                      ? LoadingScreen.userData.credits + result.score
                      : LoadingScreen.userData.credits
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => (const AuthPage())),
                  ),
                );
              },
              color: Colors.blue[200],
              textColor: Colors.black,
              child: const Text("catre pagina principala"),
            )
          ],
        ),
      ),
    );
  }
}
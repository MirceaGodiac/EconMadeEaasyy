import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:econ_made_easy_files/main.dart';
import 'package:flutter/material.dart';

import '../Login group/loading_screen.dart';

class redeem_credits extends StatefulWidget {
  int obtainedCredits;
  redeem_credits({super.key, required this.obtainedCredits});

  @override
  State<redeem_credits> createState() => _redeem_creditsState();
}

class _redeem_creditsState extends State<redeem_credits> {
  @override
  Widget build(BuildContext context) {
    var screenSizeData = MediaQuery.of(context);
    double screenWidth = screenSizeData.size.width;
    double screenHeight = screenSizeData.size.height;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              'lib/images/logindoodle.jpg',
            ),
          ),
          SizedBox.expand(
            child: Container(color: Colors.black87),
          ),
          SizedBox.expand(
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: screenHeight * (1 / 2),
                      child: Image.asset(
                        'lib/images/finishQuiz.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      'Feliciari! Ai terminat quizul!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    ),
                    Text(
                      'Ai obtinut ${widget.obtainedCredits} puncte!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      'Poti folosi aceste puncte pentru a pune o intrebare pe forum!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    InkWell(
                      onTap: () async {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return EconMadeEasy();
                          },
                        ));
                        await FirebaseFirestore.instance
                            .collection('Users')
                            .doc(LoadingScreen.userSettings!.uid)
                            .update({
                          'credits':
                              FieldValue.increment(widget.obtainedCredits),
                        });
                      },
                      child: Container(
                        height: screenWidth / 4 * (1 / 6),
                        width: screenWidth / 4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue.shade200,
                            border: Border.all(
                              color: Colors.black12,
                              width: 3,
                            )),
                        child: Center(
                            child: Text(
                          'Revendica',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        )),
                      ),
                    )
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}

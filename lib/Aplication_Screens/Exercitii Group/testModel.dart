import 'package:flutter/material.dart';

class testType1Page extends StatefulWidget {
  Color levelColor;
  testType1Page({super.key, required this.levelColor});

  @override
  State<testType1Page> createState() => _testType1PageState();
}

class _testType1PageState extends State<testType1Page> {
  int selectedAnswer = -1;
  int correctAnswer = 2;
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              'lib/images/logindoodle.jpg',
            ),
          ),
          SizedBox.expand(
            child: Container(
              color: Colors.black87,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      Container(
                        margin: const EdgeInsets.only(top: 50),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                          border: Border.all(color: Colors.black12, width: 5),
                          color: Colors.amber.shade300,
                        ),
                        child: Container(
                          margin: const EdgeInsets.all(20),
                          child: const Text(
                            'Geometrie in plan: 3/8',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w200),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 50, right: 50),
                        child: (selectedAnswer == -1)
                            ? const SizedBox(
                                width: 150,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Skip ',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontWeight: FontWeight.w100),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ],
                                ),
                              )
                            : const InkWell(
                                child: SizedBox(
                                  width: 150,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Verifica! ',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 30,
                                            fontWeight: FontWeight.w100),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 85,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.amber,
                          width: 5,
                        ),
                        borderRadius: BorderRadius.circular(35)),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(30),
                      ),
                      child: SizedBox(
                        width: 900,
                        child: Image.asset(
                          'lib/images/exerciseImage.jpg',
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              if (selectedAnswer != 0)
                                selectedAnswer = 0;
                              else
                                selectedAnswer = -1;
                            });
                          },
                          child: Container(
                            width: 250,
                            height: 140,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.red.shade300,
                                border: (selectedAnswer == 0)
                                    ? Border.all(color: Colors.white, width: 10)
                                    : Border.all(
                                        color: Colors.black12, width: 10)),
                            child: const Center(
                              child: Text(
                                'Varianta A',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              if (selectedAnswer != 1)
                                selectedAnswer = 1;
                              else
                                selectedAnswer = -1;
                            });
                          },
                          child: Container(
                            width: 250,
                            height: 140,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.amber,
                                border: (selectedAnswer == 1)
                                    ? Border.all(color: Colors.white, width: 10)
                                    : Border.all(
                                        color: Colors.black12, width: 10)),
                            child: const Center(
                              child: Text(
                                'Varianta B',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              if (selectedAnswer != 2)
                                selectedAnswer = 2;
                              else
                                selectedAnswer = -1;
                            });
                          },
                          child: Container(
                            width: 250,
                            height: 140,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.green[300],
                                border: (selectedAnswer == 2)
                                    ? Border.all(color: Colors.white, width: 10)
                                    : Border.all(
                                        color: Colors.black12, width: 10)),
                            child: const Center(
                              child: Text(
                                'Varianta C',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              if (selectedAnswer != 3) {
                                selectedAnswer = 3;
                              } else {
                                selectedAnswer = -1;
                              }
                            });
                          },
                          child: Container(
                            width: 250,
                            height: 140,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.blue.shade200,
                                border: (selectedAnswer == 3)
                                    ? Border.all(color: Colors.white, width: 10)
                                    : Border.all(
                                        color: Colors.black12, width: 10)),
                            child: const Center(
                              child: Text(
                                'Varianta D',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:econ_made_easy_files/Aplication_Screens/Exercitii%20Group/secondSelectExerciseTypeScreenSubjectI.dart';
import 'package:econ_made_easy_files/Aplication_Screens/Exercitii%20Group/testModel.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class thirdSelectExerciseTypeScreenSubjectScreenI extends StatefulWidget {
  thirdSelectExerciseTypeScreenSubjectScreenI({super.key});

  @override
  State<thirdSelectExerciseTypeScreenSubjectScreenI> createState() =>
      _thirdSelectExerciseTypeScreenSubjectScreenIState();
}

class _thirdSelectExerciseTypeScreenSubjectScreenIState
    extends State<thirdSelectExerciseTypeScreenSubjectScreenI> {
  var materialsData = {
    0: 'Functii de gradul I',
    1: 'Geometrie in plan',
    2: 'Ecuatii lineare',
    3: 'Sisteme de ecuatii',
    4: 'Formule de calcul prescurtat',
    5: 'Functii de gradul II',
  };
  static var nrOfexercises = [3, 3, 3, 3, 3, 3];
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 210, 60, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 40, left: 40),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) {
                            return secondSelectExerciseTypeIScreen();
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
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 40),
                child: Text(
                  'Alege cate exercitii doresti sa rezolvi:',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w200),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return testType1Page(
                        levelColor: const Color.fromRGBO(255, 210, 60, 1),
                      );
                    },
                  ));
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 40, right: 40),
                  child: const Row(
                    children: [
                      Text(
                        'Incepe! ',
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
            ],
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    left: 40,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(60)),
                    color: Colors.amber,
                  ),
                  width: 650,
                  height: 600,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      for (int i = 0; i <= 5; i++)
                        if (secondSelectExerciseTypeIScreen
                            .selectedMaterials[i])
                          Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: 150,
                                    width: 500,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(40),
                                        ),
                                        color: Colors.amber.shade600,
                                        border: Border.all(
                                            color: Colors.black12, width: 5)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left: 10),
                                          child: Text(
                                            materialsData[i].toString(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 30,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(right: 20),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    if (nrOfexercises[i] != 1) {
                                                      nrOfexercises[i]--;
                                                    }
                                                  });
                                                },
                                                child: Container(
                                                  width: 40,
                                                  height: 40,
                                                  child: Icon(
                                                    Icons.arrow_back_ios_new,
                                                    color: Colors.white,
                                                    size: 20,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 40,
                                              ),
                                              Text(
                                                nrOfexercises[i].toString(),
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                              const SizedBox(
                                                width: 40,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    nrOfexercises[i]++;
                                                  });
                                                },
                                                child: const SizedBox(
                                                  width: 40,
                                                  height: 40,
                                                  child: Icon(
                                                    Icons
                                                        .arrow_forward_ios_outlined,
                                                    color: Colors.white,
                                                    size: 20,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 480,
                                    alignment: Alignment.topRight,
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          secondSelectExerciseTypeIScreen
                                              .selectedMaterials[i] = false;
                                        });
                                      },
                                      child: Container(
                                          margin:
                                              const EdgeInsets.only(top: 20),
                                          child: const Icon(
                                            Icons.cancel_outlined,
                                            color: Colors.white,
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              )
                            ],
                          )
                    ],
                  ),
                ),
                Container(
                  height: 650,
                  margin: const EdgeInsets.only(right: 50, top: 7),
                  child: Image.asset(
                    'lib/images/Illustration34_1.png',
                    fit: BoxFit.contain,
                    filterQuality: FilterQuality.medium,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

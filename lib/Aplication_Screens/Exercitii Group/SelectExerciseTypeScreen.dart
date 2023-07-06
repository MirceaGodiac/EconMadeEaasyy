import 'package:econ_made_easy_files/Aplication_Screens/Exercitii%20Group/secondSelectExerciseTypeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_detector/flutter_swipe_detector.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class SelectExerciseTypeScreen extends StatefulWidget {
  int length = 0;
  SelectExerciseTypeScreen({super.key, required this.length});

  @override
  State<SelectExerciseTypeScreen> createState() =>
      _SelectExerciseTypeScreenState();
}

class _SelectExerciseTypeScreenState extends State<SelectExerciseTypeScreen> {
  int selectedCategoryIndex = 0;
  final scrollController = ScrollController();
  Color _backgroundColor = Colors.green.shade600;

  @override
  Widget build(BuildContext context) {
    var screenSizeData = MediaQuery.of(context);
    double screenWidth = screenSizeData.size.width;
    double screenHeight = screenSizeData.size.height;
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            AnimatedPhysicalModel(
                duration: const Duration(milliseconds: 600),
                color: ((selectedCategoryIndex == 0) ||
                        (selectedCategoryIndex == -1) ||
                        (selectedCategoryIndex == 0))
                    ? Colors.green.shade200
                    : (selectedCategoryIndex == 1)
                        ? Colors.green.shade700
                        : (selectedCategoryIndex == 2)
                            ? Colors.green.shade900
                            : Colors.red,
                elevation: 0,
                shadowColor: Colors.black,
                shape: BoxShape.rectangle,
                child: Container()),
            Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(60))),
                height: double.infinity,
                width: screenWidth,
                child: PageView(
                  onPageChanged: (value) {
                    setState(() {
                      selectedCategoryIndex = value;
                    });
                  },
                  children: [
                    Container(
                      child: InkWell(
                        onTap: () async {
                          var materie;

                          await FirebaseFirestore.instance
                              .collection('quizes')
                              .doc('Subiect I')
                              .collection('materii')
                              .get()
                              .then((collectionData) {
                            materie = collectionData;
                            widget.length = collectionData.docs.length;
                            print(materie.docs[0].id);
                          });
                          print('____');
                          print(widget.length);
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return secondSelectExerciseTypeScreen(
                                subject: 'Subiect I',
                                length: widget.length,
                                materie: materie,
                                saveData: false,
                                selectedLength: 0,
                              );
                            },
                          ));
                        },
                        child: Container(
                          height: double.infinity,
                          width: screenWidth * (9 / 10),
                          margin: const EdgeInsets.only(
                              top: 20, bottom: 20, left: 30, right: 30),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(40),
                            ),
                            color: Colors.white30,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 265,
                                child: Container(
                                  margin: const EdgeInsets.only(top: 20),
                                  child: Image.asset(
                                    "lib/images/divisibleImage.png",
                                    filterQuality: FilterQuality.medium,
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 265,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(40),
                                  ),
                                  color: Colors.green.shade300,
                                ),
                                margin: const EdgeInsets.only(
                                  left: 30,
                                  right: 30,
                                  bottom: 30,
                                  top: 60,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(top: 30),
                                      child: const Text(
                                        'Sectiunea I: Primul Subiect',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 30,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 20),
                                      child: const Text(
                                        '154 exercitii',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 10),
                                      child: const Text(
                                        'Incepe cu exercitii simple pentru a-ti pune bazele',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 60,
                                    ),
                                    Center(
                                      child: Container(
                                        width: 300,
                                        height: 35,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10)),
                                            color: Colors.green.shade400),
                                        child: const Center(
                                          child: Text(
                                            'Incepe',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400,
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
                        ),
                      ),
                    ),
                    Container(
                      child: InkWell(
                        onTap: () async {
                          var materie;
                          await FirebaseFirestore.instance
                              .collection('quizes')
                              .doc('Subiect II')
                              .collection('materii')
                              .get()
                              .then((collectionData) {
                            materie = collectionData;
                            widget.length = collectionData.docs.length;
                          });

                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return secondSelectExerciseTypeScreen(
                                subject: 'Subiect II',
                                length: widget.length,
                                materie: materie,
                                saveData: false,
                                selectedLength: 0,
                              );
                            },
                          ));
                        },
                        child: Container(
                          height: double.infinity,
                          width: screenWidth * (9 / 10),
                          margin: const EdgeInsets.only(
                              top: 20, bottom: 20, left: 30, right: 20),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(40),
                            ),
                            color: Colors.white30,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 265,
                                child: Container(
                                  margin: const EdgeInsets.only(top: 20),
                                  child: Image.asset(
                                    "lib/images/finishedAppEasterEgg.jpg",
                                    filterQuality: FilterQuality.medium,
                                  ),
                                ),
                              ),
                              Container(
                                height: 265,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(40),
                                    ),
                                    color: Colors.green.shade400),
                                margin: const EdgeInsets.only(
                                    left: 30, right: 30, bottom: 30, top: 60),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(top: 30),
                                      child: const Text(
                                        'Sectiunea II: Al Doilea Subiect',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 30,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 20),
                                      child: const Text(
                                        '120 exercitii',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 10),
                                      child: const Text(
                                        'Continua cu niste exercitii putin mai complicate',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 60,
                                    ),
                                    Center(
                                      child: Container(
                                        width: 300,
                                        height: 35,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10)),
                                            color: Colors.green.shade500),
                                        child: const Center(
                                          child: Text(
                                            'Incepe',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400,
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
                        ),
                      ),
                    ),
                    Container(
                      child: InkWell(
                        onTap: () async {
                          var materie;
                          await FirebaseFirestore.instance
                              .collection('quizes')
                              .doc('Subiect III')
                              .collection('materii')
                              .get()
                              .then((collectionData) {
                            materie = collectionData;
                            widget.length = collectionData.docs.length;
                          });
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return secondSelectExerciseTypeScreen(
                                subject: 'Subiect III',
                                length: widget.length,
                                materie: materie,
                                saveData: false,
                                selectedLength: 0,
                              );
                            },
                          ));
                        },
                        child: Container(
                          height: double.infinity,
                          width: screenWidth * (9 / 10),
                          margin: const EdgeInsets.only(
                              top: 20, bottom: 20, left: 30, right: 30),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(40),
                            ),
                            color: Colors.white30,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 265,
                                child: Container(
                                  margin: const EdgeInsets.only(top: 20),
                                  child: Image.asset(
                                    "lib/images/finishedAppEasterEgg.jpg",
                                    filterQuality: FilterQuality.medium,
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 260,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(40),
                                    ),
                                    color: Colors.green.shade800),
                                margin: const EdgeInsets.only(
                                    left: 30, right: 30, bottom: 30, top: 60),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(top: 30),
                                      child: const Text(
                                        'Sectiunea III: Al Treilea Subiect',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 30,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 20),
                                      child: const Text(
                                        '181 exercitii',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 10),
                                      child: const Text(
                                        'Aprofundeaza cu subiectul III',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 60,
                                    ),
                                    Center(
                                      child: Container(
                                        width: 300,
                                        height: 35,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10)),
                                            color: Colors.green.shade700),
                                        child: const Center(
                                          child: Text(
                                            'Incepe',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400,
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
                        ),
                      ),
                    ),
                  ],
                )),
            SizedBox.expand(
              child: Container(
                margin: const EdgeInsets.only(top: 25, left: 25),
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 75,
                    height: 75,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.green.shade300),
                    child: Center(
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

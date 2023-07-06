import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:econ_made_easy_files/Aplication_Screens/Exercitii%20Group/SelectExerciseTypeScreen.dart';
import 'package:econ_made_easy_files/Aplication_Screens/Exercitii%20Group/thirdSelectExerciseTypeScreenSubject.dart';
import 'package:flutter/material.dart';

List<bool> selectedMaterials = [];
List<int> numberOfSelectedMaterials = [];

class materieListItem extends StatefulWidget {
  String title;
  int numberOfExercises;
  double screenWidth;
  int elementIndex;

  materieListItem({
    super.key,
    required this.screenWidth,
    required this.numberOfExercises,
    required this.title,
    required this.elementIndex,
  });

  @override
  State<materieListItem> createState() => _materieListItemState();
}

class _materieListItemState extends State<materieListItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          if (selectedMaterials[widget.elementIndex] == false) {
            selectedMaterials[widget.elementIndex] = true;
          } else {
            selectedMaterials[widget.elementIndex] = false;
          }
        });
      },
      child: Container(
        height: widget.screenWidth * (18.75 / 100),
        width: widget.screenWidth * (30 / 100),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            color: Colors.green.shade400,
            border: Border.all(
                color: (selectedMaterials[widget.elementIndex] == true)
                    ? Colors.green.shade700
                    : Colors.green.shade400,
                width: 5)),
        child: Container(
          margin: const EdgeInsets.only(bottom: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              (selectedMaterials[widget.elementIndex] == true)
                  ? Container(
                      alignment: Alignment.topRight,
                      child: Container(
                        margin: const EdgeInsets.only(top: 10, right: 10),
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    )
                  : Container(),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: FittedBox(
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Text(
                (widget.numberOfExercises != 0)
                    ? '${widget.numberOfExercises} exercitii'
                    : 'coming soon!',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w100,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class secondSelectExerciseTypeScreen extends StatefulWidget {
  int length;
  int selectedLength;
  var materie;
  String subject;
  bool saveData;
  secondSelectExerciseTypeScreen({
    super.key,
    required this.subject,
    required this.materie,
    required this.length,
    required this.saveData,
    required this.selectedLength,
  });

  @override
  State<secondSelectExerciseTypeScreen> createState() =>
      _secondSelectExerciseTypeScreenState();
}

class _secondSelectExerciseTypeScreenState
    extends State<secondSelectExerciseTypeScreen> {
  @override
  Widget build(BuildContext context) {
    var screenSizeData = MediaQuery.of(context);

    double screenWidth = screenSizeData.size.width;
    if (!widget.saveData) {
      selectedMaterials = List<bool>.filled(widget.length, false);
      numberOfSelectedMaterials = List<int>.filled(widget.length, 0);
    }
    return Scaffold(
        backgroundColor: Colors.green.shade300,
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    margin: const EdgeInsets.only(top: 40, left: 40),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 40),
                          child: const Text(
                            'Alege-ti exercitiile la care vrei sa exersezi!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 40),
                  height: 40,
                  width: 150,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) {
                          int x = 0;
                          for (int i = 0; i < selectedMaterials.length; i++) {
                            if (selectedMaterials[i] == true) x++;
                          }
                          debugPrint("$x ____");
                          return thirdSelectExerciseTypeScreenSubjectScreenI(
                            subject: widget.subject,
                            length: widget.length,
                            materie: widget.materie,
                            materiiLength: x,
                          );
                        },
                      ));
                    },
                    child: const SizedBox(
                      child: Row(
                        children: [
                          Center(
                            child: Text(
                              'Inainte  ',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w100),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white,
                            size: 30,
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            SizedBox(
                child: Column(
              children: [
                for (int i = 0; i < widget.length; i += 3)
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          if (i < widget.length)
                            materieListItem(
                              screenWidth: screenWidth,
                              numberOfExercises:
                                  widget.materie.docs[i]['exercitii'].length,
                              title: widget.materie.docs[i].id,
                              elementIndex: i,
                            ),
                          if (i < widget.length - 1)
                            materieListItem(
                              screenWidth: screenWidth,
                              numberOfExercises: widget
                                  .materie.docs[i + 1]['exercitii'].length,
                              title: widget.materie.docs[i + 1].id,
                              elementIndex: i + 1,
                            ),
                          if (i < widget.length - 2)
                            materieListItem(
                              screenWidth: screenWidth,
                              numberOfExercises: widget
                                  .materie.docs[i + 2]['exercitii'].length,
                              title: widget.materie.docs[i + 2].id,
                              elementIndex: i + 2,
                            ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      )
                    ],
                  )
              ],
            )),
          ],
        ));
  }
}

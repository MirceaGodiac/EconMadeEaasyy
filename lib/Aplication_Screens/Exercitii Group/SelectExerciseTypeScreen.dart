import 'package:flutter/material.dart';
import 'package:flutter_swipe_detector/flutter_swipe_detector.dart';

class SelectExerciseTypeScreen extends StatefulWidget {
  const SelectExerciseTypeScreen({super.key});

  @override
  State<SelectExerciseTypeScreen> createState() =>
      _SelectExerciseTypeScreenState();
}

class _SelectExerciseTypeScreenState extends State<SelectExerciseTypeScreen> {
  double selectedCategoryIndex = 0;
  final scrollController = ScrollController();
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        margin: const EdgeInsets.only(top: 30, bottom: 30),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(40),
          ),
          color: Colors.white30,
        ),
        child: AnimatedPhysicalModel(
          duration: const Duration(milliseconds: 600),
          color: (selectedCategoryIndex == 0)
              ? const Color.fromRGBO(255, 210, 60, 1)
              : (selectedCategoryIndex == 1.0)
                  ? Colors.orange.shade700
                  : (selectedCategoryIndex == 2.0)
                      ? Colors.red.shade800
                      : Colors.red,
          elevation: 0,
          shadowColor: Colors.black,
          shape: BoxShape.rectangle,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(60))),
            height: double.infinity,
            width: 1090,
            child: ListView(
              controller: scrollController,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: [
                SwipeDetector(
                  onSwipeRight: (offset) {
                    setState(() {
                      selectedCategoryIndex--;
                      jumpToPosition(selectedCategoryIndex);
                    });
                  },
                  onSwipeLeft: (offset) {
                    setState(() {
                      selectedCategoryIndex++;
                      jumpToPosition(selectedCategoryIndex);
                    });
                  },
                  child: Container(
                    height: double.infinity,
                    width: 1000,
                    margin: const EdgeInsets.only(
                        top: 20, bottom: 20, left: 60, right: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 265,
                          child: Container(
                            margin: const EdgeInsets.only(top: 40),
                            child: Image.asset(
                              "lib/images/finishedAppEasterEgg.jpg",
                              filterQuality: FilterQuality.medium,
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 285,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(40),
                            ),
                            color: Colors.amber.shade500,
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
                                margin: const EdgeInsets.only(top: 40),
                                child: const Text(
                                  'Incepe cu exercitii simple pentru a-ti pune bazele',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w300),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SwipeDetector(
                  onSwipeRight: (offset) {
                    setState(() {
                      selectedCategoryIndex--;
                      jumpToPosition(selectedCategoryIndex);
                    });
                  },
                  onSwipeLeft: (offset) {
                    setState(() {
                      selectedCategoryIndex++;
                      jumpToPosition(selectedCategoryIndex);
                    });
                  },
                  child: Container(
                    height: double.infinity,
                    width: 1000,
                    margin: const EdgeInsets.only(
                        top: 20, bottom: 20, left: 10, right: 20),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
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
                            margin: const EdgeInsets.only(top: 40),
                            child: Image.asset(
                              "lib/images/finishedAppEasterEgg.jpg",
                              filterQuality: FilterQuality.medium,
                            ),
                          ),
                        ),
                        Container(
                          height: 340,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(40),
                              ),
                              color: Colors.orange.shade800),
                          margin: const EdgeInsets.only(
                              left: 30, right: 30, bottom: 30, top: 60),
                        ),
                      ],
                    ),
                  ),
                ),
                SwipeDetector(
                  onSwipeRight: (offset) {
                    setState(() {
                      selectedCategoryIndex--;
                      jumpToPosition(selectedCategoryIndex);
                    });
                  },
                  onSwipeLeft: (offset) {
                    setState(() {
                      selectedCategoryIndex++;
                      jumpToPosition(selectedCategoryIndex);
                    });
                  },
                  child: Container(
                    height: double.infinity,
                    width: 1000,
                    margin: const EdgeInsets.only(
                        top: 20, bottom: 20, left: 10, right: 60),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
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
                            margin: const EdgeInsets.only(top: 40),
                            child: Image.asset(
                              "lib/images/finishedAppEasterEgg.jpg",
                              filterQuality: FilterQuality.medium,
                            ),
                          ),
                        ),
                        Container(
                          height: 340,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(40),
                              ),
                              color: Colors.red.shade900),
                          margin: const EdgeInsets.only(
                              left: 30, right: 30, bottom: 30, top: 60),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> jumpToPosition(double selectedIndex) async {
    print(selectedIndex);
    if (selectedIndex == 3) {
      await scrollController.animateTo((2120),
          duration: Duration(milliseconds: 200), curve: Curves.decelerate);
      scrollController.animateTo(2060,
          duration: Duration(milliseconds: 200), curve: Curves.decelerate);
      selectedCategoryIndex--;
    } else if (selectedIndex == -1.0) {
      await scrollController.animateTo(0,
          duration: Duration(milliseconds: 200), curve: Curves.decelerate);
      scrollController.animateTo(50,
          duration: Duration(milliseconds: 200), curve: Curves.decelerate);
      selectedCategoryIndex++;
    } else {
      double indent = 1050;
      if (selectedIndex == 0) {
        scrollController.animateTo(50,
            duration: Duration(milliseconds: 600), curve: Curves.decelerate);
      } else {
        scrollController.animateTo(selectedIndex * indent,
            duration: Duration(milliseconds: 600), curve: Curves.decelerate);
      }
    }
  }
}

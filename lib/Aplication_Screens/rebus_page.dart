// ignore_for_file: avoid_print

import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RebusElement extends StatefulWidget {
  // a button from the 7x7 matrix

  // store the buttons position, a way to store
  int i;
  int j;

  String text;
  bool isTrue;
  RebusElement(
      {super.key,
      required this.text,
      required this.isTrue,
      required this.i,
      required this.j});
  
  @override
  State<RebusElement> createState() => _RebusElementState();
}

class _RebusElementState extends State<RebusElement> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    Color selected() {
      if (!pressed) {
        return Colors.grey.shade400;
      } else {
        return Colors.blue;
      }
    }

    return Container(
      margin: const EdgeInsets.all(10),
      width: 70,
      height: 70,
      decoration: BoxDecoration(
          color: selected(),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: InkWell(
        child: Center(
          child: Text(
            widget.text,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        onTap: () {
          setState(() {
            pressed = !pressed;
            RebusPage.RebusMatrix[widget.i][widget.j][1] =
                !(RebusPage.RebusMatrix[widget.i][widget.j][1] as bool);
            if (kDebugMode) {
              print(RebusPage.RebusMatrix[widget.i][widget.j][1].toString());
            }
          });
        },
      ),
    );
  }
}

class RebusPage extends StatefulWidget {
  const RebusPage({super.key});
  // ignore: non_constant_identifier_names
  static var RebusMatrix =
      List.generate(8, (_) => List.generate(7, (_) => ['0', false]));
  @override
  State<RebusPage> createState() => _RebusPageState();
}

class _RebusPageState extends State<RebusPage> {
  @override
  Widget build(BuildContext context) {
    var rng = Random();
    // ignore: non_constant_identifier_names

    String word = "AAAAA";

    // 1 is horizontal, 0 is vertical
    int direction = rng.nextInt(2);

    // ignore: duplicate_ignore, duplicate_ignore
    if (direction == 1) {
      int startX = rng.nextInt(8 - word.length) + 1;
      int startY = rng.nextInt(6);
      for (int i = startX; i < word.length + startX; i++) {
        RebusPage.RebusMatrix[i - startX + 1]
            [startY] = [word[i - startX], true];
      }
      for (int i = 1; i < 8; i++) {
        for (int j = 0; j < 7; j++) {
          if (RebusPage.RebusMatrix[i][j][1] == false) {
            RebusPage.RebusMatrix[i]
                [j] = [String.fromCharCode(rng.nextInt(26) + 97), false];
          }
        }
      }
    // ignore: duplicate_ignore, duplicate_ignore
    } else {
      // ignore: avoid_print
      print("HEREEE");
      int startX = rng.nextInt(7 - word.length);
      int startY = rng.nextInt(7);
      for (int i = startX; i < word.length + startX; i++) {
        RebusPage.RebusMatrix[startY]
            [i - startX + 1] = [word[i - startX], true];
      }
      for (int i = 0; i < 7; i++) {
        for (int j = 1; j < 8; j++) {
          if (RebusPage.RebusMatrix[j][i][1] == false) {
            RebusPage.RebusMatrix[j]
                [i] = [String.fromCharCode(rng.nextInt(26) + 97), false];
          }
        }
      }
    }

    return Container(
      width: 1030,
      alignment: Alignment.center,
      child: Center(
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                for (int i = 1; i < 8; i++)
                  Row(
                    children: [
                      for (int j = 0; j < 7; j++)
                        RebusElement(
                            i: i,
                            j: j,
                            text: RebusPage.RebusMatrix[i][j][0].toString(),
                            isTrue: RebusPage.RebusMatrix[i][j][1] as bool)
                    ],
                  )
              ],
            ),
            Container(
              color: Colors.blue,
              width: 30,
              height: 10,
              child: InkWell(
                onTap: () {
                  // check if all buttons are set on false
                  bool correct = true;
                  for (int i = 1; i < 8; i++) {
                    for (int j = 0; j < 7; j++) {
                      if (RebusPage.RebusMatrix[i][j][1] as bool == true) {
                        // ignore: avoid_print
                        print(RebusPage.RebusMatrix[i][j][1] as bool);
                        correct = false;
                      }
                    }
                  }
                  if (correct) {
                    print("Bravo!");
                  } else
                    print("almost ther!");
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

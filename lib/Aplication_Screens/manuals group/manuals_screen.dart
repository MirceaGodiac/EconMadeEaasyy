import 'dart:io';

import 'package:econ_made_easy_files/Aplication_Screens/manuals%20group/materials_data.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../Resources group/pdf_viewer_page.dart';
import '../Resources group/view_material_page.dart';

bool oneButtonLoading =
    false; // to make other pdf buttons non-functional when one of them is loading

class manualScreenElement extends StatefulWidget {
  String manualTitle;
  double width;
  int classIndex;
  int manualIndex;

  manualScreenElement(
      {super.key,
      required this.width,
      required this.manualTitle,
      required this.classIndex,
      required this.manualIndex});

  @override
  State<manualScreenElement> createState() => _manualScreenElementState();
}

class _manualScreenElementState extends State<manualScreenElement> {
  bool loadedManual = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        oneButtonLoading = true;
        print('loading...');
        setState(() {
          loadedManual = true;
        });
        print(manuals[widget.classIndex][widget.manualIndex].URL);
        final file = await PDFapi.loadNetwork(
            manuals[widget.classIndex][widget.manualIndex].URL);
        openPDF(context, file);
        print('loading...');
        setState(() {
          loadedManual = false;
        });
        oneButtonLoading = false;
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.green.shade400,
            borderRadius: BorderRadius.circular(20)),
        width: widget.width,
        height: widget.width * (9 / 16),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(
                  child: (!loadedManual)
                      ? Text(
                          widget.manualTitle,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                          ),
                        )
                      : Text(
                          'Se incarca...',
                        ))
            ],
          ),
        ),
      ),
    );
  }
}

class ManualsScreen extends StatefulWidget {
  const ManualsScreen({super.key});

  @override
  State<ManualsScreen> createState() => _ManualsScreenState();
}

class _ManualsScreenState extends State<ManualsScreen> {
  @override
  Widget build(BuildContext context) {
    var screenSizeData = MediaQuery.of(context);
    double screenWidth = screenSizeData.size.width;
    double screenHeight = screenSizeData.size.height;
    return Scaffold(
      backgroundColor: Colors.green.shade300,
      body: Column(children: [
        SizedBox(
          height: screenHeight / 6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 40,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) {
                          return EconMadeEasy();
                        },
                      ));
                    },
                    child: const SizedBox(
                      child: Text(
                        '< Inapoi',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 10),
              width: screenWidth * (2 / 3),
            ),
          ],
        ),
        SizedBox(
          width: screenWidth,
          height: screenHeight * (5 / 6) - 60,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              for (int i = 0; i < manuals.length; i++)
                Column(
                  children: [
                    Text(
                      'Manuale clasa a ${5 + i}a',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(children: [
                      for (int j = 0; j < manuals[i].length; j += 3)
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                if (j < manuals[i].length)
                                  manualScreenElement(
                                    width: screenWidth / 4,
                                    manualTitle: manuals[i][j].Title,
                                    classIndex: i,
                                    manualIndex: j,
                                  ),
                                if (j < manuals[i].length - 1)
                                  manualScreenElement(
                                    width: screenWidth / 4,
                                    manualTitle: manuals[i][j + 1].Title,
                                    classIndex: i,
                                    manualIndex: j + 1,
                                  ),
                                if (j < manuals[i].length - 2)
                                  manualScreenElement(
                                    width: screenWidth / 4,
                                    manualTitle: manuals[i][j + 2].Title,
                                    classIndex: i,
                                    manualIndex: j + 2,
                                  ),
                              ],
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                          ],
                        ),
                      Divider(
                        color: Colors.green.shade600,
                        height: 50,
                      )
                    ])
                  ],
                )
            ],
          ),
        ),
      ]),
    );
  }
}

void openPDF(BuildContext context, File file) => Navigator.of(context)
    .push(MaterialPageRoute(builder: (context) => PDFViewerPage(file: file!)));

import 'package:econ_made_easy_files/Aplication_Screens/Resources%20group/resourcesData.dart';
import 'package:econ_made_easy_files/Aplication_Screens/Resources%20group/view_material_page.dart';
import 'package:flutter/material.dart';

class resurseListItem extends StatelessWidget {
  int index;
  String title;
  int nrOfVideos;
  int nrOfDocs;
  double screenWidth;
  resurseListItem({
    super.key,
    required this.screenWidth,
    required this.nrOfDocs,
    required this.nrOfVideos,
    required this.title,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return ViewMaterialPage(index: index);
        }));
      },
      child: Container(
        width: screenWidth * (2 / 7),
        height: screenWidth * (2 / 7) * (1 / 2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.amber.shade400),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
            ),
          ),
          (nrOfVideos != 0)
              ? Text('${nrOfVideos} filmulete',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ))
              : SizedBox(),
          (nrOfDocs != 0)
              ? Text('${nrOfDocs} PDF-uri',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ))
              : SizedBox(),
          (nrOfDocs == 0 && nrOfVideos == 0)
              ? Text('Coming soon!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ))
              : SizedBox(),
        ]),
      ),
    );
  }
}

class searchMaterials extends StatefulWidget {
  const searchMaterials({super.key});

  @override
  State<searchMaterials> createState() => _searchMaterialsState();
}

class _searchMaterialsState extends State<searchMaterials> {
  final textcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var screenSizeData = MediaQuery.of(context);
    double screenWidth = screenSizeData.size.width;
    double screenHeight = screenSizeData.size.height;
    return Scaffold(
      backgroundColor: Colors.amber.shade300,
      body: Column(children: [
        SizedBox(
          height: screenHeight / 6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 40,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
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
              for (int i = 0; i < materials.length; i += 3)
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        if (i < materials.length)
                          resurseListItem(
                            screenWidth: screenWidth,
                            nrOfDocs: materials[i].PDFs.length,
                            nrOfVideos: materials[i].videos.length,
                            title: materials[i].title,
                            index: i,
                          ),
                        if (i < materials.length - 1)
                          resurseListItem(
                            screenWidth: screenWidth,
                            nrOfDocs: materials[i + 1].PDFs.length,
                            nrOfVideos: materials[i + 1].videos.length,
                            title: materials[i + 1].title,
                            index: i + 1,
                          ),
                        if (i < materials.length - 2)
                          resurseListItem(
                            screenWidth: screenWidth,
                            nrOfDocs: materials[i + 2].PDFs.length,
                            nrOfVideos: materials[i + 2].videos.length,
                            title: materials[i + 2].title,
                            index: i + 2,
                          ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                )
            ],
          ),
        ),
      ]),
    );
  }
}

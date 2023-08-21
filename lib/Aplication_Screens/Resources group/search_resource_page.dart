import './resourcesData.dart';
import './view_material_page.dart';
import '../../Other%20stuff/textfield.dart';
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
            color: Colors.green.shade400),
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
  String searchKey = "";
  var _materials = materials;
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
                height: screenHeight / 15,
                child: InputTextField(
                  controller: textcontroller,
                  hintText: 'Search...',
                  obscureText: false,
                )),
            InkWell(
              onTap: () {
                setState(() {
                  _materials.clear();
                  searchKey = textcontroller.text;
                  int x = 0;
                  for (int i = 0; i < materials.length; i++) {
                    if (materials[i]
                        .title
                        .toLowerCase()
                        .contains(searchKey.toLowerCase())) {
                      _materials[x] = materials[i];
                      x++;
                    }
                  }
                });
              },
              child: Container(
                width: screenHeight / 15,
                height: screenHeight / 15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(screenHeight / 15),
                  color: Colors.green.shade400,
                ),
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        SizedBox(
          width: screenWidth,
          height: screenHeight * (5 / 6) - 60,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              for (int i = 0; i < _materials.length; i += 3)
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        if (i < _materials.length)
                          resurseListItem(
                            screenWidth: screenWidth,
                            nrOfDocs: _materials[i].PDFs.length,
                            nrOfVideos: _materials[i].videos.length,
                            title: _materials[i].title,
                            index: i,
                          ),
                        if (i < _materials.length - 1)
                          resurseListItem(
                            screenWidth: screenWidth,
                            nrOfDocs: _materials[i + 1].PDFs.length,
                            nrOfVideos: _materials[i + 1].videos.length,
                            title: _materials[i + 1].title,
                            index: i + 1,
                          ),
                        if (i < _materials.length - 2)
                          resurseListItem(
                            screenWidth: screenWidth,
                            nrOfDocs: _materials[i + 2].PDFs.length,
                            nrOfVideos: _materials[i + 2].videos.length,
                            title: _materials[i + 2].title,
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

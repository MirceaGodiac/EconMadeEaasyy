import 'package:econ_made_easy_files/Aplication_Screens/Exercitii%20Group/secondSelectExerciseTypeScreen.dart';
import 'package:econ_made_easy_files/Aplication_Screens/Resources%20group/pdf_viewer_page.dart';
import 'package:econ_made_easy_files/Aplication_Screens/Resources%20group/resourcesData.dart';
import 'package:econ_made_easy_files/Aplication_Screens/Resources%20group/search_resource_page.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class PDFapi {
  static Future<File> loadNetwork(String url) async {
    var _url = Uri.parse(url);
    final response = await http.get(_url);
    final bytes = response.bodyBytes;

    return _storeFile(url, bytes);
  }

  static Future<File> _storeFile(String url, List<int> bytes) async {
    final filename = basename(url);
    final dir = await getApplicationDocumentsDirectory();

    final file = File('${dir.path}/$filename');
    await file.writeAsBytes(bytes, flush: true);
    return file;
  }
}

class ViewMaterialPage extends StatefulWidget {
  int index;
  ViewMaterialPage({super.key, required this.index});

  @override
  State<ViewMaterialPage> createState() => _ViewMaterialPageState();
}

class _ViewMaterialPageState extends State<ViewMaterialPage> {
  int videoIndex = 0;
  bool fullScreen = false;
  bool showedMaterials = false; // false -> video, true -> pdf

  late YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();
    if (materials[widget.index].videos.length != 0) {
      controller = YoutubePlayerController(
        initialVideoId:
            YoutubePlayer.convertUrlToId(materials[widget.index].videos[0])!,
      );
    } else {
      controller = YoutubePlayerController(initialVideoId: '');
    }
  }

  @override
  Widget build(BuildContext context) {
    String _title = controller.metadata.title;
    var screenSizeData = MediaQuery.of(context);
    double screenWidth = screenSizeData.size.width;
    double screenHeight = screenSizeData.size.height;
    return Scaffold(
      backgroundColor: Colors.green.shade300,
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 30),
            height: screenHeight * (1 / 10),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    '<  Inapoi',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              (materials[widget.index].videos.length != 0)
                  ? Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              if (showedMaterials) showedMaterials = false;
                            });
                          },
                          child: Container(
                            width: 75,
                            height: 75,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.green.shade500,
                              border: (!showedMaterials)
                                  ? Border.all(
                                      color: Colors.green.shade700,
                                      width: 4,
                                    )
                                  : Border.all(
                                      color: Colors.green.shade500, width: 4),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.video_collection_sharp,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              if (!showedMaterials) showedMaterials = true;
                            });
                          },
                          child: Container(
                            width: 75,
                            height: 75,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.green.shade500,
                              border: (showedMaterials)
                                  ? Border.all(
                                      color: Colors.green.shade700,
                                      width: 4,
                                    )
                                  : Border.all(
                                      color: Colors.green.shade500, width: 4),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.picture_as_pdf,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  : SizedBox(),
              (materials[widget.index].videos.length != 0)
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        (videoIndex != 0)
                            ? InkWell(
                                onTap: () async {
                                  setState(() {
                                    videoIndex--;
                                  });
                                  controller.load(YoutubePlayer.convertUrlToId(
                                      materials[widget.index]
                                          .videos[videoIndex])!);
                                  await Future.delayed(Duration(seconds: 1));
                                  _title = controller.metadata.title;
                                  setState(() {});
                                  print(videoIndex);
                                },
                                child: const Text(
                                  '<   ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                  ),
                                ),
                              )
                            : const Text('   '),
                        Text(
                          _title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        (videoIndex !=
                                materials[widget.index].videos.length - 1)
                            ? InkWell(
                                onTap: () async {
                                  setState(() {
                                    videoIndex++;
                                  });
                                  controller.load(YoutubePlayer.convertUrlToId(
                                      materials[widget.index]
                                          .videos[videoIndex])!);
                                  await Future.delayed(Duration(seconds: 1));
                                  setState(() {
                                    _title = controller.metadata.title;
                                  });
                                  print(videoIndex);
                                },
                                child: const Text(
                                  '   >',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                  ),
                                ),
                              )
                            : const Text('   '),
                      ],
                    )
                  : SizedBox(),
              SizedBox(
                width: 170,
              )
            ],
          ),
          SizedBox(
            height: screenHeight * (1 / 10),
          ),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: screenWidth,
              height: screenWidth * (9 / 16) * (3 / 4),
              alignment: Alignment.center,
              child: (!showedMaterials &&
                      materials[widget.index].videos.length != 0)
                  ? ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        ClipRRect(
                          child: YoutubePlayer(controller: controller),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ],
                    )
                  : ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        for (int i = 0;
                            i < materials[widget.index].PDFs.length;
                            i++)
                          InkWell(
                            onTap: () async {
                              final file = await PDFapi.loadNetwork(
                                  materials[widget.index].PDFs[i]);
                              openPDF(context, file);
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: 50,
                                  right: (screenWidth / 2),
                                  top: 10,
                                  bottom: 10),
                              height: screenHeight / 10,
                              decoration: BoxDecoration(
                                color: Colors.green.shade500,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.attach_file_rounded,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'Vezi PDF numarul ${i + 1}',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 30),
                                  )
                                ],
                              ),
                            ),
                          ),
                      ],
                    )),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }

  void openPDF(BuildContext context, File file) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)));
}

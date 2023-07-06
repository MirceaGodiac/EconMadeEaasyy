import 'package:econ_made_easy_files/Aplication_Screens/Resources%20group/pdf_viewer_page.dart';
import 'package:econ_made_easy_files/Aplication_Screens/Resources%20group/resourcesData.dart';
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
  late YoutubePlayerController controller;
  @override
  void initState() {
    super.initState();
    controller = YoutubePlayerController(
      initialVideoId:
          YoutubePlayer.convertUrlToId(materials[widget.index].videos[0])!,
    );
  }

  @override
  Widget build(BuildContext context) {
    var screenSizeData = MediaQuery.of(context);
    double screenWidth = screenSizeData.size.width;
    double screenHeight = screenSizeData.size.height;
    return Scaffold(
      backgroundColor: Colors.amber.shade300,
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
                    '< Inapoi',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              (videoIndex != 0)
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          videoIndex--;
                          controller.load(YoutubePlayer.convertUrlToId(
                              materials[widget.index].videos[videoIndex])!);
                        });
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
                materials[widget.index].title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                ),
              ),
              (videoIndex != materials[widget.index].videos.length - 1)
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          videoIndex++;
                          controller.load(YoutubePlayer.convertUrlToId(
                              materials[widget.index].videos[videoIndex])!);
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
          ),
          SizedBox(
            height: screenHeight * (1 / 10),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            width: screenWidth,
            height: screenWidth * (9 / 16) * (3 / 4),
            alignment: Alignment.center,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ClipRRect(
                  child: YoutubePlayer(controller: controller),
                  borderRadius: BorderRadius.circular(10),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Column(
            children: [
              for (int i = 0; i < materials[widget.index].PDFs.length; i++)
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
                      color: Colors.amber,
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
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        )
                      ],
                    ),
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }

  void openPDF(BuildContext context, File file) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)));
}

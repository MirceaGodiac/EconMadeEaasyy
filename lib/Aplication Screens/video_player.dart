import 'package:econ_made_easy_files/Aplication%20Screens/enter_quiz_page.dart';

import '../Other stuff/lessons_list.dart';
import '../Other stuff/movie_player_setup.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:video_player/video_player.dart';

class VideoPlayer extends StatelessWidget {
  final int index;

  const VideoPlayer({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print(index);
    return Scaffold(
      appBar: AppBar(
        title: Text(lessons[index].lessonTitle),
        backgroundColor: Colors.orange[800],
      ),
      body: MoviePage(
        index: index,
      ),
    );
  }
}

class MoviePage extends StatelessWidget {
  int index;

  MoviePage({super.key, required this.index});

  // this variable is for a workaround because the "video done" conditional is aprooved
  // at the start of the video playback, for some reason and I really don't feel like fixing it.
  int done = 0;

  @override
  Widget build(BuildContext context) {
    final VideoPlayerController videoController =
        VideoPlayerController.asset(lessons[index].videoURL);
    videoController.addListener(() {
      if (videoController.value.position == videoController.value.duration) {
        done++;
        if (done == 2) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => EnterQuizPage(
                      index: index,
                    )),
          );
        }
      }
      false;
    });
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: <Widget>[
          ChewieListItem(
            videoPlayerController: videoController,
            looping: false,
          ),
        ],
      ),
    );
  }
}

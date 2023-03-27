import 'package:econ_made_easy_files/models/game_link_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GameListItem extends StatelessWidget {
  game gameInfo;

  GameListItem({Key? key, required this.gameInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        debugPrint("bbb");
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 200.0,
              margin: const EdgeInsets.only(left: 30, top: 40),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.asset(gameInfo.thumbnailURL),
              )),
          Container(
            margin: const EdgeInsets.only(left: 30, top: 10),
            child: Text(
              gameInfo.title,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.teal[700],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 30, top: 10),
            child: Text(
              gameInfo.decription,
              style: const TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

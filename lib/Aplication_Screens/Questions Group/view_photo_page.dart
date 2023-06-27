import 'package:flutter/material.dart';

class ViewPhotoPage extends StatefulWidget {
  String ImageURL;
  ViewPhotoPage({super.key, required this.ImageURL});

  @override
  State<ViewPhotoPage> createState() => _ViewPhotoPageState();
}

class _ViewPhotoPageState extends State<ViewPhotoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              'lib/images/logindoodle.jpg',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox.expand(
            child: Container(
              color: Colors.black87,
            ),
          ),
          SizedBox.expand(
            child: Image.network(
              widget.ImageURL,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox.expand(
              child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: const EdgeInsets.only(top: 50, left: 50),
              alignment: Alignment.topLeft,
              child: Text(
                '< Inapoi',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          )),
        ],
      ),
    );
  }
}

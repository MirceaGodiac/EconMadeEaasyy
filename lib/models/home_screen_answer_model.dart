import 'package:econ_made_easy_files/Aplication_Screens/Questions%20Group/view_question_page.dart';
import 'package:econ_made_easy_files/models/questionForumModel.dart';
import 'package:flutter/material.dart';

class HomePageQuestionModel extends StatefulWidget {
  double width;
  String title;
  String text;
  int nrOfAnswers;
  var questionQueryReference;
  int index;
  HomePageQuestionModel({
    super.key,
    required this.width,
    required this.title,
    required this.text,
    required this.nrOfAnswers,
    required this.index,
    required this.questionQueryReference,
  });

  @override
  State<HomePageQuestionModel> createState() => _HomePageQuestionModelState();
}

class _HomePageQuestionModelState extends State<HomePageQuestionModel> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return viewQuestionPage(
                questionForumModel: QuestionForumModel(
                    QuestionTitle: widget.questionQueryReference.docs[widget.index]
                        ['title'],
                    QuestionText: widget.questionQueryReference.docs[widget.index]
                        ['text'],
                    reward: widget.questionQueryReference.docs[widget.index]
                        ['reward'],
                    author: widget.questionQueryReference.docs[widget.index]
                        ['author'],
                    date: widget.questionQueryReference.docs[widget.index]['time'],
                    id: widget.questionQueryReference.docs[widget.index]['id'],
                    imageURL: widget.questionQueryReference.docs[widget.index]
                        ['imageURL'],
                    authorEmail: widget.questionQueryReference.docs[widget.index]
                        ['authorEmail'],
                    hidden: widget.questionQueryReference.docs[widget.index]
                        ['isActive']),
                hidden: widget.questionQueryReference.docs[widget.index]['isActive'],
                isAnswered: false,
                locked: widget.questionQueryReference.docs[widget.index]['locked']);
          },
        ));
      },
      child: Container(
        margin: EdgeInsets.only(
            left: widget.width * (1 / 20),
            right: widget.width * (1 / 20),
            bottom: widget.width * (1 / 10)),
        width: widget.width,
        height: widget.width * (9 / 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.green.shade200),
        child: Container(
          margin: const EdgeInsets.only(left: 10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  (widget.title.length > 20)
                      ? '${widget.title.substring(0, 20)}...'
                      : widget.title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w200),
                ),
                Text(
                  (widget.text.length > 20)
                      ? '${widget.text.substring(0, 20)}...'
                      : widget.text,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w200),
                ),
                Text(
                  '${widget.nrOfAnswers} raspunsuri',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w200),
                ),
              ]),
        ),
      ),
    );
  }
}

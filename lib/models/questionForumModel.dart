import 'package:flutter/material.dart';

class QuestionForumModel {
  final String QuestionTitle;
  final String QuestionText;
  final int reward;
  final String author;
  var date;
  final int id;
  final String imageURL;
  final String authorEmail;
  QuestionForumModel({
    required this.QuestionTitle,
    required this.QuestionText,
    required this.reward,
    required this.author,
    required this.date,
    required this.id,
    required this.imageURL,
    required this.authorEmail,
  });
}

import 'dart:convert';

import 'package:DevQuiz/shared/models/answer_model.dart';

class QuestionModel {
  final String title;
  final List<AnswerModel> anwers;

  QuestionModel({
    required this.title,
    required this.anwers,
  }) : assert(anwers.length == 4) ;

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'anwers': anwers.map((x) => x.toMap()).toList(),
    };
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      title: map['title'],
      anwers: List<AnswerModel>.from(
        map['answers']?.map((x) => AnswerModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionModel.fromJson(String source) => QuestionModel.fromMap(json.decode(source));
}

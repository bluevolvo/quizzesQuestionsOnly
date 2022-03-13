import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:quizzes_questionsonly/models/questions_model.dart';
import 'package:quizzes_questionsonly/models/title_model.dart';

class QuizzesProvider extends ChangeNotifier {
  // for title
  final List<TitleModel> _titleList = [];

  UnmodifiableListView<TitleModel> get properTitleList {
    return UnmodifiableListView(_titleList);
  }

  void addTitle(String title) {
    final add = TitleModel(title: title);
    _titleList.add(add);
    notifyListeners();
  }

  // for questions
  final List<QuestionsModel> _questionsList = [
    QuestionsModel(
        title: "Accounting",
        question: "What is accounting",
        answer: "summarization blah blah"),
    QuestionsModel(
        title: "Accounting",
        question: "nting",
        answer: "summarization blah blah")
  ];

  UnmodifiableListView<QuestionsModel> get properQuestionsList {
    return UnmodifiableListView(_questionsList);
  }

  void addQuestion(String title, String question, String answer) {
    final add =
        QuestionsModel(title: title, question: question, answer: answer);
    _questionsList.add(add);
    notifyListeners();
  }
}

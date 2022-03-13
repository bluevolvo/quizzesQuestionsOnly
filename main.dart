import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizzes_questionsonly/routes/questions_list_route.dart';
import 'routes/question_title_list_route.dart';

void main() => runApp(const ProviderScope(child: QuizAppQuestionsOnly()));

class QuizAppQuestionsOnly extends StatelessWidget {
  const QuizAppQuestionsOnly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(primary: Colors.black))),
      initialRoute: "/",
      routes: {
        "/": (context) => const QuestionTitleListRoute(),
        "questionListRoute": (context) => const QuestionListRoute()
      },
    );
  }
}



import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizzes_questionsonly/models/argument_model.dart';
import 'package:quizzes_questionsonly/models/questions_model.dart';
import 'package:quizzes_questionsonly/routes/question_title_list_route.dart';

class QuestionListRoute extends ConsumerWidget {
  const QuestionListRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questionListRef = ref.watch(controllerReference);
    final extract = ModalRoute.of(context)!.settings.arguments as ArgumentModel;
    // final title = extract["title"];
    //  print(title+"1");
    final Iterable<QuestionsModel>questions = questionListRef.properQuestionsList
        .where((questions) => questions.title == extract.title);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${(extract.title)} Questions",
                style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: questionListRef.properQuestionsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(10,15,10,8),
                      child: ListTile(
                       leading: Text("${(index.toString())+1.toString() }.",style:const TextStyle(color: Colors.white,fontSize: 20),),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        tileColor: Colors.black,
                        title: Text(
                          questions
                              .map((questions) => questions.question)
                              .toString(),
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Hind",
                              color: Colors.white),
                        ),
                        subtitle: Text(
                          questions
                              .map((questions) => questions.answer)
                              .toString(),
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              fontFamily: "Hind",
                              color: Colors.white),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizzes_questionsonly/models/argument_model.dart';
import 'package:quizzes_questionsonly/provider/quizzes_provider.dart';

final controllerReference = ChangeNotifierProvider((ref) => QuizzesProvider());
TextEditingController title = TextEditingController();

class QuestionTitleListRoute extends ConsumerWidget {
  const QuestionTitleListRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controllerProper = ref.watch(controllerReference);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        title: const Center(
                          child: Text("Name of Question Set",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600)),
                        ),
                        content: TextField(
                          controller: title,
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                          ),
                        ),
                        actions: [
                          Center(
                              child: ElevatedButton(
                                  onPressed: () {
                                    controllerProper.addTitle(title.text);
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Save"))),
                        ],
                      );
                    });
              },
              icon: const Icon(
                Icons.add,
                color: Colors.black,
              ))
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Question Set List",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: controllerProper.properTitleList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: GestureDetector(
                        onTap: () {

                          Navigator.pushNamed(
                              context, "questionListRoute", arguments: ArgumentModel(title: controllerProper.properTitleList[index].title));
                         },
                        child: ListTile(
                          leading: const Icon(
                            Icons.add_box_outlined,
                            color: Colors.white,
                            size: 30,
                          ),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          tileColor: Colors.black,
                          title: Text(
                            controllerProper.properTitleList[index].title,
                            style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Hind",
                                color: Colors.white),
                          ),
                          subtitle: const Text(
                            "15 questions",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                                fontFamily: "Hind",
                                color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}

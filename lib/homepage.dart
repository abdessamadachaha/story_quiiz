import 'package:flutter/material.dart';
import 'package:storyquizz/storybank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Storybank storybank = Storybank();

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<bool> answers = [];

  int countTrue() {
    int trueAnswer = 0;
    for (var element in answers) {
      if (element == true) {
        trueAnswer++;
      }
    }
    return trueAnswer;
  }

  int countFalse() {
    int falseAnswer = 0;
    for (var element in answers) {
      if (element == false) {
        falseAnswer++;
      }
    }
    return falseAnswer;
  }

  isCheck(String currectAnswer) {
    if (currectAnswer == storybank.getCurrectAnswer()) {
      answers.add(true);
    } else {
      answers.add(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('images/background.png', fit: BoxFit.cover),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 5,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      textAlign: TextAlign.center,
                      storybank.getStory(),
                      style: TextStyle(fontSize: 26.0, color: Colors.white),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    onPressed: () {
                      if (storybank.numberContent ==
                          storybank.content.length - 1) {
                        Alert(
                          context: context,
                          title: "Finished!",
                          desc:
                              "The result is true Answer[${countTrue()}] and wrong answers are [${countFalse()}]",
                          buttons: [
                            DialogButton(
                              color: Colors.blue,
                              onPressed: () {
                                setState(() {
                                  storybank.numberContent = 0;
                                  answers.clear();
                                });
                                Navigator.pop(context);
                              },
                              width: 120,
                              child: Text(
                                "Restart",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ).show();
                      }
                      setState(() {
                        isCheck(storybank.getChoise1());
                        storybank.nextQuestion();
                        print(answers);
                      });
                    },
                    child: Text(
                      storybank.getChoise1(),
                      style: TextStyle(color: Colors.white, fontSize: 17.0),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    onPressed: () {
                      if (storybank.numberContent ==
                          storybank.content.length - 1) {
                        storybank.numberContent = 0;
                      }
                      setState(() {
                        isCheck(storybank.getChoise2());
                        storybank.nextQuestion();
                      });
                    },
                    child: Text(
                      storybank.getChoise2(),
                      style: TextStyle(color: Colors.white, fontSize: 17.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:storyquizz/story.dart';

class Storybank {
  int numberContent = 0;
  List<Story> content = [
    Story(
      "Tom sees a red button that says 'Do not press'. What should he do?",
      "Press it",
      "Walk away",
      "Walk away",
    ),
    Story(
      "Luna lost her cat. She hears a sound from the tree. What should she do?",
      "Climb the tree",
      "Ignore the sound",
      "Climb the tree",
    ),
    Story(
      "Ali is hungry. He sees an apple and a chocolate bar. What should he eat?",
      "Apple",
      "Chocolate bar",
      "Apple",
    ),
    Story(
      "Mia found a wallet on the street. What should she do?",
      "Keep the money",
      "Give it to the police",
      "Give it to the police",
    ),
    Story(
      "Jack wants to learn more about space. What should he do?",
      "Watch cartoons",
      "Read a science book",
      "Read a science book",
    ),
    Story("", "Result", "Restart", ""),
  ];

  String getStory() {
    return content[numberContent].storyText!;
  }

  String getChoise1() {
    return content[numberContent].choise1!;
  }

  String getChoise2() {
    return content[numberContent].choise2!;
  }

  String getCurrectAnswer() {
    return content[numberContent].correctChoise!;
  }

  void nextQuestion() {
    if (numberContent < content.length - 1) {
      numberContent++;
    }
  }
}

import '../Models/questionModel.dart';

List<QuestionModel> questions = [
  QuestionModel(
    "How Many Whiskers does the average cat have on each side of its face ?",
    {
      "1": false,
      "3": false,
      "12": true,
      "5,007": false,
    },
  ),
  QuestionModel("When does a cat purr ?", {
    "When it cares for its kittens": false,
    "When it needs confort": false,
    "When it feels content": false,
    "All of the above": true,
  }),
  QuestionModel("What is the averge nulber of kittens in a litter ?", {
    "1 to 2": false,
    "3 to 5": true,
    "8 to 10": false,
    "12 to 14": false,
  }),
  QuestionModel("How many moons does Mars have ?", {
    "1": false,
    "2": false,
    "4": true,
    "8": false,
  }),
  QuestionModel("What is Mars's nickname ?", {
    "The red planet": true,
    "The dusty planet": false,
    "The hot planet": false,
    "The smelly planet": false,
  }),
  QuestionModel("About How long would it take to travel to Mars ?", {
    "Three days": false,
    "A month": false,
    "Eight months": true,
    "Two years": false,
  }),
];

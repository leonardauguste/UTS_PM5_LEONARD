class Question {
  final String questionText;
  final List<String> options;
  final int correctOptionIndex;

  Question({
    required this.questionText,
    required this.options,
    required this.correctOptionIndex,
  });
}

List<Question> dummyQuestions = [
  Question(
    questionText: "Apa ibukota dari negara Indonesia?",
    options: ["Jakarta", "Medan", "Bali", "Papua"],
    correctOptionIndex: 0,
  ),
  Question(
    questionText: "Framework apa yang digunakan untuk membuat aplikasi ini?",
    options: ["React Native", "Flutter", "Swift", "Kotlin"],
    correctOptionIndex: 1,
  ),
  Question(
    questionText: "Berapa hasil dari 8 x 7?",
    options: ["54", "56", "64", "62"],
    correctOptionIndex: 1,
  ),
  Question(
    questionText: "Siapa penemu lampu pijar?",
    options: ["Nikola Tesla", "Albert Einstein", "Thomas Alva Edison", "Isaac Newton"],
    correctOptionIndex: 2,
  ),
];
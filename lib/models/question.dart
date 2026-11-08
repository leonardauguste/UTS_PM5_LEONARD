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

Map<String, List<Question>> quizCategories = {
  "Pengetahuan Umum": [
    Question(questionText: "Apa ibukota dari negara Indonesia?", options: ["Jakarta", "Medan", "Bali", "Papua"], correctOptionIndex: 0),
    Question(questionText: "Siapa penemu lampu pijar?", options: ["Nikola Tesla", "Albert Einstein", "Thomas Edison", "Isaac Newton"], correctOptionIndex: 2),
  ],
  "Matematika": [
    Question(questionText: "Berapa hasil dari 8 x 7?", options: ["54", "56", "64", "62"], correctOptionIndex: 1),
    Question(questionText: "Akar kuadrat dari 144 adalah?", options: ["10", "12", "14", "16"], correctOptionIndex: 1),
  ],
  "Pemrograman": [
    Question(questionText: "Framework apa yang digunakan untuk aplikasi ini?", options: ["React Native", "Flutter", "Swift", "Kotlin"], correctOptionIndex: 1),
    Question(questionText: "Bahasa pemrograman utama di Flutter adalah?", options: ["Java", "Python", "Dart", "C++"], correctOptionIndex: 2),
  ],
};
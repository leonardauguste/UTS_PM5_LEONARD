import 'package:flutter/material.dart';
import '../models/question.dart';
import '../widgets/custom_button.dart';
import '../widgets/option_card.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  final String userName;
  final String category;
  const QuizScreen({super.key, required this.userName, required this.category});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentIndex = 0;
  int _score = 0;
  int? _selectedOption;

  late List<Question> currentQuestions;

  @override
  void initState() {
    super.initState();
    currentQuestions = quizCategories[widget.category]!;
  }

  void _nextQuestion() {
    if (_selectedOption != null && _selectedOption == currentQuestions[_currentIndex].correctOptionIndex) {
      _score += 10;
    }
    if (_currentIndex < currentQuestions.length - 1) {
      setState(() { _currentIndex++; _selectedOption = null; });
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => ResultScreen(userName: widget.userName, score: _score, totalQuestions: currentQuestions.length, category: widget.category),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = currentQuestions[_currentIndex];
    final size = MediaQuery.of(context).size;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final darkBlue = isDark ? const Color(0xFF1E2A38) : const Color(0xFF2B3A4A);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          Positioned(
            top: 0, left: 0, right: 0,
            child: Container(
              height: size.height * 0.42,
              decoration: BoxDecoration(color: darkBlue, borderRadius: BorderRadius.vertical(bottom: Radius.elliptical(size.width, 50))),
            ),
          ),
          Positioned(
            top: 0, left: 0, right: 0,
            child: Container(
              height: size.height * 0.17,
              decoration: BoxDecoration(color: isDark ? Colors.grey[900] : Colors.white, borderRadius: BorderRadius.vertical(bottom: Radius.elliptical(size.width, 60))),
              child: SafeArea(
                bottom: false,
                child: Center(
                  child: Container(
                    padding: isDark ? const EdgeInsets.all(8) : EdgeInsets.zero,
                    decoration: isDark ? const BoxDecoration(color: Colors.white, shape: BoxShape.circle) : null,
                    child: Image.asset('assets/images/logo-quiz.png', height: isDark ? 55 : 65),
                  ),
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * 0.12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("Soal ${_currentIndex + 1} / ${currentQuestions.length}", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                      Text("Skor\n$_score", textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  LinearProgressIndicator(value: (_currentIndex + 1) / currentQuestions.length, color: const Color(0xFFFF7E55), backgroundColor: Colors.white24),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(25),
                    decoration: BoxDecoration(color: isDark ? Colors.grey[800] : Colors.white, borderRadius: BorderRadius.circular(20)),
                    child: Text(question.questionText, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: isDark ? Colors.white : darkBlue)),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: question.options.length,
                      itemBuilder: (context, index) {
                        return OptionCard(
                          optionText: question.options[index],
                          isSelected: _selectedOption == index,
                          onTap: () { setState(() { _selectedOption = index; }); },
                        );
                      },
                    ),
                  ),
                  CustomButton(text: _currentIndex == currentQuestions.length - 1 ? "Selesai" : "Selanjutnya", onPressed: _nextQuestion),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
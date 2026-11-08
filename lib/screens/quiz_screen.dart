import 'package:flutter/material.dart';
import '../models/question.dart';
import '../widgets/custom_button.dart';
import '../widgets/option_card.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  final String userName;
  const QuizScreen({super.key, required this.userName});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentIndex = 0;
  int _score = 0;
  int? _selectedOption;

  void _nextQuestion() {
    if (_selectedOption != null) {
      if (_selectedOption == dummyQuestions[_currentIndex].correctOptionIndex) {
        _score += 10;
      }
    }

    if (_currentIndex < dummyQuestions.length - 1) {
      setState(() {
        _currentIndex++;
        _selectedOption = null;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            userName: widget.userName,
            score: _score,
            totalQuestions: dummyQuestions.length,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = dummyQuestions[_currentIndex];
    final size = MediaQuery.of(context).size;
    final darkBlue = const Color(0xFF2B3A4A);

    return Scaffold(
      backgroundColor: const Color(0xFFE8F1F5),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: size.height * 0.42,
              decoration: BoxDecoration(
                color: darkBlue,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.elliptical(size.width, 50),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: size.height * 0.17,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.elliptical(size.width, 60),
                ),
              ),
              child: SafeArea(
                bottom: false,
                child: Center(
                  child: Image.asset('assets/images/logo-quiz.png', height: 75),
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
                  SizedBox(height: size.height * 0.13),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Pertanyaan ${_currentIndex + 1} dari ${dummyQuestions.length}",
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14),
                      ),
                      Column(
                        children: [
                          const Text("Skor", style: TextStyle(color: Colors.white70, fontSize: 12)),
                          Text("$_score", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value: (_currentIndex + 1) / dummyQuestions.length,
                      backgroundColor: Colors.white.withOpacity(0.2),
                      color: const Color(0xFFFF7E55),
                      minHeight: 8,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 5))
                      ],
                    ),
                    child: Text(
                      question.questionText,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF2B3A4A)),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: question.options.length,
                      itemBuilder: (context, index) {
                        return OptionCard(
                          optionText: question.options[index],
                          isSelected: _selectedOption == index,
                          onTap: () {
                            setState(() {
                              _selectedOption = index;
                            });
                          },
                        );
                      },
                    ),
                  ),
                  CustomButton(
                    text: _currentIndex == dummyQuestions.length - 1 ? "Selesai" : "Selanjutnya",
                    onPressed: _nextQuestion,
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        setState(() { _selectedOption = null; });
                        _nextQuestion();
                      },
                      child: const Text("Lewati", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600)),
                    ),
                  ),
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
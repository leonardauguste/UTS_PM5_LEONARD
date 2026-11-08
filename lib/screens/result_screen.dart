import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';

class ResultScreen extends StatelessWidget {
  final String userName;
  final int score;
  final int totalQuestions;

  const ResultScreen({
    super.key,
    required this.userName,
    required this.score,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    int maxScore = totalQuestions * 10;
    double accuracy = (score / maxScore) * 100;
    final size = MediaQuery.of(context).size;
    final darkBlue = const Color(0xFF2B3A4A);
    final orange = const Color(0xFFFF7E55);

    return Scaffold(
      backgroundColor: const Color(0xFFE8F1F5),
      body: Stack(
        children: [
          // hiasan bg
          Positioned(top: size.height * 0.15, left: -20, child: CircleAvatar(radius: 40, backgroundColor: orange)),
          Positioned(top: size.height * 0.22, left: 40, child: CircleAvatar(radius: 15, backgroundColor: darkBlue)),
          Positioned(bottom: -30, right: -10, child: CircleAvatar(radius: 80, backgroundColor: darkBlue)),
          Positioned(bottom: 20, right: 80, child: CircleAvatar(radius: 60, backgroundColor: Colors.grey.withOpacity(0.5))),

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
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: [
                  SizedBox(height: size.height * 0.15),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: darkBlue, width: 2),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: darkBlue,
                          offset: const Offset(8, 8),
                          blurRadius: 0,
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        const Text(
                          "KUIS SELESAI!",
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFFFF7E55)),
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/trophy.png', height: 70, errorBuilder: (context, error, stackTrace) => const Icon(Icons.emoji_events, color: Color(0xFFFF7E55), size: 70)),
                            const SizedBox(width: 15),
                            Text(
                              "${score ~/ 10}/$totalQuestions",
                              style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: darkBlue),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Text(
                          "Kerja bagus, $userName! Nilai kamu ${accuracy >= 80 ? 'hampir sempurna!' : 'cukup baik!'}",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: darkBlue),
                        ),
                        const SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildStatColumn("02:45", "DURASI", darkBlue),
                            _buildStatColumn("${accuracy.toInt()}%", "KETEPATAN", darkBlue),
                          ],
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  CustomButton(
                    text: "Kerjakan Lagi",
                    onPressed: () {
                      Navigator.popUntil(context, (route) => route.isFirst);
                    },
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatColumn(String value, String label, Color textColor) {
    return Column(
      children: [
        Text(value, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: textColor)),
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.grey)),
      ],
    );
  }
}
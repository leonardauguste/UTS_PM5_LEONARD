import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/custom_button.dart';

class ResultScreen extends StatefulWidget {
  final String userName;
  final int score;
  final int totalQuestions;
  final String category;

  const ResultScreen({
    super.key,
    required this.userName,
    required this.score,
    required this.totalQuestions,
    required this.category,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(duration: const Duration(seconds: 3));
    double accuracy = (widget.score / (widget.totalQuestions * 10)) * 100;
    if (accuracy >= 80) {
      _confettiController.play();
    }
    _saveScoreLocal();
  }

  Future<void> _saveScoreLocal() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> history = prefs.getStringList('quiz_history') ?? [];
    history.add("${widget.userName}|${widget.category}|${widget.score}");
    await prefs.setStringList('quiz_history', history);
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int maxScore = widget.totalQuestions * 10;
    double accuracy = (widget.score / maxScore) * 100;
    final size = MediaQuery.of(context).size;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final darkBlue = isDark ? const Color(0xFF1E2A38) : const Color(0xFF2B3A4A);
    final orange = const Color(0xFFFF7E55);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: size.height * 0.12,
            left: -20,
            child: CircleAvatar(radius: 50, backgroundColor: orange),
          ),
          Positioned(
            top: size.height * 0.18,
            left: 55,
            child: CircleAvatar(radius: 12, backgroundColor: darkBlue),
          ),
          Positioned(
            bottom: -50,
            right: -30,
            child: CircleAvatar(radius: 100, backgroundColor: darkBlue.withOpacity(0.9)),
          ),
          Positioned(
            bottom: 10,
            right: 50,
            child: CircleAvatar(radius: 70, backgroundColor: Colors.grey.withOpacity(0.6)),
          ),
          Positioned(
            bottom: size.height * 0.15,
            left: -20,
            child: CircleAvatar(radius: 40, backgroundColor: orange),
          ),

          Positioned(
            top: 0, left: 0, right: 0,
            child: Container(
              height: size.height * 0.17,
              decoration: BoxDecoration(
                  color: isDark ? Colors.grey[900] : Colors.white,
                  borderRadius: BorderRadius.vertical(bottom: Radius.elliptical(size.width, 60)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    )
                  ]
              ),
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
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: [
                  SizedBox(height: size.height * 0.14),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 20),
                    decoration: BoxDecoration(
                      color: isDark ? Colors.grey[800] : Colors.white,
                      border: Border.all(color: darkBlue, width: 3),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: darkBlue,
                          offset: const Offset(8, 8),
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        const Text(
                          "KUIS SELESAI!",
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: Color(0xFFFF7E55)),
                        ),
                        const SizedBox(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/trophy.png', height: 75, errorBuilder: (context, error, stackTrace) => const Icon(Icons.emoji_events, color: Color(0xFFFF7E55), size: 75)),
                            const SizedBox(width: 15),
                            Text(
                              "${widget.score ~/ 10}/${widget.totalQuestions}",
                              style: TextStyle(fontSize: 50, fontWeight: FontWeight.w900, color: isDark ? Colors.white : darkBlue),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25),
                        Text(
                          "Kerja bagus, ${widget.userName}! Nilai kamu ${accuracy >= 80 ? 'hampir sempurna!' : 'cukup baik!'}",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: isDark ? Colors.white70 : darkBlue),
                        ),
                        const SizedBox(height: 35),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildStatColumn("02:45", "DURASI", isDark ? Colors.white : darkBlue),
                            _buildStatColumn("${accuracy.toInt()}%", "KETEPATAN", isDark ? Colors.white : darkBlue),
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

          ConfettiWidget(
            confettiController: _confettiController,
            blastDirectionality: BlastDirectionality.explosive,
            shouldLoop: false,
            colors: const [Colors.red, Colors.blue, Colors.green, Colors.yellow, Colors.orange],
          ),
        ],
      ),
    );
  }

  Widget _buildStatColumn(String value, String label, Color textColor) {
    return Column(
      children: [
        Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: textColor)),
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.grey)),
      ],
    );
  }
}
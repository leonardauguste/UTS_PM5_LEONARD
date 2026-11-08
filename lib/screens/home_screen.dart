import 'package:flutter/material.dart';
import '../models/question.dart';
import 'quiz_screen.dart';
import 'leaderboard_screen.dart';
import '../widgets/custom_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _nameController = TextEditingController();
  String _selectedCategory = "Pengetahuan Umum";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final darkBlue = isDark ? const Color(0xFF1E2A38) : const Color(0xFF2B3A4A);
    final orange = const Color(0xFFFF7E55);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: Stack(
            children: [
              Positioned(top: -30, left: -40, child: CircleAvatar(radius: 80, backgroundColor: darkBlue)),
              Positioned(top: 40, left: -20, child: CircleAvatar(radius: 45, backgroundColor: orange)),
              Positioned(
                  bottom: 0, left: 0, right: 0,
                  child: Container(
                    height: size.height * 0.45,
                    decoration: BoxDecoration(
                      color: darkBlue,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.elliptical(size.width * 1.5, 250),
                          topRight: Radius.elliptical(size.width * 0.3, 50)
                      ),
                    ),
                  )
              ),

              SafeArea(
                child: Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: IconButton(
                      icon: Icon(Icons.leaderboard, color: isDark ? Colors.white : darkBlue, size: 28),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const LeaderboardScreen()));
                      },
                    ),
                  ),
                ),
              ),

              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),]
                      Container(
                        padding: isDark ? const EdgeInsets.all(15) : EdgeInsets.zero,
                        decoration: isDark ? const BoxDecoration(color: Colors.white, shape: BoxShape.circle) : null,
                        child: Image.asset('assets/images/logo-quiz.png', width: size.width * 0.45),
                      ),
                      const Spacer(),

                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(30)
                        ),
                        child: TextField(
                          controller: _nameController,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            hintText: "Masukkan nama anda",
                            hintStyle: TextStyle(color: Colors.white70),
                            prefixIcon: Icon(Icons.person_outline, color: Colors.white70),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 20),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),

                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Pilih Kategori:", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 8,
                        children: quizCategories.keys.map((String category) {
                          return ChoiceChip(
                            label: Text(
                                category,
                                style: TextStyle(color: _selectedCategory == category ? Colors.white : darkBlue, fontWeight: FontWeight.bold)
                            ),
                            selected: _selectedCategory == category,
                            selectedColor: orange,
                            backgroundColor: Colors.white,
                            onSelected: (bool selected) {
                              setState(() { _selectedCategory = category; });
                            },
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 25),

                      CustomButton(
                        text: "Mulai",
                        onPressed: () {
                          if (_nameController.text.trim().isNotEmpty) {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) => QuizScreen(userName: _nameController.text, category: _selectedCategory),
                            ));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Harap masukkan nama Anda!")));
                          }
                        },
                      ),
                      SizedBox(height: size.height * 0.05),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
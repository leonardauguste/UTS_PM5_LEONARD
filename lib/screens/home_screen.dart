import 'package:flutter/material.dart';
import 'quiz_screen.dart';
import '../widgets/custom_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final darkBlue = const Color(0xFF2B3A4A);
    final orange = const Color(0xFFFF7E55);

    return Scaffold(
      backgroundColor: const Color(0xFFE8F1F5),
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: Stack(
            children: [
              Positioned(
                top: -30,
                left: -40,
                child: CircleAvatar(radius: 80, backgroundColor: darkBlue),
              ),
              Positioned(
                top: 40,
                left: -20,
                child: CircleAvatar(radius: 45, backgroundColor: orange),
              ),
              Positioned(
                top: size.height * 0.4,
                right: 25,
                child: CircleAvatar(radius: 15, backgroundColor: darkBlue),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: size.height * 0.42,
                  decoration: BoxDecoration(
                    color: darkBlue,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.elliptical(size.width * 1.5, 250),
                      topRight: Radius.elliptical(size.width * 0.3, 50),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: size.height * 0.38,
                right: -15,
                child: CircleAvatar(radius: 25, backgroundColor: orange),
              ),

              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),
                      Image.asset('assets/images/logo-quiz.png', width: size.width * 0.55),
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: TextField(
                          controller: _nameController,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: "Masukkan nama anda",
                            hintStyle: const TextStyle(color: Colors.white70),
                            prefixIcon: const Icon(Icons.person_outline, color: Colors.white70),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(vertical: 20),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      CustomButton(
                        text: "Mulai",
                        onPressed: () {
                          if (_nameController.text.trim().isNotEmpty) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => QuizScreen(userName: _nameController.text),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Harap masukkan nama Anda!")),
                            );
                          }
                        },
                      ),
                      SizedBox(height: size.height * 0.08),
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
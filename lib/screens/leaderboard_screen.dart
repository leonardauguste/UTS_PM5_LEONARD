import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  List<String> _history = [];

  @override
  void initState() {
    super.initState();
    _loadHistory();
  }

  Future<void> _loadHistory() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _history = prefs.getStringList('quiz_history') ?? [];
      _history = _history.reversed.toList();
    });
  }

  Future<void> _clearHistory() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('quiz_history');
    setState(() { _history.clear(); });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Riwayat Skor (Lokal)", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFFFF7E55),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: _clearHistory,
            tooltip: "Hapus Riwayat",
          )
        ],
      ),
      body: _history.isEmpty
          ? Center(child: Text("Belum ada riwayat kuis.", style: TextStyle(color: isDark ? Colors.white : Colors.black54)))
          : ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: _history.length,
        itemBuilder: (context, index) {
          List<String> data = _history[index].split('|');
          if (data.length < 3) return const SizedBox.shrink();

          return Card(
            color: isDark ? Colors.grey[800] : Colors.white,
            margin: const EdgeInsets.only(bottom: 15),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Color(0xFFFF7E55),
                child: Icon(Icons.person, color: Colors.white),
              ),
              title: Text(data[0], style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("Kategori: ${data[1]}"),
              trailing: Text("Skor: ${data[2]}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFFFF7E55))),
            ),
          );
        },
      ),
    );
  }
}
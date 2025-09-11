import 'dart:math';
import 'package:flutter/material.dart';

class OddEvenPage extends StatefulWidget {
  const OddEvenPage({super.key});

  @override
  State<OddEvenPage> createState() => _OddEvenPageState();
}

class _OddEvenPageState extends State<OddEvenPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // --- State untuk cek ganjil/genap
  final TextEditingController _controller = TextEditingController();
  String _result = "";

  // --- State untuk game
  final Random _random = Random();
  int _score = 0;
  int _round = 1;
  int _maxRounds = 5;
  late int _num1;
  late int _num2;
  late String _question; // pertanyaan: "ganjil" / "genap"

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _generateRound();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // --- Logika cek ganjil/genap
  void _checkNumber() {
    if (_controller.text.isEmpty) return;

    int? number = int.tryParse(_controller.text);
    if (number == null) {
      setState(() => _result = "Input bukan angka!");
    } else {
      setState(() => _result = number % 2 == 0 ? "Genap" : "Ganjil");
    }
  }

  // --- Logika game
  void _generateRound() {
    setState(() {
      _question = _random.nextBool() ? "ganjil" : "genap";

      if (_question == "ganjil") {
        // Pastikan ada 1 ganjil, 1 genap
        _num1 = _randomOdd();
        _num2 = _randomEven();
      } else {
        // Pastikan ada 1 genap, 1 ganjil
        _num1 = _randomEven();
        _num2 = _randomOdd();
      }

      // Randomize posisi supaya tidak selalu ganjil duluan
      if (_random.nextBool()) {
        int temp = _num1;
        _num1 = _num2;
        _num2 = temp;
      }
    });
  }

  int _randomOdd() {
    int n;
    do {
      n = _random.nextInt(99) + 1;
    } while (n % 2 == 0);
    return n;
  }

  int _randomEven() {
    int n;
    do {
      n = _random.nextInt(99) + 1;
    } while (n % 2 != 0);
    return n;
  }

  void _choose(int chosenNumber) {
    bool correct = (_question == "ganjil" && chosenNumber % 2 == 1) ||
        (_question == "genap" && chosenNumber % 2 == 0);

    if (correct) _score++;

    if (_round < _maxRounds) {
      _round++;
      _generateRound();
    } else {
      _showResult();
    }
  }

  void _showResult() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.grey[900],
        title: const Text("Game Selesai",
            style: TextStyle(color: Colors.white)),
        content: Text("Skor kamu: $_score / $_maxRounds",
            style: const TextStyle(color: Colors.white)),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                _score = 0;
                _round = 1;
                _generateRound();
              });
            },
            child: const Text("Main lagi",
                style: TextStyle(color: Colors.amber)),
          ),
        ],
      ),
    );
  }

  // --- UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Fitur Ganjil/Genap"),
        backgroundColor: Colors.grey[850],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.amber,
          tabs: const [
            Tab(text: "Cek Angka"),
            Tab(text: "Main Game"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // --- Tab 1: cek ganjil/genap
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                TextField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: "Masukkan angka",
                    labelStyle: const TextStyle(color: Colors.white70),
                    filled: true,
                    fillColor: Colors.grey[850],
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[700],
                  ),
                  onPressed: _checkNumber,
                  child: const Text("Cek", style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(height: 20),
                Text(_result,
                    style: const TextStyle(fontSize: 24, color: Colors.white)),
              ],
            ),
          ),

          // --- Tab 2: game ganjil/genap
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Round $_round / $_maxRounds",
                    style: const TextStyle(fontSize: 20, color: Colors.white)),
                const SizedBox(height: 10),
                Text("Pilih angka yang $_question",
                    style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber)),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildNumberButton(_num1),
                    _buildNumberButton(_num2),
                  ],
                ),
                const SizedBox(height: 30),
                Text("Score: $_score",
                    style: const TextStyle(fontSize: 22, color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNumberButton(int number) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[800],
        padding: const EdgeInsets.all(30),
        textStyle: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      ),
      onPressed: () => _choose(number),
      child: Text("$number", style: const TextStyle(color: Colors.white)),
    );
  }
}

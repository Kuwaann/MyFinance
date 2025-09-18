import 'package:flutter/material.dart';

class OddEvenPage extends StatefulWidget {
  const OddEvenPage({super.key});

  @override
  State<OddEvenPage> createState() => _OddEvenPageState();
}

class _OddEvenPageState extends State<OddEvenPage> {
  final TextEditingController _controller = TextEditingController();
  String _result = "";

  // fungsi buat cek ganjil/genap
  void _checkNumber() {
    if (_controller.text.isEmpty) return;

    double? number = double.tryParse(_controller.text);
    if (number == null) {
      // kalau input bukan angka
      setState(() => _result = "Input bukan angka!");
    } else {
      // bulatkan normal (round) → baru cek ganjil/genap
      int rounded = number.round();

      setState(() {
        _result = (rounded % 2 == 0) ? "Genap" : "Ganjil";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 10, 10, 17),
      appBar: AppBar(
        title: const Text(
          "Cek Ganjil/Genap",
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 17, 17, 29),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 17, 17, 29),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color.fromARGB(255, 37, 37, 58)),
          ),
          child: Column(
            children: [
              // input angka (bisa desimal)
              TextField(
                controller: _controller,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 37, 37, 58)),
                  ),
                  labelText: "Masukkan angka",
                  labelStyle: TextStyle(color: Colors.white70),
                  filled: true,
                  fillColor: Color.fromARGB(255, 9, 9, 22),
                ),
              ),
              const SizedBox(height: 20),

              // tombol cek
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  ),
                  onPressed: _checkNumber,
                  child: const Text(
                    "Cek",
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // hasil (style sama seperti sebelumnya)
              Text(
                _result,
                style: const TextStyle(fontSize: 24, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:myfinance/styles.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String userInput = "";
  String result = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A11),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context, '/homepage');
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 25,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          // Bagian atas / display input dan hasil
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Input (scroll horizontal kalau panjang)
                Container(
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.centerRight,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    reverse: true,
                    child: Text(
                      userInput,
                      style: const TextStyle(fontSize: 32, color: Colors.white),
                    ),
                  ),
                ),

                // Hasil (auto resize biar nggak overflow)
                Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.centerRight,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerRight,
                    child: Text(
                      result,
                      style: const TextStyle(
                        fontSize: 48,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const Divider(color: AppColors.outlineElement, height: 1),

          // Bagian bawah / tombol untuk input
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            buildButton("AC"),
                            buildButton("÷"),
                            buildButton("×"),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            buildButton("7"),
                            buildButton("8"),
                            buildButton("9"),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            buildButton("4"),
                            buildButton("5"),
                            buildButton("6"),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            buildButton("1"),
                            buildButton("2"),
                            buildButton("3"),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            buildButton("0", flex: 2),
                            buildButton("."),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Kolom bagian kanan
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      buildButton("+"),
                      buildButton("-"),
                      buildButton("⌫"),
                      Expanded(flex: 2, child: buildButton("=")),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Custom bentuk tombol
  Widget buildButton(String text, {int flex = 1}) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Ink(
          decoration: BoxDecoration(
            color: getBgColor(text),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.outlineElement),
          ),
          child: InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            onTap: () {
              setState(() {
                handleButtons(text);
              });
            },
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: getColor(text),
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Warna background tombol
  Color getBgColor(String text) {
    if (text == '=') return const Color.fromARGB(255, 255, 166, 0);
    if (['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'].contains(text)) {
      return AppColors.element;
    }
    return const Color.fromARGB(255, 33, 33, 46);
  }

  /// Warna teks tombol
  Color getColor(String text) {
    if (text == '=') return Colors.black;
    return const Color.fromARGB(255, 255, 255, 255);
  }

  /// Logika tombol
  void handleButtons(String text) {
    if (text == "AC") {
      userInput = "";
      result = "0";
      return;
    }
    if (text == "⌫") {
      if (userInput.isNotEmpty) {
        userInput = userInput.substring(0, userInput.length - 1);
      }
      return;
    }
    if (text == "=") {
      result = calculate();
      return;
    }

    userInput += text;
  }

  /// Hitung ekspresi dengan math_expressions
  String calculate() {
    try {
      String input = userInput;
      input = input.replaceAll("×", "*").replaceAll("÷", "/");

      Parser p = Parser();
      Expression exp = p.parse(input);
      ContextModel cm = ContextModel();

      double eval = exp.evaluate(EvaluationType.REAL, cm);

      // Kalau hasilnya bilangan bulat, tampilkan tanpa koma
      if (eval == eval.roundToDouble()) {
        return eval.toStringAsFixed(0); // integer tanpa koma
      } else {
        // kalau desimal, batasi misalnya max 6 digit di belakang koma
        return eval
            .toStringAsFixed(6)
            .replaceFirst(RegExp(r'0+$'), '')
            .replaceFirst(RegExp(r'\.$'), '');
      }
    } catch (e) {
      return "Error";
    }
  }
}

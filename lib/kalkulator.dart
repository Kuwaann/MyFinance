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

  // Cek apakah karakter adalah operator
  bool _isOperator(String ch) => ch == '+' || ch == '-' || ch == '×' || ch == '÷' || ch == '*' || ch == '/';

  // Ambil angka terakhir dari input (buat validasi titik desimal)
  String _lastNumber(String s) {
    final m = RegExp(r'([0-9]*\.?[0-9]*)$').firstMatch(s);
    return m?.group(0) ?? '';
  }

  // Cari jumlah desimal terbanyak dari semua angka di input
  int _maxDecimalPlacesIn(String s) {
    final re = RegExp(r'(?<![A-Za-z])\d+(?:\.(\d+))?');
    int maxDec = 0;
    for (final m in re.allMatches(s)) {
      final frac = m.group(1);
      if (frac != null && frac.length > maxDec) maxDec = frac.length;
    }
    if (maxDec > 10) maxDec = 10; // batasi maksimal 10 digit desimal
    return maxDec;
  }

  // Format hasil biar lebih rapi
  String _formatNumber(double val, {required int decimalsHint}) {
    if (val == val.roundToDouble()) return val.toStringAsFixed(0); // integer tanpa koma
    final d = decimalsHint.clamp(2, 10); // minimal 2, maksimal 10 desimal
    String s = val.toStringAsFixed(d);
    s = s.replaceFirst(RegExp(r'0+$'), '').replaceFirst(RegExp(r'\.$'), ''); // buang nol berlebih
    return s;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A11),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context); // kembali ke halaman sebelumnya
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 25, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          // Bagian tampilan input dan hasil
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                children: [
                  // Teks input
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        reverse: true,
                        child: Text(
                          userInput.isEmpty ? ' ' : userInput,
                          maxLines: 1,
                          style: const TextStyle(fontSize: 32, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  // Teks hasil
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerRight,
                        child: Text(
                          result,
                          maxLines: 1,
                          style: const TextStyle(fontSize: 48, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const Divider(color: AppColors.outlineElement, height: 1),

          // Bagian tombol kalkulator
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Expanded(child: Row(children: [buildButton("AC"), buildButton("÷"), buildButton("×")])),
                      Expanded(child: Row(children: [buildButton("7"), buildButton("8"), buildButton("9")])),
                      Expanded(child: Row(children: [buildButton("4"), buildButton("5"), buildButton("6")])),
                      Expanded(child: Row(children: [buildButton("1"), buildButton("2"), buildButton("3")])),
                      Expanded(child: Row(children: [buildButton("0", flex: 2), buildButton(".")])),
                    ],
                  ),
                ),
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

  // Widget tombol kalkulator
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
            onTap: () => setState(() => handleButtons(text)),
            child: Center(
              child: Text(
                text,
                style: TextStyle(color: getColor(text), fontSize: 26, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Warna tombol
  Color getBgColor(String text) {
    if (text == '=') return const Color.fromARGB(255, 255, 166, 0);
    if (['0','1','2','3','4','5','6','7','8','9'].contains(text)) return AppColors.element;
    return const Color.fromARGB(255, 33, 33, 46);
  }

  Color getColor(String text) => text == '=' ? Colors.black : Colors.white;

  // Logika input dari tombol
  void handleButtons(String text) {
    if (text == "AC") {
      userInput = "";
      result = "0";
      return;
    }

    if (text == "⌫") {
      if (userInput.isNotEmpty) userInput = userInput.substring(0, userInput.length - 1);
      return;
    }

    if (text == "=") {
      result = calculate();
      return;
    }

    // Jika operator ditekan berurutan, ganti operator terakhir
    if (_isOperator(text)) {
      if (userInput.isEmpty) {
        if (text == '-') userInput = '-'; // izinkan minus di awal
        return;
      }
      final last = userInput[userInput.length - 1];
      if (_isOperator(last)) {
        userInput = userInput.substring(0, userInput.length - 1) + text;
        return;
      }
    }

    // Cegah titik ganda dalam satu angka
    if (text == ".") {
      final lastNum = _lastNumber(userInput);
      if (lastNum.contains('.')) return;
      if (userInput.isEmpty || _isOperator(userInput[userInput.length - 1])) {
        userInput += "0"; // ".5" → "0.5"
      }
    }

    userInput += text;
  }

  // Fungsi hitung ekspresi
  String calculate() {
    try {
      // Ubah tanda × ÷ ke * /
      String input = userInput.replaceAll(',', '.').replaceAll("×", "*").replaceAll("÷", "/");

      // Cari jumlah desimal dari input
      final decimalsHint = _maxDecimalPlacesIn(input);

      final Parser p = Parser();
      final Expression exp = p.parse(input);
      final double eval = exp.evaluate(EvaluationType.REAL, ContextModel());

      return _formatNumber(eval, decimalsHint: decimalsHint);
    } catch (e) {
      return "Error";
    }
  }
}

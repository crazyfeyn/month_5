import 'package:flutter/material.dart';
import 'package:flutter_application/calculator.dart';

void main() {
  final calculator = Calculator();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final aController = TextEditingController();
  final bController = TextEditingController();
  int? result;
  final Calculator calculator = Calculator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              key: ValueKey("a"),
              controller: aController,
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              key: ValueKey("b"),
              controller: aController,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FilledButton(
                    key: ValueKey("minus button"),
                    onPressed: () {
                      setState(() {
                        // result=calculator.add(a, b)
                      });
                    },
                    child: Text("-")),
                FilledButton(
                  key: ValueKey("plus button"),
                  onPressed: () {},
                  child: Text("+"),
                ),
              ],
            ),
            if (result != null) Text(result.toString()),
          ],
        ),
      ),
    );
  }
}
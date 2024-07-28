import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> images = ['text.png', 'web.png', 'wifi.png'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate QR'),
        actions: const [
          Icon(Icons.menu),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ...List.generate(3, (int index) {
            return GestureDetector(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Container(
                  padding: const EdgeInsets.all(80),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: const Color(0xFFFDB623),
                    ),
                    color: const Color(0xFF333333),
                  ),
                  child: Image.asset(
                    'assets/images/${images[index]}',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          })
        ],
      ),
    );
  }
}

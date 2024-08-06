import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const platform = MethodChannel('com.example.flashlight/flashlight');
  bool _isOn = false;

  Future<void> _toggleFlashlight() async {
    try {
      await platform.invokeMethod('toggleFlashlight', {'isOn': !_isOn});
      setState(() {
        _isOn = !_isOn;
      });
    } on PlatformException catch (e) {
      print("Failed to toggle flashlight: '${e.message}'.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black,
            Color(0xFF1C1C1C),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: ElevatedButton(
        onPressed: _toggleFlashlight,
        child: Text(_isOn ? 'Turn Off' : 'Turn On'),
      ),
    ));
  }
}

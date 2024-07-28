import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TextQr extends StatefulWidget {
  const TextQr({super.key});

  @override
  State<TextQr> createState() => _TextQrState();
}

class _TextQrState extends State<TextQr> {
  final GlobalKey globalKey = GlobalKey();
  String qrData = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text QR Image'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            QrImageView(
              data: '1234567890',
              version: QrVersions.auto,
              size: 200.0,
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter text',
              ),
              onChanged: (value) {
                setState(() {
                  qrData = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ScannedScreen extends StatelessWidget {
  final String qrCodeData;

  const ScannedScreen({Key? key, required this.qrCodeData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scanned QR Code'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (qrCodeData.isNotEmpty) ...[
              QrImageView(
                data: qrCodeData,
                version: QrVersions.auto,
                size: 200,
                backgroundColor: Colors.white,
              ),
              const SizedBox(height: 20),
              const Text(
                'Scanned Data:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                qrCodeData,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
            ] else ...[
              const Text(
                'No data found',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

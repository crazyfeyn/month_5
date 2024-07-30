import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/views/widgets/bottom_padding.dart';
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Clipboard.setData(ClipboardData(text: qrCodeData));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Data copied to clipboard!'),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Container(
                  padding: const EdgeInsets.all(14),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFF333333),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Wrap(
                    direction: Axis.vertical,
                    children: [
                      const Text(
                        'Data',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        qrCodeData,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (qrCodeData.isNotEmpty) ...[
              QrImageView(
                data: qrCodeData,
                version: QrVersions.auto,
                size: 200,
                backgroundColor: Colors.white,
              ),
              const SizedBox(height: 20),
              BottomPadding(
                isScanneble: true,
              )
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

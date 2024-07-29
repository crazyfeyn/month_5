import 'package:flutter/material.dart';
import 'package:flutter_application/views/screens/scanned_screen.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class CameraScanScreen extends StatefulWidget {
  const CameraScanScreen({super.key});

  @override
  State<CameraScanScreen> createState() => _CameraScanScreenState();
}

class _CameraScanScreenState extends State<CameraScanScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  String? qrCodeResult;
  bool isNavigating = false;

  @override
  void reassemble() {
    super.reassemble();
    if (controller != null) {
      controller!.pauseCamera();
      controller!.resumeCamera();
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrCodeResult = scanData.code;
      });
      if (qrCodeResult != null && !isNavigating) {
        _navigateToScannedScreen();
      }
    });
  }

  Future<void> _navigateToScannedScreen() async {
    isNavigating = true;
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ScannedScreen(qrCodeData: qrCodeResult!),
      ),
    );
    isNavigating = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera Scan'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: Colors.red,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: 300,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: qrCodeResult != null
                  ? Text('Scanned Code: $qrCodeResult')
                  : const Text('Scan a code'),
            ),
          ),
        ],
      ),
    );
  }
}

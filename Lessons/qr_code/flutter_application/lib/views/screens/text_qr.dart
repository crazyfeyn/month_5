import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application/logic/cubits/text_qr_image_cubit.dart';
import 'package:flutter_application/utils/save_datas.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';

class TextQr extends StatefulWidget {
  const TextQr({super.key});

  @override
  State<TextQr> createState() => _TextQrState();
}

class _TextQrState extends State<TextQr> {
  final SaveDatas saveDatas = SaveDatas();
  late List<String> data = [];
  final TextEditingController textController = TextEditingController();
  final ScreenshotController screenshotController = ScreenshotController();

  @override
  void initState() {
    super.initState();
  }

  Future<void> saveQrCode() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/qr_image.png';
    screenshotController.capture().then((capturedImage) async {
      if (capturedImage != null) {
        final file = File(path);
        await file.writeAsBytes(capturedImage);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('QR Code saved to $path')),
        );
      }
    }).catchError((onError) {
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> shareSaveList = ['share.png', 'save.png'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text QR Image'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Screenshot(
              controller: screenshotController,
              child: context.watch<TextQrImageCubit>().currentData() != ''
                  ? QrImageView(
                      backgroundColor: Colors.white,
                      data: context.watch<TextQrImageCubit>().currentData(),
                      version: QrVersions.auto,
                      size: 200.0,
                    )
                  : Container(
                      height: 200,
                      width: 200,
                      color: Colors.white,
                    ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: textController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter text',
              ),
              onChanged: (value) =>
                  context.read<TextQrImageCubit>().changeQrImage(value),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(2, (int index) {
                return GestureDetector(
                  onTap: () {
                    final qrData =
                        context.read<TextQrImageCubit>().currentData();
                    if (index == 0) {
                      Share.share(qrData);
                    } else {
                      saveQrCode();
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: const Color(0xFFFDB623),
                        ),
                        color: const Color(0xFF333333),
                      ),
                      child: Image.asset(
                        'assets/images/${shareSaveList[index]}',
                        color: const Color(0xFFFDB623),
                        width: 40,
                      ),
                    ),
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}

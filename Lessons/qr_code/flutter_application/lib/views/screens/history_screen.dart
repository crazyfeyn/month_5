import 'package:flutter/material.dart';
import 'package:flutter_application/utils/save_datas.dart';
import 'package:flutter_application/views/screens/scanned_screen.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> datas = SaveDatas.savedDataList;
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
      body: ListView.builder(
          itemCount: datas.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) =>
                            ScannedScreen(qrCodeData: datas[index])));
              },
              child: ListTile(
                title: Text(
                  datas[index],
                ),
              ),
            );
          }),
    );
  }
}

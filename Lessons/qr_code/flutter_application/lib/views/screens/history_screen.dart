import 'package:flutter/material.dart';
import 'package:flutter_application/utils/save_datas.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> datas = SaveDatas.savedDataList;
    return Scaffold(
      body: ListView.builder(
          itemCount: datas.length,
          itemBuilder: (context, index) {
            return ListTile(
                // title: datas[index],
                );
          }),
    );
  }
}

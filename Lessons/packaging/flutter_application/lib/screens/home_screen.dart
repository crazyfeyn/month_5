import 'package:flutter/material.dart';
import 'package:crazyfeyns_first_package/crazyfeyns_first_package.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var testing = CrazyfeynsFirstPackageBase();
    return  Scaffold(
      body: Column(
        children: [
          Text(testing.toLowerCase('Hell0 How are you'))
        ],
      ),
    );
  }
}

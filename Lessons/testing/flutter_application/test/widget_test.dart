import 'package:flutter/material.dart';
import 'package:flutter_application/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('sa', (){
    testWidgets('Calculatorni (+) ni borligini tekshirish', (widgetTester) async {
    await widgetTester.pumpWidget(MaterialApp(
      home: CalculatorScreen(),
    ));

    expect(find.byKey(ValueKey('plus button')), findsOneWidget);
    expect(find.byKey(ValueKey('minus button')), findsOneWidget);
  });
  });
}

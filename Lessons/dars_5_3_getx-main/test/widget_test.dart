import 'package:dars_5_3_getx/ui/screens/words_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('image and wrap', (WidgetTester tester) async {
    await tester.pumpWidget(WordsScreen());

    await tester.pumpAndSettle();

    final imageFinder = find.byType(Image);

    expect(imageFinder, findsNWidgets(2));
  });
}

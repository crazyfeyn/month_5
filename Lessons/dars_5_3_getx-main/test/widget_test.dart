import 'package:dars_5_3_getx/blocs/words_bloc/words_bloc.dart';
import 'package:dars_5_3_getx/ui/screens/words_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  testWidgets('image and wrap', (WidgetTester tester) async {
    await tester.pumpWidget(WordsScreen());

    // Wait for the widget to build
    await tester.pumpAndSettle();

    // Find the Image widgets
    final imageFinder = find.byType(Image);

    // Check if there are exactly 4 Image widgets
    expect(imageFinder, findsNWidgets(2));
  });
}

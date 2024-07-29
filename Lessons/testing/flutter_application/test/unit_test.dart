import 'package:flutter_application/calculator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('success', () {
    test('Testing is successfully completed nothing', () {
      final calculator = Calculator();

      int result = calculator.add(1, 2);
      expect(result, 3);
      expect(calculator.add(2, 4), equals(6));
      expect(calculator.subtract(2, 4), equals(-2));
    });

    test('Testing2 is successfully completed', () {
      final calculator = Calculator();

      int result = calculator.add(1, 2);
      expect(result, 3);
      expect(calculator.add(2, 4), equals(6));
      expect(calculator.subtract(2, 4), equals(-2));
    });
  });
}

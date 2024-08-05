import 'package:crazyfeyn_sort_groups/crazyfeyn_sort_groups.dart';
import 'package:test/test.dart';

void main() {
  group('General testing', () {
    List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 78, 9, 90, 0, 1];
    final test10 = CrazyfeynSortGroupsBase();

    // True linear search testing
    test('linear search - found', () {
      int target = 78;
      int result = test10.linearSearch(numbers, target);

      expect(result, 7);
    });

    // Invalid linear search testing
    test('linear search - not found', () {
      int target = 213;
      int result = test10.linearSearch(numbers, target);

      expect(result, -1);
    });

    // True jump search testing
    test('jump search - found', () {
      List<int> sortedNumbers = List.from(numbers)..sort();
      int target = 78;
      int result = CrazyfeynSortGroupsBase.jumpSearch(sortedNumbers, target);

      // Find the correct index of the target in the sorted list
      int expectedIndex = sortedNumbers.indexOf(target);

      expect(result, expectedIndex);
    });

    // Invalid jump search testing
    test('jump search - not found', () {
      int target = 213;
      int result = CrazyfeynSortGroupsBase.jumpSearch(numbers, target);

      expect(result, -1);
    });

    //invalid jump search
    test('jump search - found', () {
      List<int> sortedNumbers = List.from(numbers)..sort();
      int target = 78;
      int result = CrazyfeynSortGroupsBase.jumpSearch(sortedNumbers, target);

      // Find the correct index of the target in the sorted list
      int expectedIndex = sortedNumbers.indexOf(target);

      expect(result, expectedIndex);
    });
  });
}

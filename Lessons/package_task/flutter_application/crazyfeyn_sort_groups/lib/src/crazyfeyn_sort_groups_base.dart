import 'dart:math';

/// A base class for sorting and searching algorithms.
class CrazyfeynSortGroupsBase {
  /// Performs a binary search on a sorted list to find the index of the target element.
  ///
  /// Returns the index of the target element if found; otherwise, returns -1.
  /// The list must be sorted in ascending order.
  ///
  /// Example:
  /// ```dart
  /// List<int> numbers = [1, 2, 3, 4, 5];
  /// int index = CrazyfeynSortGroupsBase.binarySearch(numbers, 3); // returns 2
  /// ```
  static int binarySearch(List<int> arr, int target) {
    int left = 0;
    int right = arr.length - 1;

    while (left <= right) {
      int mid = (left + right) ~/ 2;
      if (arr[mid] == target) {
        return mid;
      } else if (arr[mid] < target) {
        left = mid + 1;
      } else {
        right = mid - 1;
      }
    }

    return -1;
  }

  /// Performs a jump search on a sorted list to find the index of the target element.
  ///
  /// Returns the index of the target element if found; otherwise, returns -1.
  /// The list must be sorted in ascending order.
  ///
  /// Example:
  /// ```dart
  /// List<int> numbers = [1, 2, 3, 4, 5];
  /// int index = CrazyfeynSortGroupsBase.jumpSearch(numbers, 4); // returns 3
  /// ```
  static int jumpSearch(List<int> arr, int target) {
    int n = arr.length;
    int step = sqrt(n).toInt();
    int prev = 0;

    while (arr[min(step, n) - 1] < target) {
      prev = step;
      step += sqrt(n).toInt();
      if (prev >= n) {
        return -1; // Target not found
      }
    }

    for (int i = prev; i < min(step, n); i++) {
      if (arr[i] == target) {
        return i;
      }
    }

    return -1;
  }

  /// Performs a linear search on the list to find the index of the target element.
  ///
  /// Returns the index of the target element if found; otherwise, returns -1.
  ///
  /// Example:
  /// ```dart
  /// List<int> numbers = [1, 2, 3, 4, 5];
  /// int index = CrazyfeynSortGroupsBase.linearSearch(numbers, 5); // returns 4
  /// ```
  int linearSearch(List<int> arr, int target) {
    for (int i = 0; i < arr.length; i++) {
      if (arr[i] == target) {
        return i;
      }
    }
    return -1; // Target not found
  }
}

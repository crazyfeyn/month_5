// TODO: Put public facing types in this file.

import 'dart:math';

class CrazyfeynSortGroupsBase {
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

  int linearSearch(List<int> arr, int target) {
    for (int i = 0; i < arr.length; i++) {
      if (arr[i] == target) {
        return i;
      }
    }
    return -1; // Target not found
  }
}

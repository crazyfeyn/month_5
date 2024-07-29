import 'dart:math';

import 'package:get/get.dart';

class WordController extends GetxController {
  RxList wordList = [
    ['f', 'i', 'r', 'e'],
    ['t', 'r', 'e', 'e'],
    ['w', 'a', 't', 'e', 'r'],
    ['c', 'a', 'r'],
  ].obs;

  RxList questionPics = [
    [
      "images/fire1.jpg",
      "images/fire2.jpg",
      "images/fire3.jpg",
      "images/fire4.jpg",
    ],
    [
      "images/tree1.jpg",
      "images/tree2.jpg",
      "images/tree3.jpg",
      "images/tree4.jpg",
    ],
    [
      "images/water1.jpg",
      "images/water2.png",
      "images/water3.jpg",
      "images/water4.jpg",
    ],
    [
      "images/car1.jpg",
      "images/car2.jpg",
      "images/car3.jpg",
      "images/car4.jpg",
    ],
  ].obs;

  RxList answer = [].obs;
  RxList letters = [].obs;
  RxBool checkWin = false.obs;
  RxInt curIndex = 0.obs;
  RxInt point = 0.obs;

  get currentIndex => curIndex;

  void makeEmptyList() {
    for (var i = 0; i < wordList[curIndex.toInt()].length; i++) {
      answer.add(" ");
    }
    letters = [...wordList[curIndex.toInt()]].obs;
    for (var i = letters.length; i < 12; i++) {
      letters.add(String.fromCharCode(Random().nextInt(26) + 65).toLowerCase());
    }
    letters.shuffle();
    print(answer);
    print(letters);
  }

  void clearAnswer() {
    answer = [].obs;
  }

  void cancelAnswerLetter(int index) {
    letters[letters.indexOf(" ")] = answer[index];
    answer[index] = " ";
  }

  void changeLetter(int index) {
    String letter = letters[index];
    if (answer.contains(" ")) {
      letters[index] = " ";
    }
    for (var i = 0; i < answer.length; i++) {
      if (answer[i] == " ") {
        answer[i] = letter;
        break;
      }
    }

    checkWord();
  }

  void checkWord() {
    if (wordList[curIndex.toInt()].join() == answer.join()) {
      checkWin = true.obs;
    } else {
      checkWin = false.obs;
    }
  }

  void next() {
    if (curIndex.toInt() != wordList.length - 1) {
      if (answer.join() == wordList[curIndex.toInt()].join()) {
        print('aondjnfljanaddfwf');
        point += 10;
      }
      curIndex += 1;
      answer.clear();
      letters.clear();
      makeEmptyList();
      checkWord();
    } else {
      curIndex = 0.obs;
      answer.clear();
      letters.clear();
      makeEmptyList();
      checkWord();
      point = 0.obs;
    }
  }
}

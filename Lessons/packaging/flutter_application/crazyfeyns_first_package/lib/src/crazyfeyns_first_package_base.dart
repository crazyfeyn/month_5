class CrazyfeynsFirstPackageBase {
  String toLowerCase(String word) {
    List<String> lst = word.split(' ');
    String result = lst.map((e) => e.toLowerCase()).join(' ');
    return result;
  }
}
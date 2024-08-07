abstract class Readable {
  void read();
}

abstract class Buyabale {
  void buy();
}

abstract class Borrowable {
  void borrow();
}

class Artistic implements Readable {
  @override
  void read() {}
}

class FairyTale implements Readable, Buyabale {
  @override
  void read() {}
  @override
  void buy() {}
}

class Biography implements Readable, Buyabale, Borrowable {
  @override
  void buy() {}
  @override
  void read() {}
  @override
  void borrow() {}
}

abstract class Employee {
  void working();
}

abstract class Worker extends Employee {
  void payed();

  @override
  void working();
}

abstract class Internship extends Employee {
  @override
  void working();
}

class Alisher extends Worker {
  @override
  void payed() {
    // TODO: implement payed
  }

  @override
  void working() {
    // TODO: implement working
  }
}


class Jamshid extends Internship{
  @override
  void working() {
    // TODO: implement working
  }
}
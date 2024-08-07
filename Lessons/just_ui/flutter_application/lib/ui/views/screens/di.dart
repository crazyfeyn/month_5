class PaymentService {
  PaymentOption paymentOption;

  PaymentService({required this.paymentOption});
}

abstract class PaymentOption {
  void pay() {}
}

class ByPayme extends PaymentOption {
  @override
  void pay() {
    print("payed by payme");
  }
}

class ByCash extends PaymentOption {
  @override
  void pay() {
    print("payed by cash");
  }
}

class Bank extends PaymentOption {
  @override
  void pay() {
    print("payed by bank");
  }
}

void main(List<String> args) {
  PaymentService paymentService1 = PaymentService(paymentOption: ByPayme());
  PaymentService paymentService2 = PaymentService(paymentOption: ByCash());
  PaymentService paymentService3 = PaymentService(paymentOption: Bank());

  paymentService1.paymentOption.pay();
  paymentService2.paymentOption.pay();
  paymentService3.paymentOption.pay();
}

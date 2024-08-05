import 'package:crazyfeyns_first_package/crazyfeyns_first_package.dart';
import 'package:test/test.dart';

void main() {
  final lowerer = CrazyfeynsFirstPackageBase();
  test('Make it lower', () {
    expect(lowerer.toLowerCase('HelLo EveRY OnE'), 'hello every one');
  });
}

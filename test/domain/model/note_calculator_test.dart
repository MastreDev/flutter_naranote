import 'package:flutter_test/flutter_test.dart';
import 'package:naranote/domain/model/note_calculator.dart';

void main() {

  final calculator = NoteCalculator();

  test("기간이 93일이고 원금이 39,600,000 인 경우", () {
    const range = 93;
    const principal = 39600000;
    final result = calculator.calc(principal, range, 1.7, 4000);

    expect(result, 37509080);
  });

  test("기간이 74일이고 원금이 4,270,710 인 경우", () {
    const range = 74;
    const principal = 4270710;
    final result = calculator.calc(principal, range, 2.0, 4000);

    expect(result, 4056022);
  });

  test("기간이 43일이고 원금이 5,000,000 인 경우", () {
    const range = 43;
    const principal = 5000000;
    final result = calculator.calc(principal, range, 1.5, 4000);

    expect(result, 4888500);
  });

}

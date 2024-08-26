import 'package:flutter_test/flutter_test.dart';
import 'package:naranote/DateCalculator.dart';
import 'package:naranote/NoteCalculator.dart';

import 'DateCalculator_test.dart';

void main() {
  final holidays = {TestDate.from("2024-08-15"), TestDate.from("2024-03-01")};
  final dateCalculator = DateCalculator(holidays);
  final calculator = NoteCalculator();

  test("금액은 39,600,000, 수취일 2024-, 지급일 2024-10-31, 이율 1.7%, 수수료 4,000, 결과는 37,509,080이다.", () {
    const from = "2024-07-31";
    const to = "2024-10-31";

    final range = dateCalculator.calcDate(TestDate.from(from), TestDate.from(to));
    const principal = 39600000;
    const rate = 1.7;
    const charge = 4000;
    final result = calculator.calc(principal, range, rate, charge);

    expect(result, 37509080);
  });
}

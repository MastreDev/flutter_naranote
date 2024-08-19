// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:naranote/DateCalculator.dart';
import 'package:test/test.dart';

void main() {
  test("8월 19일 부터 8월 20일은 1일 차이다.", () {
    final dateCalc = DateCalculator();

    const from = "2024-08-19";
    const to = "2024-08-20";
    final dates = dateCalc.calcDate(from: TestDate.from(from), TestDate.from(to));

    expect(dates, 1);
  });

  test("8월 18일 부터 8월 20일은 2일 차이다.", () {
    final dateCalc = DateCalculator();

    const from = "2024-08-18";
    const to = "2024-08-20";
    final dates = dateCalc.calcDate(from: TestDate.from(from), TestDate.from(to));

    expect(dates, 2);
  });

  test("같은날짜라면? 0이라고 리턴한다.", () {
    final dateCalc = DateCalculator();

    const from = "2024-08-19";
    const to = "2024-08-19";
    final dates = dateCalc.calcDate(from: TestDate.from(from), TestDate.from(to));

    expect(dates, 0);
  });

  test("to의 날짜가 오늘보다 이전이라면 에러가 나을까 -1이 나을까, 이런경우 책임은 누구에게 있는가.", () {
    final dateCalc = DateCalculator();

    const from = "2024-08-19";
    const to = "2023-08-19";

    final dates = dateCalc.calcDate(from: TestDate.from(from), TestDate.from(to));

    expect(dates, lessThan(-1));
  });
}

class TestDate implements CalcableFormat {
  late final int _year;
  late final int _month;
  late final int _day;

  TestDate.from(String raw) {
    final split = raw.split("-");
    _year = int.parse(split[0]);
    _month = int.parse(split[1]);
    _day = int.parse(split[2]);
  }

  @override
  int getDay() {
    return _day;
  }

  @override
  int getMonth() {
    return _month;
  }

  @override
  int getYear() {
    return _year;
  }
}

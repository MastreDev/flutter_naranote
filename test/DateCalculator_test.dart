// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:naranote/DateCalculator.dart';
import 'package:test/test.dart';

void main() {
  final holidays = {TestDate.from("2024-08-15"), TestDate.from("2024-03-01")};
  final dateCalc = DateCalculator(holidays);

  test("8월 19일 부터 8월 20일은 2일 차이다. 31일 이하이기 때문에 31이 나와야 한다.", () {
    const from = "2024-08-19";
    const to = "2024-08-20";
    final dates = dateCalc.calcDate(TestDate.from(from), TestDate.from(to));

    expect(dates, 31);
  });

  test("8월 18일 부터 8월 20일은 2일 차이다.", () {
    const from = "2024-08-18";
    const to = "2024-08-20";
    final dates = dateCalc.calcDate(TestDate.from(from), TestDate.from(to));

    expect(dates, 31);
  });

  test("같은날짜라면 Unsupported 에러가 발생한다.", () {
    const from = "2024-08-19";
    const to = "2024-08-19";

    expect(() => dateCalc.calcDate(TestDate.from(from), TestDate.from(to)), throwsA(isA<UnsupportedError>()));
  });

  test("to의 날짜가 오늘보다 이전이라면 Unsupported 에러가 발생한다.", () {
    const from = "2024-08-19";
    const to = "2023-08-19";

    expect(() => dateCalc.calcDate(TestDate.from(from), TestDate.from(to)), throwsA(isA<UnsupportedError>()));
  });

  test("Given 2024.08.19, 2024.10.02, 기대값은 45일 이다.", () {
    const from = "2024-08-19";
    const to = "2024-10-02";

    final dates = dateCalc.calcDate(TestDate.from(from), TestDate.from(to));

    expect(dates, 45);
  });

  test("Given 2024.08.19, 2024.10.04, 기대값은 47일 이다.", () {
    const from = "2024-08-19";
    const to = "2024-10-04";

    final dates = dateCalc.calcDate(TestDate.from(from), TestDate.from(to));

    expect(dates, 47);
  });

  test("Given 2024.08.19, 2024.10.05(토요일), 기대값은 50일 이다. 보정 +2일", () {
    const from = "2024-08-19";
    const to = "2024-10-05";

    final dates = dateCalc.calcDate(TestDate.from(from), TestDate.from(to));

    expect(dates, 50);
  });

  test("Given 2024.08.19, 2024.10.06(일요일), 기대값은 50일 이다. 보정 +1일", () {
    const from = "2024-08-19";
    const to = "2024-10-06";

    final dates = dateCalc.calcDate(TestDate.from(from), TestDate.from(to));

    expect(dates, 50);
  });

  test("Given 2024.07.01, 2024.08.15(광복절, 공휴일), 기대값은 47일 이다. 보정 +1일", () {
    const from = "2024-07-01";
    const to = "2024-08-15";

    final dates = dateCalc.calcDate(TestDate.from(from), TestDate.from(to));

    expect(dates, 47);
  });

  test("Given 2024.01.01, 2024.03.01(삼일절, 공휴일), 기대값은 64일 이다. 공휴일 + 1, 토요일 + 1, 일요일 + 1", () {
    const from = "2024-01-01";
    const to = "2024-03-01";
    //단순 계산으로는 61일 이다. 다음 평일은 3월 4일이 된다.
    final dates = dateCalc.calcDate(TestDate.from(from), TestDate.from(to));

    expect(dates, 64);
  });
}

class TestDate implements DateCalculatorFormat {
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

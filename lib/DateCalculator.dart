class DateCalculator {
  late final Set<DateTime> _holidays;

  DateCalculator(Set<DateCalculatorFormat> holidays) {
    _holidays = holidays.map((format) => DateTime(format.getYear(), format.getMonth(), format.getDay())).toSet();
  }

  int calcDate(DateCalculatorFormat start, DateCalculatorFormat end) {
    DateTime receiptDate = DateTime(start.getYear(), start.getMonth(), start.getDay());
    DateTime maturityDate = DateTime(end.getYear(), end.getMonth(), end.getDay());

    // 만기일이 주말이거나, 공휴일인 경우, 하루 더해준다.
    while (_holidays.contains(maturityDate) || maturityDate.isWeekend) {
      maturityDate = maturityDate.add(const Duration(days: 1));
    }

    final range = maturityDate.difference(receiptDate).inDays + 1; // 오늘 날짜 포함
    if (range <= 1) return throw UnsupportedError("Range is too short.");
    return range < 31 ? 31 : range;
  }
}

extension on DateTime {
  bool get isWeekend => weekday == DateTime.saturday || weekday == DateTime.sunday;
}

abstract class DateCalculatorFormat {
  int getYear();

  int getMonth();

  int getDay();
}

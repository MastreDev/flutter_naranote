class DateCalculator {
  int calcDate(DateCalculatorFormat to, DateCalculatorFormat from) {
    DateTime fromDate = DateTime(from.getYear(), from.getMonth(), from.getDay());
    DateTime toDate = DateTime(to.getYear(), to.getMonth(), to.getDay());

    if(toDate.weekday == DateTime.saturday) {
      toDate = toDate.add(const Duration(days: 2));
    } else if (toDate.weekday == DateTime.sunday) {
      toDate = toDate.add(const Duration(days: 1));
    }

    final range = toDate.difference(fromDate).inDays + 1; // 오늘 날짜 포함
    if (range <= 1) return throw UnsupportedError("Range is too short.");
    return range < 31 ? 31 : range;
  }
}

abstract class DateCalculatorFormat {
  int getYear();

  int getMonth();

  int getDay();
}

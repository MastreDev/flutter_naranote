class DateCalculator {
  int calcDate(DateCalculatorFormat to, DateCalculatorFormat from) {
    DateTime fromDate = DateTime(from.getYear(), from.getMonth(), from.getDay());
    DateTime toDate = DateTime(to.getYear(), to.getMonth(), to.getDay());
    return toDate.difference(fromDate).inDays;
  }
}

abstract class DateCalculatorFormat {
  int getYear();

  int getMonth();

  int getDay();
}

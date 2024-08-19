class DateCalculator {
  int calcDate(CalcableFormat to, {CalcableFormat? from}) {
    DateTime fromDate = from != null ? DateTime(from.getYear(), from.getMonth(), from.getDay()) : DateTime.now();
    DateTime toDate = DateTime(to.getYear(), to.getMonth(), to.getDay());
    return toDate.difference(fromDate).inDays;
  }
}

abstract class CalcableFormat {
  int getYear();

  int getMonth();

  int getDay();
}

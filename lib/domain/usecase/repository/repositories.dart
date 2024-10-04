import '../../model/date_calculator.dart';

abstract class HolidayRepository{

  Future<List<Holiday>> getHolidayIn(int year);

}
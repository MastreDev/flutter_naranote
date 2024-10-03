import 'package:naranote/UseCase.dart';

class GetHolidaysUseCase implements UseCase<GetHolidayParam, GetHolidayResult> {
  @override
  Future<GetHolidayResult> execute(GetHolidayParam input) {
    return Future.value(GetHolidayResult());
  }
}

class GetHolidayParam {
  late final int year;

  GetHolidayParam(this.year);
}

class GetHolidayResult {}

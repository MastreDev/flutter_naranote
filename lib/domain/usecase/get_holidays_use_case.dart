import 'package:naranote/domain/model/date_calculator.dart';
import 'package:naranote/domain/usecase/use_case.dart';

import 'repository/repositories.dart';

class GetHolidaysUseCase implements UseCase<GetHolidayParam, GetHolidayResult> {
  final HolidayRepository repository;

  GetHolidaysUseCase(this.repository);

  @override
  Future<GetHolidayResult> execute(GetHolidayParam input) {
    //input 으로 들어온 Year 앞, 뒤도 같이 요청한다.
    return Future.wait([repository.getHolidayIn(input.year - 1), repository.getHolidayIn(input.year), repository.getHolidayIn(input.year + 1)])
        .then((x) => GetHolidayResult(x.expand((y) => y)));
  }
}

class GetHolidayParam {
  late final int year;

  GetHolidayParam(this.year);
}

class GetHolidayResult {
  late final Iterable<Holiday> holidays;

  GetHolidayResult(this.holidays);
}

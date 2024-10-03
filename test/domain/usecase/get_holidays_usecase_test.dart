import 'package:flutter_test/flutter_test.dart';
import 'package:naranote/domain/get_holidays_use_case.dart';

void main() {
  test("2024를 매게변수로 보내면 빈 날짜들이 내려온다.", () async {
    final useCase = GetHolidaysUseCase();
    final params = GetHolidayParam(2024);

    final result = await useCase.execute(params);

    expect(result, anything);
    // expect(result, );
  });
}

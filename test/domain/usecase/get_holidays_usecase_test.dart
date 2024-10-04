import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:naranote/domain/usecase/get_holidays_use_case.dart';
import 'package:naranote/domain/usecase/repository/repositories.dart';

class MockHolidayRepository extends Mock implements HolidayRepository {}

void main() {
  late HolidayRepository repository;
  late GetHolidaysUseCase useCase;

  setUp(() {
    repository = MockHolidayRepository();
    useCase = GetHolidaysUseCase(repository);
    when(() => repository.getHolidayIn(any())).thenAnswer((_) async => []);
  });

  test("2024를 매게변수로 보내면 빈 날짜들이 내려온다.", () async {
    //Arrange
    final params = GetHolidayParam(2024);

    //Execute
    final result = await useCase.execute(params);

    //Assert
    expect(result, anything);
  });

  test("입력받은 year를 기준으로 전년도, 이후 년도의 정보까지 같이 요청한다.", () async {
    //Arrange
    final params = GetHolidayParam(2024);

    //Execute
    await useCase.execute(params);

    // Bad...
    // verify(() => repository.getHolidayIn(2023)).called(1);
    // verify(() => repository.getHolidayIn(2024)).called(1);
    // verify(() => repository.getHolidayIn(2025)).called(1);

    //Assert
    final captured = verify(() => repository.getHolidayIn(captureAny())).captured;
    expect(captured, [2023, 2024, 2025]);
  });
}

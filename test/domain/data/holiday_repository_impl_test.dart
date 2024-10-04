import 'package:flutter_test/flutter_test.dart';
import 'package:naranote/domain/data/holiday_repository_impl.dart';
import 'package:naranote/domain/usecase/repository/repositories.dart';

void main() {
  const holidaysIn2023 = [
    '20230101',
    '20230121',
    '20230122',
    '20230123',
    '20230124',
    '20230301',
    '20230505',
    '20230527',
    '20230529',
    '20230606',
    '20230815',
    '20230928',
    '20230929',
    '20230930',
    '20231002',
    '20231003',
    '20231009',
    '20231225'
  ];
  const holidaysIn2024 = [
    '20240101',
    '20240209',
    '20240210',
    '20240211',
    '20240212',
    '20240301',
    '20240410',
    '20240505',
    '20240506',
    '20240515',
    '20240606',
    '20240815',
    '20240916',
    '20240917',
    '20240918',
    '20241001',
    '20241003',
    '20241009',
    '20241225'
  ];
  const holidaysIn2025 = [
    '20250101',
    '20250128',
    '20250129',
    '20250130',
    '20250301',
    '20250303',
    '20250505',
    '20250505',
    '20250506',
    '20250606',
    '20250815',
    '20251003',
    '20251005',
    '20251006',
    '20251007',
    '20251008',
    '20251009',
    '20251225'
  ];

  late HolidayRepository repository;

  setUp(() {
    repository = HolidayRepositoryImpl();
  });

  test(("2023년 정보"), () async {
    const year = 2023;

    final response = await repository.getHolidayIn(year);

    expect(response.map((x) => x.getRaw()), holidaysIn2023);
  });

  test(("2024년 정보"), () async {
    const year = 2024;

    final response = await repository.getHolidayIn(year);

    expect(response.map((x) => x.getRaw()), holidaysIn2024);
  });

  test(("2025년 정보"), () async {
    const year = 2025;

    final response = await repository.getHolidayIn(year);

    expect(response.map((x) => x.getRaw()), holidaysIn2025);
  });
}


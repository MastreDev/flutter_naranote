import 'package:flutter_test/flutter_test.dart';
import 'package:naranote/domain/model/date_calculator.dart';

void main() {

  test('날짜 자르기', (){
    // 20240819
    const raw = '20240819';
    final date = NoteDate.from(raw);

    expect(date.getYear(), 2024);
    expect(date.getMonth(), 8);
    expect(date.getDay(), 19);
  });

}
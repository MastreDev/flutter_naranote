// 커스텀 Formatter: 소수점이 여러 번 입력되지 않도록 처리
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class DecimalTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text == '.') {
      return newValue.copyWith(text: '0.');
    } else if (newValue.text.contains('.') && newValue.text.indexOf('.') != newValue.text.lastIndexOf('.')) {
      // 소수점이 여러 번 입력되는 것을 방지
      return oldValue;
    }
    return newValue;
  }
}

// 세 자리마다 콤마를 추가하는 Formatter
class ThousandsSeparatorInputFormatter extends TextInputFormatter {
  final NumberFormat _formatter = NumberFormat('#,###'); // 세 자리마다 , 추가

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // 숫자만 남기고 포맷
    final newText = newValue.text.replaceAll(',', '');
    final formattedText = _formatter.format(int.parse(newText));

    return newValue.copyWith(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length), // 커서를 끝으로 이동
    );
  }
}
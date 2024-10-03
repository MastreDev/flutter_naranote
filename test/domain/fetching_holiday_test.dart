import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart';

void main() {
  // http://apis.data.go.kr/B090041/openapi/service/SpcdeInfoService/getRestDeInfo
  test("공공데이터로 부터 기념일 가져오기", () async {
    // encode %2BkDwR5UHZGHUwbIwSn0gqzIcwZ0FQOuyED5W787pMylkOlMnFVT%2F2VE1qqJH6o8jOt5sWlzVRf5v3xBgOhU0Gw%3D%3D
    // decode +kDwR5UHZGHUwbIwSn0gqzIcwZ0FQOuyED5W787pMylkOlMnFVT/2VE1qqJH6o8jOt5sWlzVRf5v3xBgOhU0Gw==

    const key = "%2BkDwR5UHZGHUwbIwSn0gqzIcwZ0FQOuyED5W787pMylkOlMnFVT%2F2VE1qqJH6o8jOt5sWlzVRf5v3xBgOhU0Gw%3D%3D";

    final url = Uri.parse("http://apis.data.go.kr/B090041/openapi/service/SpcdeInfoService/getRestDeInfo?serviceKey=$key&solYear=2024&numOfRows=100");
    final response = await http.get(url);
    final statusCode = response.statusCode;
    final utf8ed = utf8.decode(response.bodyBytes);
    final xmled = XmlDocument.parse(utf8ed);

    final holidays = xmled
        .findAllElements("item")
        .map((element) => element.getElement("locdate")?.innerText)
        .where((ele) => ele != null)
        .map((locdate) => {Holiday(locdate!)});

    expect(statusCode, 200);
  });
}

class Holiday {
  late final String _raw;

  Holiday(this._raw);

  @override
  String toString() {
    return _raw;
  }
}

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:naranote/domain/usecase/repository/repositories.dart';
import 'package:xml/xml.dart';

import '../model/date_calculator.dart';

class HolidayRepositoryImpl implements HolidayRepository {
  // encode %2BkDwR5UHZGHUwbIwSn0gqzIcwZ0FQOuyED5W787pMylkOlMnFVT%2F2VE1qqJH6o8jOt5sWlzVRf5v3xBgOhU0Gw%3D%3D
  // decode +kDwR5UHZGHUwbIwSn0gqzIcwZ0FQOuyED5W787pMylkOlMnFVT/2VE1qqJH6o8jOt5sWlzVRf5v3xBgOhU0Gw==

  final key = "%2BkDwR5UHZGHUwbIwSn0gqzIcwZ0FQOuyED5W787pMylkOlMnFVT%2F2VE1qqJH6o8jOt5sWlzVRf5v3xBgOhU0Gw%3D%3D";
  final base = "http://apis.data.go.kr/B090041/openapi/service/SpcdeInfoService/getRestDeInfo?serviceKey=";

  @override
  Future<List<Holiday>> getHolidayIn(int year) async {
    // final beforeUrl = Uri.parse("$base$key&solYear=${year - 1}&numOfRows=100");
    // final url = Uri.parse("$base$key&solYear=$year&numOfRows=100");
    // final afterUrl = Uri.parse("$base$key&solYear=${year + 1}&numOfRows=100");
    //
    // final response = await Future.wait([
    //   http.get(beforeUrl).then((response) => response.decodeUtf8().toXml().parseDate()),
    //   http.get(url).then((response) => response.decodeUtf8().toXml().parseDate()),
    //   http.get(afterUrl).then((response) => response.decodeUtf8().toXml().parseDate())
    // ]);
    //
    // return response.expand((res) => res).toList();
    final url = Uri.parse("$base$key&solYear=$year&numOfRows=100");
    final response = await http.get(url).then((response) => response.decodeUtf8().toXml().parseDate());
    return response.toList();
  }
}

extension StringXml on String {
  XmlDocument toXml() {
    return XmlDocument.parse(this);
  }
}

extension ResponseUtil on http.Response {
  String decodeUtf8() {
    return utf8.decode(bodyBytes);
  }
}

extension HolidayUtil on XmlDocument {
  Iterable<Holiday> parseDate() {
    return findAllElements("item")
        .map((element) => element.getElement("locdate")?.innerText)
        .where((ele) => ele != null)
        .map((locDate) => Holiday.from(locDate!));
  }
}

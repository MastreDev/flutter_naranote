import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:naranote/presentation/textfield_inputformatters.dart';

import 'domain/model/date_calculator.dart';
import 'domain/model/note_calculator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '나래 어음',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: '나래 어음'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _dates = 0;
  String _resultMsg = "";

  final startDateField = TextEditingController();
  final endDateField = TextEditingController();
  final principalField = TextEditingController();
  final rateField = TextEditingController();
  final chargeField = TextEditingController(text: '4000');

  late final holidays = {Holiday.from("2024-08-15"), Holiday.from("2024-03-01")};
  late final DateCalculator dateCalc = DateCalculator(holidays);

  FocusNode initFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(initFocusNode);
    });
  }

  @override
  void dispose() {
    startDateField.dispose();
    endDateField.dispose();
    initFocusNode.dispose();
    principalField.dispose();
    rateField.dispose();
    chargeField.dispose();
    super.dispose();
  }

  void _reactiveCalculate() {
    final from = startDateField.text.trim();
    final end = endDateField.text.trim();

    if (!RegExp(r'^\d{8}$').hasMatch(from)) {
      return;
    }

    if (!RegExp(r'^\d{8}$').hasMatch(end)) {
      return;
    }

    final endDate = NoteDate.from(endDateField.text);
    final dates = dateCalc.calcDate(NoteDate.from(from), endDate);
    setState(() {
      _dates = dates;
    });

    final principal = principalField.text;
    final rate = rateField.text;
    final charge = chargeField.text;
    final paymentDay = "${endDate.getYear().toString().substring(2, 4)}.${endDate.getMonth()}.${endDate.getDay()}";

    if (!RegExp(r'^\d+\.\d+$').hasMatch(rate)) {
      setState(() {
        _resultMsg = '';
      });
      return;
    }

    final calculator = NoteCalculator();
    final result = calculator.calc(int.parse(principal.replaceAll(',', '')), _dates, double.parse(rate), int.parse(charge));
    final interest = calculator.calcInterest(int.parse(principal.replaceAll(',', '')), _dates, double.parse(rate));
    final NumberFormat formatter = NumberFormat('#,###');

    final msg = "금    액: $principal\n"
        "지급일: $paymentDay\n"
        "일    수: $_dates일\n"
        "이    율: $rate%\n"
        "이    자: ${formatter.format(interest)}\n"
        "수수료: ${formatter.format(int.parse(charge))}\n"
        "송금액: ${formatter.format(result)}\n";

    setState(() {
      _resultMsg = msg;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: TextField(
                    focusNode: initFocusNode,
                    decoration: const InputDecoration(border: OutlineInputBorder(), labelText: '시작일'),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly, // 숫자만 입력받도록 제한
                    ],
                    controller: startDateField,
                    onChanged: (value) {
                      _reactiveCalculate();
                    },
                  )),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                      child: TextField(
                    decoration: const InputDecoration(border: OutlineInputBorder(), labelText: '지급일'),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly, // 숫자만 입력받도록 제한
                    ],
                    controller: endDateField,
                    onChanged: (value) {
                      _reactiveCalculate();
                    },
                  )),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '날 수: $_dates',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                  controller: principalField,
                  decoration: const InputDecoration(border: OutlineInputBorder(), labelText: '금액'),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    _reactiveCalculate();
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly, // 숫자만 입력받도록 제한
                    ThousandsSeparatorInputFormatter(), // 천 단위로 , 추가
                  ]),
              const SizedBox(
                height: 10,
              ),
              TextField(
                  controller: rateField,
                  decoration: const InputDecoration(border: OutlineInputBorder(), labelText: '이율'),
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  onChanged: (value) {
                    _reactiveCalculate();
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')), // 숫자와 .만 허용
                    DecimalTextInputFormatter(),
                  ]),
              const SizedBox(
                height: 10,
              ),
              TextField(
                  controller: chargeField,
                  decoration: const InputDecoration(border: OutlineInputBorder(), labelText: '수수료'),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    _reactiveCalculate();
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly, // 숫자만 입력받도록 제한
                  ]),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    _reactiveCalculate();
                  },
                  child: const Text("영수증 발행")),
              const SizedBox(
                height: 10,
              ),
              Text(_resultMsg)
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _calcDates,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

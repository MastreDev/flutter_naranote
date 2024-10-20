import 'package:flutter/material.dart';
import 'package:naranote/feat-calculator/calculator_page.dart';

import 'presentation/theme.dart';
import 'presentation/util.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context, "Noto Serif", "Noto Sans");

    MaterialTheme theme = MaterialTheme(textTheme);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.light(),
      home: const CalculatorPage(title: '나래 어음'),
    );
  }
}
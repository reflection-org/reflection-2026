import 'package:flutter/material.dart';
import 'package:reflection2026/feature/main/main_page_for_web.dart';
import 'package:reflection2026/feature/main/main_page_for_mobile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'reflection 2026',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Pretendard',
      ),
      home: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 600) {
            return const MainPageForWeb();
          } else {
            return const MainPageForMobile();
          }
        },
      ),
    );
  }
}

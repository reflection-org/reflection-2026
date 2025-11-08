import 'package:flutter/material.dart';
import 'package:reflection2026/feature/intro/intro_page.dart';
import 'package:reflection2026/feature/welcome/welcome_message_page.dart';
import 'package:reflection2026/shared/ui/theme/custom_color.dart';

import 'feature/clock/clock_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Pretendard',
      ),
      home: const Scaffold(
        backgroundColor: CustomColor.black,
        body: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            SliverToBoxAdapter(
              child: IntroPage(),
            ),
            SliverToBoxAdapter(
              child: ClockPage(),
            ),
            SliverToBoxAdapter(
              child: WelcomeMessagePage(),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:reflection2026/feature/intro/intro_page.dart';
import 'package:reflection2026/feature/welcome/welcome_message_page.dart';
import 'package:reflection2026/shared/ui/component/footer/footer.dart';
import 'package:reflection2026/shared/ui/component/header/header.dart';
import 'package:reflection2026/shared/ui/theme/custom_color.dart';
import 'package:sliver_tools/sliver_tools.dart';

import 'feature/clock/clock_page.dart';
import 'feature/faq/faq_page.dart';
import 'feature/information/sliver_information_page.dart';

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
            SliverPinnedHeader(child: Header()),
            SliverToBoxAdapter(
              child: IntroPage(),
            ),
            SliverToBoxAdapter(
              child: ClockPage(),
            ),
            SliverToBoxAdapter(
              child: WelcomeMessagePage(),
            ),
            SliverInformationPage(),
            SliverToBoxAdapter(
              child: FaqPage(),
            ),
            SliverToBoxAdapter(
              child: Footer(),
            )
          ],
        ),
      ),
    );
  }
}

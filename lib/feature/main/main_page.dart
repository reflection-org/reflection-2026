import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';
import '../../shared/ui/component/footer/footer.dart';
import '../../shared/ui/component/header/header.dart';
import '../../shared/ui/theme/custom_color.dart';
import '../clock/clock_page.dart';
import '../faq/faq_page.dart';
import '../information/sliver_information_page.dart';
import '../intro/intro_page.dart';
import '../welcome/welcome_message_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _prefetchImage();
  }

  Future<void> _prefetchImage() async {
    precacheImage(Assets.images.infoBackground.provider(), context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.black,
      body: Stack(
        children: [
          CustomScrollView(
              controller: _scrollController,
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
                SliverInformationPage(),
                SliverToBoxAdapter(
                  child: FaqPage(),
                ),
                SliverToBoxAdapter(
                  child: Footer(),
                ),
              ]),
          Header(),
        ],
      ),
    );
  }
}

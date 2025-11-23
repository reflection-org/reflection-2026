import 'package:flutter/material.dart';
import 'package:reflection2026/feature/main/enum/section.dart';

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
  Section currentSection = Section.introduce;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final offset = _scrollController.offset - 3000;

    final mapContext = mapKey.currentContext;
    final faqContext = faqKey.currentContext;

    if (mapContext == null || faqContext == null) return;

    final mapPosition = (mapContext.findRenderObject() as RenderBox)
        .localToGlobal(Offset.zero, ancestor: context.findRenderObject())
        .dy;

    final faqPosition = (faqContext.findRenderObject() as RenderBox)
        .localToGlobal(Offset.zero, ancestor: context.findRenderObject())
        .dy;

    final Section newSection;
    if (offset >= faqPosition) {
      newSection = Section.faq;
    } else if (offset >= mapPosition) {
      newSection = Section.map;
    } else {
      newSection = Section.introduce;
    }

    print("newSection: $newSection");

    if (currentSection != newSection) {
      setState(() {
        currentSection = newSection;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _prefetchImage();
  }

  Future<void> _prefetchImage() async {
    precacheImage(Assets.images.infoBackground.provider(), context);
  }

  final introKey = GlobalKey();
  final mapKey = GlobalKey();
  final faqKey = GlobalKey();

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
                  child: IntroPage(key: introKey),
                ),
                const SliverToBoxAdapter(
                  child: ClockPage(),
                ),
                const SliverToBoxAdapter(
                  child: WelcomeMessagePage(),
                ),
                SliverInformationPage(
                  mapKey: mapKey,
                ),
                SliverToBoxAdapter(
                  child: FaqPage(
                    key: faqKey,
                  ),
                ),
                const SliverToBoxAdapter(
                  child: Footer(),
                ),
              ]),
          Header(
            currentSection: currentSection,
            introKey: introKey,
            mapKey: mapKey,
            faqKey: faqKey,
            onLogoTap: () {
              _scrollController.animateTo(
                0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
            onSectionTap: (GlobalKey key) {
              final context = key.currentContext;
              if (context != null) {
                Scrollable.ensureVisible(
                  context,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  alignment: 0.0,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

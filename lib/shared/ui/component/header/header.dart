import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:reflection2026/shared/ui/theme/custom_color.dart';

import '../../../../feature/main/enum/section.dart';
import '../../../../gen/assets.gen.dart';

class _SectionTitle extends StatelessWidget {
  final String title;
  final bool isActive;
  final GestureTapCallback onTap;

  const _SectionTitle(
      {super.key,
      required this.title,
      required this.isActive,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        title,
        style: TextStyle(
            color: isActive
                ? CustomColor.white
                : CustomColor.white.withValues(alpha: 0.4),
            fontWeight: FontWeight.w600,
            fontSize: 18),
      ),
    );
  }
}

class Header extends StatelessWidget {
  final Section currentSection;
  final GlobalKey introKey;
  final GlobalKey mapKey;
  final GlobalKey faqKey;
  final GestureTapCallback onLogoTap;
  final Function(GlobalKey) onSectionTap;

  const Header({
    super.key,
    required this.currentSection,
    required this.introKey,
    required this.mapKey,
    required this.faqKey,
    required this.onLogoTap,
    required this.onSectionTap,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: ColoredBox(
          color: CustomColor.ghostTeal,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 80),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: onLogoTap,
                  child: Assets.icons.reflection.svg(
                    width: 187,
                    colorFilter: const ColorFilter.mode(
                      CustomColor.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                Row(
                  spacing: 24,
                  children: [
                    _SectionTitle(
                      title: '세션 소개',
                      isActive: currentSection == Section.introduce,
                      onTap: () {
                        onSectionTap(introKey);
                      },
                    ),
                    _SectionTitle(
                      title: '행사 장소',
                      isActive: currentSection == Section.map,
                      onTap: () {
                        onSectionTap(mapKey);
                      },
                    ),
                    _SectionTitle(
                      title: '자주 묻는 질문',
                      isActive: currentSection == Section.faq,
                      onTap: () {
                        onSectionTap(faqKey);
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

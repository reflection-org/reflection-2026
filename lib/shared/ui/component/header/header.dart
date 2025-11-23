import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:reflection2026/shared/ui/theme/custom_color.dart';

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
          fontSize: 18
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

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
                Assets.icons.reflection.svg(
                  width: 187,
                  colorFilter: const ColorFilter.mode(
                    CustomColor.white,
                    BlendMode.srcIn,
                  ),
                ),
                Row(
                  spacing: 24,
                  children: [
                    _SectionTitle(
                      title: '세션 소개',
                      isActive: true,
                      onTap: () {},
                    ),
                    _SectionTitle(
                      title: '행사 장소',
                      isActive: false,
                      onTap: () {},
                    ),
                    _SectionTitle(
                      title: '자주 묻는 질문',
                      isActive: false,
                      onTap: () {},
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

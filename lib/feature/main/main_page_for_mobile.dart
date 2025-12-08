import 'package:flutter/material.dart';
import 'package:reflection2026/shared/ui/theme/custom_color.dart';

import '../../gen/assets.gen.dart';

class MainPageForMobile extends StatelessWidget {
  const MainPageForMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.black,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Assets.icons.reflection.svg(
                colorFilter: const ColorFilter.mode(
                  CustomColor.white,
                  BlendMode.srcIn,
                ),
                width: 149,
                height: 20,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Assets.images.waiting.image(width: 215, height: 104),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    "모바일은 아직 개발중이에요.",
                    style: TextStyle(
                      color: CustomColor.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "PC 버전으로 이용해주세요.",
                    style: TextStyle(
                      color: CustomColor.white.withValues(alpha: 0.5),
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

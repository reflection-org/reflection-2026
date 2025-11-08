import 'package:flutter/material.dart';
import 'package:reflection2026/shared/ui/theme/custom_color.dart';

import '../../gen/assets.gen.dart';

class WelcomeMessagePage extends StatelessWidget {
  const WelcomeMessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageWidth = (MediaQuery.of(context).size.width / 1920) * 724;
    final imageHeight = (MediaQuery.of(context).size.width / 1920) * 733;
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 200),
          child: Column(
            children: [
              Assets.images.ufoAndIcon.image(
                width: imageWidth,
                height: imageHeight,
              ),
              const SizedBox(height: 56),
              const Text(
                "1월에 진행된 Reflection 이후\n시간이 정말 빠르게 흘렀네요",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: CustomColor.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "정신없이 달리다보니 벌써 이번 년도의\n끝을 향해 달려가고 있네요.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: CustomColor.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "작년, 올해 초에 계획했던 이루고 계신가요?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: CustomColor.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "뭐 아무튼 다시 새로운 한 해를 맞이하며\nReflection 2026 동문회에 여러분을 초대합니다",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: CustomColor.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        const Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  CustomColor.black,
                  Colors.transparent,
                ],
              ),
            ),
            child: SizedBox(
              width: double.infinity,
              height: 228,
            ),
          ),
        ),
      ],
    );
  }
}

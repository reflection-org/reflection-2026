import 'package:flutter/widgets.dart';

import '../../../shared/ui/theme/custom_color.dart';

class ScrollAnimatedWelcomeMessageText extends StatelessWidget {
  const ScrollAnimatedWelcomeMessageText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
    );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:reflection2026/shared/ui/theme/custom_color.dart';

class WelcomeMessageDelegate extends SliverPersistentHeaderDelegate {
  final double extraScrollHeight = 4000.0;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final screenHeight = MediaQuery.of(context).size.height;

    final double percentage =
        (shrinkOffset / extraScrollHeight).clamp(0.0, 1.0);

    int focusIndex = (percentage * 4).floor();
    if (focusIndex >= 4) focusIndex = 3;

    return Container(
      height: screenHeight,
      color: CustomColor.black,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 40,
        children: [
          _buildText("1월에 진행된 Reflection 이후\n시간이 정말 빠르게 흘렀네요", 0, focusIndex),
          _buildText("정신없이 달리다보니 벌써 이번 년도의\n끝을 향해 달려가고 있네요.", 1, focusIndex),
          _buildText("작년, 올해 초에 계획했던 이루고 계신가요?", 2, focusIndex),
          _buildText("뭐 아무튼 다시 새로운 한 해를 맞이하며\nReflection 2026 동문회에 여러분을 초대합니다",
              3, focusIndex),
        ],
      ),
    );
  }

  Widget _buildText(String text, int myIndex, int focusIndex) {
    final bool isFocused = myIndex == focusIndex;
    return AnimatedDefaultTextStyle(
      duration: const Duration(milliseconds: 300),
      style: TextStyle(
        color: isFocused ? Colors.white : Colors.white.withValues(alpha: 0.2),
        fontSize: 28,
        fontWeight: isFocused ? FontWeight.bold : FontWeight.normal,
        height: 1.5,
      ),
      child: Text(text, textAlign: TextAlign.center),
    );
  }

  @override
  double get maxExtent =>
      PlatformDispatcher.instance.views.first.physicalSize.height /
          PlatformDispatcher.instance.views.first.devicePixelRatio +
      extraScrollHeight;

  @override
  double get minExtent =>
      PlatformDispatcher.instance.views.first.physicalSize.height /
      PlatformDispatcher.instance.views.first.devicePixelRatio;

  @override
  bool shouldRebuild(covariant WelcomeMessageDelegate oldDelegate) {
    return oldDelegate.extraScrollHeight != extraScrollHeight;
  }
}

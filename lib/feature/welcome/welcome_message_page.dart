import 'package:flutter/material.dart';
import 'package:reflection2026/shared/ui/theme/custom_color.dart';

import '../../gen/assets.gen.dart';
import 'components/scroll_animated_welcome_message_text.dart';

class WelcomeMessagePage extends StatelessWidget {
  const WelcomeMessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 200),
          child: Column(
            spacing: 56,
            children: [
              Assets.images.ufoAndIcon.image(
                width: 724,
                height: 733,
              ),
              const ScrollAnimatedWelcomeMessageText(),
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

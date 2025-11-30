import 'package:flutter/material.dart';
import 'package:reflection2026/shared/ui/theme/custom_color.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../gen/assets.gen.dart';
import 'components/scroll_animated_welcome_message_text.dart';
import 'delegate/welcome_message_delegate.dart';

class SliverWelcomeMessagePage extends StatelessWidget {
  const SliverWelcomeMessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverStack(
      children: [
        SliverPadding(
          padding: const EdgeInsets.only(bottom: 200),
          sliver: MultiSliver(
            children: [
              SliverToBoxAdapter(
                child: Assets.images.ufoAndIcon.image(
                  width: 724,
                  height: 733,
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 56,
                ),
              ),
              SliverPersistentHeader(
                pinned: false,
                delegate: WelcomeMessageDelegate(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/widgets.dart';
import 'package:reflection2026/feature/information/components/map_component.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../gen/assets.gen.dart';
import 'components/generation_component.dart';

class SliverInformationPage extends StatelessWidget {
  const SliverInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedSliver(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Assets.images.infoBackground.provider(),
          fit: BoxFit.cover,
        ),
      ),
      sliver: SliverPadding(
        padding: const EdgeInsets.symmetric(vertical: 200),
        sliver: MultiSliver(
          children: const [
            SliverToBoxAdapter(
              child: GenerationComponent(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 280),
            ),
            SliverToBoxAdapter(
              child: MapComponent(),
            )
          ],
        ),
      ),
    );
  }
}

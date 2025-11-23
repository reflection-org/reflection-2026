import 'package:flutter/widgets.dart';
import 'package:reflection2026/feature/information/components/map_component.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../gen/assets.gen.dart';
import 'components/generation_component.dart';

class SliverInformationPage extends StatelessWidget {
  final Key mapKey;

  const SliverInformationPage({super.key, required this.mapKey});

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
          children: [
            const SliverToBoxAdapter(
              child: GenerationComponent(),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 140),
            ),
            SliverToBoxAdapter(
              child: SizedBox(key: mapKey, height: 1),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 140),
            ),
            const SliverToBoxAdapter(
              child: MapComponent(),
            )
          ],
        ),
      ),
    );
  }
}

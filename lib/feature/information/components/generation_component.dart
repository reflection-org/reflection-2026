import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../gen/assets.gen.dart';
import '../../../shared/ui/theme/custom_color.dart';
import 'generation_text.dart';

class GenerationComponent extends StatelessWidget {
  const GenerationComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 20,
      children: [
        Assets.images.members.image(width: 562, height: 512),
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 28,
            children: [
              const Text(
                "참가 기수",
                style: TextStyle(
                  color: CustomColor.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Row(
                spacing: 16,
                children: [
                  const GenerationText(
                    generation: "1",
                  ),
                  Text(
                    "~",
                    style: GoogleFonts.poppins(
                        color: CustomColor.white,
                        fontSize: 56,
                        height: 1,
                        fontWeight: FontWeight.w500,
                        fontFeatures: [const FontFeature.tabularFigures()]),
                  ),
                  const GenerationText(
                    generation: "7",
                  ),
                ],
              ),
              const Text(
                "벌써 7기도 성인입니다. 참고로 내년에 들어올\n신입생들은 10기입니다.",
                style: TextStyle(
                  color: CustomColor.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

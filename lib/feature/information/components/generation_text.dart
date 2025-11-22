import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/ui/theme/custom_color.dart';

class GenerationText extends StatelessWidget {
  final String generation;

  const GenerationText({super.key, required this.generation});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 67,
      child: Stack(
        children: [
          Text(
            generation,
            style: GoogleFonts.poppins(
                color: CustomColor.white,
                fontSize: 96,
                height: 1,
                fontWeight: FontWeight.w500,
                fontFeatures: [const FontFeature.tabularFigures()]),
          ),
          Positioned.fill(
            bottom: 14,
            child: Align(
              alignment: AlignmentGeometry.bottomRight,
              child: Text(
                "기",
                style: GoogleFonts.poppins(
                    color: CustomColor.white,
                    fontSize: 24,
                    height: 1,
                    fontWeight: FontWeight.w800,
                    fontFeatures: [const FontFeature.tabularFigures()]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

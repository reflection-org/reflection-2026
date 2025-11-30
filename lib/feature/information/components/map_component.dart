import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../gen/assets.gen.dart';
import '../../../shared/constraints/constraints.dart';
import '../../../shared/ui/theme/custom_color.dart';

class MapComponent extends StatelessWidget {
  const MapComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 20,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40, right: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 28,
            children: [
              const Text(
                "여기서 만나요!",
                style: TextStyle(
                  color: CustomColor.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                "2026.01.10",
                style: GoogleFonts.poppins(
                    color: CustomColor.white,
                    fontSize: 96,
                    height: 1,
                    fontWeight: FontWeight.w500,
                    fontFeatures: [const FontFeature.tabularFigures()]),
              ),
              const Text(
                "모드라운지 남부터미널점입니다!\n서울특별시 서초구 효령로 276 지하1층 104호",
                style: TextStyle(
                    color: CustomColor.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        GestureDetector(
          onTap: () async {
            final url = Uri.parse(Constraints.mapLink);
            if (!await launchUrl(url)) {
              throw Exception('Could not launch $url');
            }
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Assets.images.map.image(width: 562, height: 512),
          ),
        ),
      ],
    );
  }
}

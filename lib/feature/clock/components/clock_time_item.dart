import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reflection2026/shared/ui/theme/custom_color.dart';

class ClockTimeItem extends StatefulWidget {
  final String title;
  final String unit;

  const ClockTimeItem({
    required this.title,
    required this.unit,
    super.key,
  });

  @override
  State<ClockTimeItem> createState() => _ClockTimeItemState();
}

class _ClockTimeItemState extends State<ClockTimeItem> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final itemWidth = 184 / 1920 * screenWidth;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: SizedBox(
        width: itemWidth,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 12,
            children: [
              Text(
                widget.title,
                style: GoogleFonts.poppins(
                    color: CustomColor.white,
                    fontSize: 96,
                    height: 1,
                    fontWeight: FontWeight.w500,
                    fontFeatures: [const FontFeature.tabularFigures()]),
                textAlign: TextAlign.center,
                softWrap: false,
                overflow: TextOverflow.visible,
              ),
              Text(
                widget.unit,
                style: TextStyle(
                  color: CustomColor.white.withValues(alpha: 0.3),
                  fontSize: 20,
                  height: 1,
                  fontWeight: FontWeight.normal,
                ),
                softWrap: false,
                overflow: TextOverflow.visible,
              )
            ],
          ),
        ),
      ),
    );
  }
}

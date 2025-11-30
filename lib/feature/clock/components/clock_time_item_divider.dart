import 'package:flutter/material.dart';

import '../../../shared/ui/theme/custom_color.dart';

class ClockTimeItemDivider extends StatelessWidget {
  const ClockTimeItemDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Text(
        ":",
        style: TextStyle(
          color: CustomColor.white.withValues(alpha: 0.3),
          fontSize: 48,
        ),
      ),
    );
  }
}
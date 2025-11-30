import 'package:flutter/widgets.dart';
import 'package:reflection2026/shared/ui/theme/custom_color.dart';

import 'components/faq_content.dart';

class FaqPage extends StatelessWidget {
  const FaqPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: CustomColor.black,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 200),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 32,
            children: [
              Text(
                "자주 묻는 질문",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  color: CustomColor.white,
                ),
              ),
              FaqContent()
            ],
          ),
        ),
      ),
    );
  }
}

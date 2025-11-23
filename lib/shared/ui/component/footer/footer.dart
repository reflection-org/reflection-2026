import 'package:flutter/widgets.dart';
import 'package:reflection2026/shared/ui/theme/custom_color.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../gen/assets.gen.dart';
import '../../../constraints/constraints.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: CustomColor.dark,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60),
        child: SizedBox(
          width: double.infinity,
          child: GestureDetector(
            onTap: () async {
              final url = Uri.parse(Constraints.instagramLink);
              if (!await launchUrl(url)) {
                throw Exception('Could not launch $url');
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 20,
              children: [
                Assets.icons.instagramLogo.svg(
                  colorFilter: const ColorFilter.mode(
                    CustomColor.gray400,
                    BlendMode.srcIn,
                  ),
                ),
                const Text(
                  "@reflection_conf",
                  style: TextStyle(
                    color: CustomColor.gray400,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

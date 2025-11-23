import 'package:flutter/widgets.dart';
import 'package:reflection2026/shared/ui/theme/custom_color.dart';

import '../../../gen/assets.gen.dart';

class FaqContentItem extends StatefulWidget {
  final String question;
  final String answer;

  const FaqContentItem(
      {super.key, required this.question, required this.answer});

  @override
  createState() => _FaqContentItemState();
}

class _FaqContentItemState extends State<FaqContentItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: SizedBox(
        width: 1144,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 24),
          child: Row(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 20,
                  children: [
                    Text(
                      widget.question,
                      style: const TextStyle(
                        color: CustomColor.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ClipRect(
                      child: AnimatedSize(
                        alignment: Alignment.topLeft,
                        duration: const Duration(milliseconds: 350),
                        curve: Curves.fastOutSlowIn,
                        child: _isExpanded
                            ? Text(
                                widget.answer,
                                style: const TextStyle(
                                  color: CustomColor.gray100,
                                  fontSize: 20,
                                  height: 1.6,
                                ),
                              )
                            : const SizedBox(width: double.infinity,),
                      ),
                    ),
                  ],
                ),
              ),
              AnimatedRotation(
                turns: _isExpanded ? 0.5 : 0,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: Assets.icons.back.svg(
                  colorFilter: const ColorFilter.mode(
                    CustomColor.white,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

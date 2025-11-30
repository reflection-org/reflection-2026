import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reflection2026/shared/ui/theme/custom_color.dart';

import '../../gen/assets.gen.dart';
import 'components/clock_time_item.dart';
import 'components/clock_time_item_divider.dart';

class ClockPage extends StatefulWidget {
  const ClockPage({super.key});

  @override
  State<ClockPage> createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  final List<GlobalKey> _itemKeys = List.generate(4, (_) => GlobalKey());
  double? _maxItemWidth;
  Timer? _timer;

  // 목표 날짜: 2026년 1월 10일 7시
  late final DateTime _targetDate;

  int _remainingDays = 0;
  int _remainingHours = 0;
  int _remainingMinutes = 0;
  int _remainingSeconds = 0;

  @override
  void initState() {
    super.initState();
    // 2026년 1월 10일 7시 0분 0초로 설정
    _targetDate = DateTime(2026, 1, 10, 7, 0, 0);
    _calculateRemainingTime();

    // 1초마다 업데이트
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) {
        _calculateRemainingTime();
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _measureItems();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _calculateRemainingTime() {
    final now = DateTime.now();
    final difference = _targetDate.difference(now);

    if (difference.isNegative) {
      // 목표 시간이 지난 경우
      setState(() {
        _remainingDays = 0;
        _remainingHours = 0;
        _remainingMinutes = 0;
        _remainingSeconds = 0;
      });
      return;
    }

    setState(() {
      _remainingDays = difference.inDays;
      _remainingHours = difference.inHours % 24;
      _remainingMinutes = difference.inMinutes % 60;
      _remainingSeconds = difference.inSeconds % 60;
    });
  }

  void _measureItems() {
    double maxWidth = 0;

    for (var key in _itemKeys) {
      final RenderBox? renderBox =
          key.currentContext?.findRenderObject() as RenderBox?;
      if (renderBox != null) {
        final width = renderBox.size.width;
        if (width > maxWidth) {
          maxWidth = width;
        }
      }
    }

    if (maxWidth > 0 && maxWidth != _maxItemWidth && mounted) {
      setState(() {
        _maxItemWidth = maxWidth;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 200),
            child: DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(Assets.images.clockBackground.path),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 60, horizontal: 70),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 16,
                  children: [
                    const Text(
                      "행사 오픈까지",
                      style: TextStyle(
                        color: CustomColor.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 12,
                        children: [
                          ClockTimeItem(
                            title: _remainingDays.toString().padLeft(2, '0'),
                            unit: "Day",
                          ),
                          const ClockTimeItemDivider(),
                          ClockTimeItem(
                            title: _remainingHours.toString().padLeft(2, '0'),
                            unit: "hour",
                          ),
                          const ClockTimeItemDivider(),
                          ClockTimeItem(
                            title: _remainingMinutes.toString().padLeft(2, '0'),
                            unit: "minute",
                          ),
                          const ClockTimeItemDivider(),
                          ClockTimeItem(
                            title: _remainingSeconds.toString().padLeft(2, '0'),
                            unit: "second",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

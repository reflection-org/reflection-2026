import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:reflection2026/shared/ui/theme/custom_color.dart';
import 'package:video_player/video_player.dart';

import '../../gen/assets.gen.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  late VideoPlayerController _playerController;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();

    _initVideoController();
  }

  void _initVideoController() {
    if (kIsWeb) {
      _playerController = VideoPlayerController.networkUrl(
        Uri.parse('/assets/video/intro.mp4'),
      );
    } else {
      _playerController = VideoPlayerController.asset(Assets.video.intro);
    }

    _playerController.setLooping(true);
    _playerController.setVolume(0);

    _initializeVideoPlayerFuture = _playerController.initialize().then((_) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          setState(() {
            _playerController.play();
          });
        }
      });
    });
  }

  @override
  void dispose() {
    _playerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.black,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return SizedBox.expand(
                      child: FittedBox(
                        fit: BoxFit.cover,
                        clipBehavior: Clip.hardEdge,
                        child: SizedBox(
                          width: _playerController.value.size.width,
                          height: _playerController.value.size.height,
                          child: VideoPlayer(_playerController),
                        ),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                }),
            Positioned.fill(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  LayoutBuilder(builder: (context, constraints) {
                    final topPadding =
                        433 / 1080 * MediaQuery.of(context).size.height;
                    return Padding(
                      padding: EdgeInsets.only(top: topPadding),
                      child: Assets.images.reflection.svg(
                        width: MediaQuery.of(context).size.width - 432 * 2,
                        colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    );
                  })
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Column(
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: CustomColor.primary,
                    ),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      child: Text(
                        "신청하기",
                        style: TextStyle(
                          color: CustomColor.onPrimary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          height: 1,
                        ),
                      ),
                    ),
                  ),
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          CustomColor.black,
                          Colors.transparent,
                        ],
                      ),
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      height: 228,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

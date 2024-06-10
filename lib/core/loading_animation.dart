import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingAnimation extends StatelessWidget {
  final String animationType;
  final Color loadingColor;
  final double loadingSize;
  const LoadingAnimation({
    super.key,
    required this.animationType,
    required this.loadingColor,
    required this.loadingSize,
  });

  @override
  Widget build(BuildContext context) {
    return loadingAnimation(loadingColor, loadingSize)[animationType] ??
        "waveDots";
  }
}

loadingAnimation(Color color, double size) => {
      "waveDots": LoadingAnimationWidget.waveDots(
        color: color,
        size: size,
      ),
      "staggeredDotsWave": LoadingAnimationWidget.staggeredDotsWave(
        color: color,
        size: size,
      ),
      "progressiveDots": LoadingAnimationWidget.prograssiveDots(
        color: color,
        size: size,
      ),
      "horizontalRotatingDots": LoadingAnimationWidget.horizontalRotatingDots(
        color: color,
        size: size,
      ),
      "newtonCradle": LoadingAnimationWidget.newtonCradle(
        color: color,
        size: size,
      ),
      "stretchedDots": LoadingAnimationWidget.stretchedDots(
        color: color,
        size: size,
      ),
      "threeRotatingDots": LoadingAnimationWidget.threeRotatingDots(
        color: color,
        size: size / 2,
      ),
      "fourRotatingDots": LoadingAnimationWidget.fourRotatingDots(
        color: color,
        size: size / 2,
      ),
    };

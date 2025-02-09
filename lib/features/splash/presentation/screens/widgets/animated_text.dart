import 'package:bookly/core/themes/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnimatedText extends StatelessWidget {
  const AnimatedText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context, _) => SlideTransition(
            position: slidingAnimation,
            child: Text(
              'Read Free Books',
              style: Styles.fontMedium18(context),
              textAlign: TextAlign.center,
            )));
  }
}

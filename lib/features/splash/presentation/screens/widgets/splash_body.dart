import 'package:bookly/core/helpers/assets.dart';
import 'package:bookly/core/helpers/extensions.dart';
import 'package:bookly/core/routes/routes.dart';
import 'package:bookly/features/splash/presentation/screens/widgets/animated_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    super.initState();
    initAnimation();
    navigateToHome();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void initAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 5), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 3), () {
      if (!context.mounted) return;
      context.pushNamedAndRemoveUntil(
        Routes.homeScreen,
        predicate: (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          Assets.imagesBookly,
        ),
        const SizedBox(
          height: 5,
        ),
        AnimatedText(slidingAnimation: slidingAnimation)
      ],
    );
  }
}

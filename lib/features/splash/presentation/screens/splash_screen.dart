import 'package:bookly/core/helpers/size_config.dart';
import 'package:bookly/features/splash/presentation/screens/widgets/splash_body.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return const Scaffold(
      body: SplashBody(),
    );
  }
}

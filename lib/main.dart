import 'package:bookly/core/functions/initialize_app.dart';
import 'package:bookly/core/routes/routes.dart';
import 'package:bookly/core/themes/dark_theme.dart';
import 'package:bookly/core/routes/app_router.dart';

import 'package:flutter/material.dart';

void main() async {
  await initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter().generateRoute,
      initialRoute: Routes.splashScreen,
      theme: darkTheme,
    );
  }
}

import 'package:bookly/core/cache/hive_helper.dart';
import 'package:bookly/core/network/api_services.dart';
import 'package:bookly/core/routes/routes.dart';
import 'package:bookly/core/themes/dark_theme.dart';
import 'package:bookly/core/routes/app_router.dart';
import 'package:bookly/core/di/service_locator.dart';
import 'package:bookly/custom_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ApiService.initDio();
  setupServiceLocator();
  await getIt.get<HiveHelper>().init();
  await getIt.get<HiveHelper>().clearExpiredCache();
  Bloc.observer = CustomBlocObserver();

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

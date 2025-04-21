import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly/core/di/service_locator.dart';
import 'package:bookly/custom_bloc_observer.dart';
import 'package:bookly/core/network/api_services.dart';
import 'package:bookly/core/cache/hive_helper.dart';

Future<void> initializeApp() async {
   WidgetsFlutterBinding.ensureInitialized();
  ApiService.initDio();
  setupServiceLocator();
  await HiveHelper.init();
  await HiveHelper.clearExpiredCache();
  Bloc.observer = CustomBlocObserver();
}
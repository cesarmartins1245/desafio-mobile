import 'package:desafio_mobile/lang/translation_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Desafio Mobile',
      navigatorKey: Get.key,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(), //adicionar cores aqui
      // home: SplashPage(),
      locale: TranslationsService.locale,
      fallbackLocale: TranslationsService.fallbackLocale,
      translations: TranslationsService(),
    );
  }
}

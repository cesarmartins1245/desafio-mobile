import 'package:desafio_mobile/lang/en_US.dart';
import 'package:desafio_mobile/lang/pt_BR.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TranslationsService extends Translations {
  static Locale? get locale => Get.deviceLocale;
  static const fallbackLocale = Locale('pt', 'BR');

  @override
  Map<String, Map<String, String>> get keys => {
        'pt_BR': pt_BR,
        'en_US': en_US,
      };
}

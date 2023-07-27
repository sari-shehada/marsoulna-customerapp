import 'dart:io';

import 'package:flutter/material.dart';
import 'package:marsouly/config/global/network_service_config.dart';

import '../../services/shared_prefs_service/shared_preferences_service.dart';
import '../../services/theming_service/theming_service.dart';
import '../dev_env/http_certificates_overrides.dart';

class GlobalConfig {
  static bool _alreadyInitialized = false;

  static Future<void> performInitialConfiguration() async {
    if (_alreadyInitialized) return;
    WidgetsFlutterBinding.ensureInitialized();
    await SharedPreferencesService.init();
    ThemingService.init();
    NetworkServiceConfig.init(NetworkServiceBaseURLEnvironment.production);
    //TODO: Comment HTTP Overrides if not needed
    HttpOverrides.global = HttpCertificateOverrides();
    _alreadyInitialized = true;
  }
}

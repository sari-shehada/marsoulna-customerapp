import 'package:dio/dio.dart';

import '../../services/network_service/network_service.dart';

class NetworkServiceConfig {
  static const Map<NetworkServiceBaseURLEnvironment, String> _apiUrls = {
    NetworkServiceBaseURLEnvironment.local: 'https://localhost:5000/test',
    NetworkServiceBaseURLEnvironment.staging: 'Test',
    NetworkServiceBaseURLEnvironment.production: 'Test',
  };

  static void init(NetworkServiceBaseURLEnvironment environment) {
    NetworkService().init(
      options: BaseOptions(
        baseUrl: _apiUrls[environment]!,
      ),
    );
  }
}

enum NetworkServiceBaseURLEnvironment {
  local,
  staging,
  production,
}

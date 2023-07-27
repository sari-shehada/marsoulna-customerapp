import 'dart:io';

class HttpCertificateOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    //TODO: ISMAIL: Add Check on Host & Port to differentiate between
    //Development environment and from the production and live envs
  }
}

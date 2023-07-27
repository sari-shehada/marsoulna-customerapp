import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

part 'helper_models/error_result.dart';
part 'helper_models/success_result.dart';
part 'network_service_typedefs.dart';

//TODO: Make Calls from the isolates service
class NetworkService {
  //#region Singleton
  static final NetworkService _singleton = NetworkService._internal();

  factory NetworkService() {
    return _singleton;
  }
  NetworkService._internal();
  //#endregion

  Dio _dio = Dio();
  bool _isInitialized = false;
  void init({required BaseOptions options}) {
    if (_isInitialized) return;
    _dio = Dio();
    _dio.options = options;
    _isInitialized = true;
  }

  //#region HTTP Verb: POST
  FutureEither<List<T>> postMany<T>({
    required String url,
    required T Function(Map<String, dynamic> data) mapper,
    Map<String, dynamic>? bodyParameters,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await _resolveRequest(
      () async {
        Response response = await _dio.post(
          url,
          queryParameters: queryParameters,
          data: bodyParameters,
        );
        Map<String, dynamic> parsedResponse = (response.data);
        if (parsedResponse["succeeded"]) {
          return right(SuccessResult(
            data:
                (parsedResponse["data"] as List).map((e) => mapper(e)).toList(),
            reason: parsedResponse["reason"],
          ));
        }
        return left(ErrorResult(
            reason: "Network Exception: ${parsedResponse["reason"]}"));
      },
    );
  }

  FutureEither<T> postSingle<T>({
    required String url,
    required T Function(Map<String, dynamic> data) mapper,
    Map<String, dynamic>? bodyParameters,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await _resolveRequest(
      () async {
        Response response = await _dio.post(
          url,
          queryParameters: queryParameters,
          data: bodyParameters,
        );
        Map<String, dynamic> parsedResponse = (response.data);
        if (parsedResponse["succeeded"]) {
          return right(SuccessResult(
            data: mapper(parsedResponse["data"]),
            reason: parsedResponse["reason"],
          ));
        }
        return left(ErrorResult(
            reason: "Network Exception: ${parsedResponse["reason"]}"));
      },
    );
  }
  //#endregion

  //#region HTTP Verb:GET
  FutureEither<T> getSingle<T>(
      {required String url,
      required T Function(Map<String, dynamic> response) mapper,
      Map<String, dynamic>? queryParameters}) async {
    return await _resolveRequest(
      () async {
        Response response =
            await _dio.get(url, queryParameters: queryParameters);
        Map<String, dynamic> parsedResponse = (response.data);
        if (parsedResponse["succeeded"]) {
          return right(
            SuccessResult(
              data: mapper(parsedResponse["data"]),
              reason: parsedResponse["reason"],
            ),
          );
        }
        return left(ErrorResult(
            reason: "Network Exception: ${parsedResponse["reason"]}"));
      },
    );
  }

  FutureEither<List<T>> getMany<T>(
      {required String url,
      required T Function(Map<String, dynamic> response) mapper,
      Map<String, dynamic>? queryParameters}) async {
    return await _resolveRequest(
      () async {
        Response response =
            await _dio.get(url, queryParameters: queryParameters);
        Map<String, dynamic> parsedResponse = (response.data);
        if (parsedResponse["succeeded"]) {
          return right(SuccessResult(
            data:
                (parsedResponse["data"] as List).map((e) => mapper(e)).toList(),
            reason: parsedResponse["reason"],
          ));
        }
        return left(ErrorResult(
            reason: "Network Exception: ${parsedResponse["reason"]}"));
      },
    );
  }
  //#endregion

  //#region Resolvers and Helper Methods
  FutureEither<T> _resolveRequest<T>(FutureEither<T> Function() request) async {
    try {
      return await request();
    } on DioException catch (error) {
      if (error.response != null && error.response!.statusCode != null) {
        return left(
          ErrorResult(
            reason: _handleResponseCodeErrors(error.response!.statusCode!),
          ),
        );
      }
      return left(ErrorResult(reason: _handleDioErrors(error)));
    } catch (e) {
      return left(ErrorResult(reason: "Logic Exception: $e"));
    }
  }
  //#endregion

  //#region Error Handlers
  String _handleResponseCodeErrors(int statusCode) {
    switch (statusCode) {
      case 400:
        return "400";
      case 401:
        return "401";
      case 403:
        return "403";
      case 404:
        return "404";
      case 409:
        return "409";
      default:
        return "Unknown Error $statusCode";
    }
  }

  static String _handleDioErrors(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return "Connection Time Out";
      case DioExceptionType.sendTimeout:
        return "Send Time Out";
      case DioExceptionType.receiveTimeout:
        return "Receive Timed Out";
      case DioExceptionType.badCertificate:
        return "Bad Certificate";
      case DioExceptionType.badResponse:
        return "Bad Response";
      case DioExceptionType.cancel:
        return "Cancel";
      case DioExceptionType.connectionError:
        return "Connection Error";
      case DioExceptionType.unknown:
        {
          if (error.error is HandshakeException) {
            //FIXME: Will never be handled if HTTP Overrides are added
            return "Handshake Exception";
          }
          return "Unknown ${error.error}";
        }
    }
  }
  // #endregion
}

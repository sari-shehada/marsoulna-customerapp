part of '../network_service.dart';

class SuccessResult<T> {
  T data;
  String? reason;

  SuccessResult({
    required this.data,
    this.reason,
  });
}

class SuccessResult<T> {
  T data;
  String? reason;

  SuccessResult({
    required this.data,
    this.reason,
  });
}

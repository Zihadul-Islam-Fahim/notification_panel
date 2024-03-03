class NetworkResponse {
  final bool isSuccess;
  final int statusCode;
  final dynamic responseData;

  NetworkResponse({
    required this.isSuccess,
    required this.statusCode,
    required this.responseData,
  });
}
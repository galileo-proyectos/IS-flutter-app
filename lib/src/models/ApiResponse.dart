class ApiResponse {
  final int status;
  final String message;
  final dynamic result;
  final dynamic results;

  static final List<int> successStatus = [200, 201];

  ApiResponse({this.status = 200, this.message = 'ok', this.result, this.results});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      status: json['status'],
      message: json['message'] ?? '',
      result: json['result'],
      results: json['results']);
  }

  bool isSuccess() {
    return successStatus.contains(status);
  }

  bool isError() {
    return !isSuccess();
  }

  @override
  String toString() {
    return 'status: $status\nmessage: $message\nresults: $results\nresult: $result';
  }
}

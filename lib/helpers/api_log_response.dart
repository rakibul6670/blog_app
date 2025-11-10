import 'package:logger/web.dart';

class ApiLogResponse {
  final Logger logger = Logger();

  final String url;
  final int statusCode;
  final bool? status;
  final dynamic responseBody;
  final String? message;

  ApiLogResponse({
    required this.url,
    required this.statusCode,
    this.status,
    this.responseBody,
    this.message,
  }) {
    logger.i(
      "Response url: $url \n Response status Code : $statusCode \n Response status: $status \n Response Body : $responseBody \n Response Message : $message",
    );
  }
}

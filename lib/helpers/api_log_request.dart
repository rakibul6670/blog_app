import 'package:logger/logger.dart';

class ApiLogRequest {
  final Logger logger = Logger();

  final String url;
  final Map<String, dynamic>? requestBody;

  ApiLogRequest({required this.url, this.requestBody}) {
    logger.i("Request url: $url \n Request Body : $requestBody");
  }
}

import 'package:logger/logger.dart';

class AppLogger {
  //---------------- logger instance ---------
  static Logger logger = Logger();

  //============== Api Request Logger ==============
  static loggerApiRequest(String url, [Map<String, dynamic>? requestBody]) {
    logger.i("Request url: $url \n Request Body : $requestBody");
  }

  //============== Api Response Logger ==============
  static loggerApiResponse(
    String url,
    bool status, [
    dynamic responseBody,
    String? message,
  ]) {
    logger.i(
      "Response url: $url \n Response status: $status \n Response Body : $responseBody \n Response Message : $message",
    );
  }
}

import 'dart:convert';
import 'package:blog_app/helpers/app_logger.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  //==================== Get Data ===========================
  static Future<dynamic> getData(Uri url) async {
    try {
      final response = await http.get(url);

      AppLogger.loggerApiRequest(url.toString());

      if (response.statusCode == 200 || response.statusCode == 201) {
        final decodedData = jsonDecode(response.body);

        return AppLogger.loggerApiResponse(
          url.toString(),
           response.statusCode,
          decodedData["status"],
          decodedData,
          decodedData["message"],
        );
      } else {
        final decodedData = jsonDecode(response.body);
        return AppLogger.loggerApiResponse(
          url.toString(),
           response.statusCode,
          decodedData["status"],
          null,
          decodedData["message"],
        );
      }
    } catch (e) {
      return AppLogger.loggerApiResponse(
        url.toString(),
        -1,
        false,
        null,
        e.toString(),
      );
    }
  }

  //==================== Post Data ===========================
  static Future<dynamic> postData(
    Uri url,
    Map<String, dynamic> requestBody,
  ) async {
    try {
      final response = await http.post(
        url,
        headers: {"content-type": "application/json"},
        body: jsonEncode(requestBody),
      );

      AppLogger.loggerApiRequest(url.toString());

      if (response.statusCode == 200 || response.statusCode == 201) {
        final decodedData = jsonDecode(response.body);
        return AppLogger.loggerApiResponse(
          url.toString(),
          response.statusCode,
          decodedData["success"],
          decodedData,
          decodedData["message"],
        );
      } else {
        final decodedData = jsonDecode(response.body);
        return AppLogger.loggerApiResponse(
          url.toString(),
           response.statusCode,
          decodedData["success"],
          null,
          decodedData["message"],
        );
      }
    } catch (e) {
      return AppLogger.loggerApiResponse(
        url.toString(),
        -1,
        false,
        null,
        e.toString(),
      );
    }
  }
}

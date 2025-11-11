import 'dart:convert';
import 'package:blog_app/helpers/api_log_request.dart';
import 'package:blog_app/helpers/api_log_response.dart';
import 'package:blog_app/helpers/auth_get_storage.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  //==================== Get Data ===========================
  static Future<ApiLogResponse> getData(Uri url) async {
    try {
      //------------------ Get user token --------
      final token = AuthGetStorage.getUserToken() ?? "";

      final response = await http.get(
        url,
        headers: {"Authorization": "Bearer $token"},
      );

      //------------------ record request ---------
      ApiLogRequest(url: url.toString());

      if (response.statusCode == 200 || response.statusCode == 201) {
        final decodedData = jsonDecode(response.body);

        return ApiLogResponse(
          url: url.toString(),
          status: decodedData["success"],
          statusCode: response.statusCode,
          message: decodedData["message"],
          responseBody: decodedData,
        );
      } else {
        final decodedData = jsonDecode(response.body);
        return ApiLogResponse(
          url: url.toString(),
          status: decodedData["success"],
          statusCode: response.statusCode,
          message: decodedData["message"],
          responseBody: decodedData,
        );
      }
    } catch (e) {
      return ApiLogResponse(
        url: url.toString(),
        status: false,
        statusCode: -1,
        message: e.toString(),
      );
    }
  }

  //==================== Post Data ===========================
  static Future<ApiLogResponse> postData(
    Uri url,
    Map<String, dynamic> requestBody, {
    bool withToken = true,
  }) async {
    try {
      //------------------ Get user token --------
      final String? token = AuthGetStorage.getUserToken();

      final headers = {
        "content-type": "application/json",
        if (withToken && token != null && token.isNotEmpty)
          "Authorization": "Bearer $token",
      };

      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(requestBody),
      );

      //------------------  request info ---------
      ApiLogRequest(url: url.toString(), requestBody: requestBody);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final decodedData = jsonDecode(response.body);

        return ApiLogResponse(
          url: url.toString(),
          status: decodedData["success"],
          statusCode: response.statusCode,
          message: decodedData["message"],
          responseBody: decodedData,
        );
      } else {
        final decodedData = jsonDecode(response.body);
        return ApiLogResponse(
          url: url.toString(),
          status: decodedData["success"],
          statusCode: response.statusCode,
          message: decodedData["message"],
        );
      }
    } catch (e) {
      return ApiLogResponse(
        url: url.toString(),
        status: false,
        statusCode: -1,
        message: e.toString(),
        responseBody: null,
      );
    }
  }
}

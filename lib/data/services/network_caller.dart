import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import 'package:notification_panel/data/models/network_response.dart';
import 'package:notification_panel/data/utilities/urls.dart';


class NetworkCaller {
  Future<NetworkResponse> getRequest(String url) async {
    log(url);

    Response response = await get(Uri.parse(url), headers: {
      'authorization': 'Bearer ${Urls.token}',
      'Content-type': 'application/json'
    });
    log(Urls.token);
    log(response.statusCode.toString());
    log(response.body.toString());
    final decodedResponse = jsonDecode(response.body);

    if (response.statusCode == 200 && decodedResponse["message"] == "Success") {
      return NetworkResponse(
        isSuccess: true,
        statusCode: response.statusCode,
        responseData: decodedResponse,
      );

    }else {
      return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          responseData: decodedResponse);

    }
  }

  Future<NetworkResponse> postRequest(String url,
      {Map<String, dynamic>? body, String? token}) async {
    log(url);
    log(body.toString());
    Response response = await post(Uri.parse(url),
        body: jsonEncode(body),
        headers: {
          'authorization': 'Bearer ${Urls.token}',
          'Content-type': 'application/json'
        });
    log(response.statusCode.toString());
    log(response.body.toString());

    final decodedResponse = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return NetworkResponse(
        isSuccess: true,
        statusCode: response.statusCode,
        responseData: decodedResponse,
      );

    } else {
      return NetworkResponse(
        isSuccess: false,
        statusCode: response.statusCode,
        responseData: decodedResponse,
      );
    }
  }
}
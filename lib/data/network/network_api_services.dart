import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:mvvm_practice/data/app_exceptions.dart';
import 'package:mvvm_practice/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  @override
  Future<dynamic> getApi(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 20));
      responseJson = returnResponse(response);

      return responseJson;
    } on SocketException {
      throw InternetExceptions();
    } on TimeoutException {
      throw RequestTimeout();
    }
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw InvalidUrl();
    }
  }

  @override
  Future<dynamic> postApi(String url, dynamic data) async {
    dynamic responseJson;
    try {
      final response = await http
          .post(Uri.parse(url), body: jsonEncode(data))
          .timeout(const Duration(seconds: 20));
      responseJson = returnResponse(response);

      return responseJson;
    } on SocketException {
      throw InternetExceptions();
    } on TimeoutException {
      throw RequestTimeout();
    }
  }
}

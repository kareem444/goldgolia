import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:goldgolia_project/helper/router_helper.dart';
import 'package:goldgolia_project/util/constants.dart';
import 'package:http/http.dart' as http;

class HttpHelper {
  static Uri fetchUri({required String url}) {
    if (kReleaseMode) {
      return Uri.parse(dotenv.env[Constants.stringBaseUri]! + url);
    } else {
      return Uri.parse(dotenv.env[Constants.stringBaseUri]! + url);
    }
  }

  static String fetchUrlString({required String url}) {
    if (kReleaseMode) {
      return dotenv.env[Constants.stringBaseUri]! + url;
    } else {
      return dotenv.env[Constants.stringBaseUri]! + url;
    }
  }

  static get({required String url, bool auth = false}) async {
    http.Response response = await http.get(
      fetchUri(url: url),
      // headers: auth ? {"authorization": "Bearer $accessToken"} : {},
    );
    return _handelResponse(response);
  }

  static Future post({
    required String url,
    required dynamic data,
    bool auth = false,
  }) async {
    http.Response response = await http.post(
      fetchUri(url: url),
      body: data,
      headers: auth ? {"authorization": "Bearer "} : {},
      // headers: auth ? {"authorization": "Bearer " + accessToken} : {},
    );
    return _handelResponse(response);
  }

  static delete({required String url, bool auth = false}) async {
    http.Response response = await http.delete(
      fetchUri(url: url),
      // headers: auth ? {"authorization": "Bearer " + accessToken} : {},
    );
    return _handelResponse(response);
  }

  static put({required String url, bool auth = false}) async {
    http.Response response = await http.put(
      fetchUri(url: url),
      // headers: auth ? {"authorization": "Bearer " + accessToken} : {},
    );
    return _handelResponse(response);
  }

  static upload({
    required String url,
    bool auth = false,
    required file,
    required String field,
    required String fieldContent,
  }) async {
    http.MultipartRequest request =
        http.MultipartRequest('POST', fetchUri(url: url))
          ..files.add(
            await http.MultipartFile.fromPath(
              'image',
              file.path,
            ),
          )
          // ..headers.addAll({"authorization": "Bearer " + accessToken});
          ..headers.addAll({"authorization": "Bearer "});

    if (field != "") {
      request.fields[field] = fieldContent;
    }

    var response = await request.send();

    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);

    if (response.statusCode == 401) {
      // box.remove("access_token");
      Get.toNamed(RouterHelper.authPage);
    } else {
      return [response.statusCode, json.decode(responseString)];
    }
  }

  static _handelResponse(http.Response response) {
    if (response.statusCode == 401) {
      // box.remove("access_token");
      Get.offAllNamed(RouterHelper.authPage);
      return;
    }
    return response.body;
  }
}

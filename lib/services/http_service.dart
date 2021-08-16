import 'dart:convert';

import 'package:http/http.dart';
import 'package:server_connection/models/post_model.dart';

class Network{

  static String BASE = "dummy.restapiexample.com";
  static Map<String,String> headers = {"Content-Type":"application/json; charset=UTF-8"};

  /* Http Apis */

  static String API_EMPLOYEES = "/api/v1/employees";
  static String API_EMPLOYEE  = "/api/v1/employee/1"; //{id}
  static String API_CREATE = "/api/v1/create";
  static String API_UPDATE = "/api/v1/update/21";// {id}
  static String API_DELETE = "/api/v1/delete/2";// {id}

  /* Http request */

  static Future<String?> GET(String api, Map<String, String> params) async {
    var uri = Uri.http(BASE, api, params); // http or https
    var response = await get(uri);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }

  static Future<String?> GETONE(String api, Map<String, String> params) async {
    var uri = Uri.http(BASE, api, params); // http or https
    var response = await get(uri);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }

  static Future<String?> POST(String api, Map<String, String> params) async {
    var uri = Uri.http(BASE, api); // http or https
    var response = await post(uri, headers: headers, body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Future<String?> PUT(String api, Map<String, String> params) async {
    var uri = Uri.http(BASE, api); // http or https
    var response = await put(uri, headers: headers, body: jsonEncode(params));
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> DEL(String api, Map<String, String> params) async {
    var uri = Uri.http(BASE, api, params); // http or https
    var response = await delete(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  /* Http Params */

  static Map<String, String> paramsEmpty() {
    return Map();
  }

  static Map<String, String> paramsCreate(Post post) {
    Map<String, String> params = new Map();
    params.addAll({
      "employee_name": post.employee_name!,
      "employee_salary": post.employee_salary!,
      "employee_age": post.employee_age.toString(),
      "profile_image": post.profile_image!
    });
    return params;
  }

  static Map<String, String> paramsUpdate(Post post) {
    Map<String, String> params = new Map();
    params.addAll({
      "id": post.id.toString(),
      "employee_name": post.employee_name!,
      "employee_salary": post.employee_salary!,
      "employee_age": post.employee_age.toString(),
      "profile_image": post.profile_image!
    });
    return params;
  }

}
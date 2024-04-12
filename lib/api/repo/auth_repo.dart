


import '../../config/env/build_env.dart';
import '../../model/response_item.dart';
import '../api_helpers.dart';
import '../request_conts.dart';


class AuthRepo {
  static AuthRepo? _instance;

  AuthRepo._();

  static AuthRepo get instance => _instance ??= AuthRepo._();

  String apiUrl = env?.baseUrl ?? '';


  static Future<ResponseItem> userLogin({
    required String email,
    required String password,

  }) async {
    ResponseItem result;
    bool status = true;
    dynamic data;
    String msg = "";

    var params = {
      "email": email,
      "password": password,
    };

    String requestUrl = ApiUrl.baseUrl + ApiEndPoint.login;
    result = await BaseApiHelper.postRequest(appendShowErrorParam(requestUrl,false), params);
    status = result.status;
    data = result.data;
    msg = result.message;

    return ResponseItem(data: data, status: status, message: msg);
  }

  static Future<ResponseItem> userRegister({
    required String userName,
    required String email,
    required String password,
    required String countryCode,
    required String phoneNumber,

  }) async {
    ResponseItem result;
    bool status = true;
    dynamic data;
    String msg = "";

    var params = {
      "user_name" : userName,
      "email" : email,
      "password" : password,
      "country_code" : countryCode,
      "phone_number" : phoneNumber
    };

    String requestUrl = ApiUrl.baseUrl + ApiEndPoint.registration;
    result = await BaseApiHelper.postRequest(appendShowErrorParam(requestUrl,false), params);
    status = result.status;
    data = result.data;
    msg = result.message;

    return ResponseItem(data: data, status: status, message: msg);
  }

}

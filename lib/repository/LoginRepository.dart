import 'package:dio/dio.dart';
import 'package:mobile_skeleton/constants/UrlConstants.dart';
import 'package:mobile_skeleton/model/request/LoginRequest.dart';
import 'package:mobile_skeleton/model/response/BaseResponse.dart';
import 'package:mobile_skeleton/model/response/LoginResponse.dart';
import 'package:mobile_skeleton/utils/injector.dart';

class LoginRepository {
  final Dio dio = locator<Dio>();

  Future<BaseResponse<LoginResponse>> login(
      String email, String password) async {
    try {
      LoginRequest request = new LoginRequest();
      // request.token = Constants.appToken;
      request.email = email;
      request.password = password;

      dio.options.contentType = "application/json";
      Response response =
          await dio.post(UrlConstants.LOGIN_URL, data: request.toJson());

      return BaseResponse<LoginResponse>.fromJson(
          response.data, LoginResponse.fromJson);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return BaseResponse<LoginResponse>.withError("$error");
    }
  }
}

import 'package:json_annotation/json_annotation.dart';

part 'LoginRequest.g.dart';

@JsonSerializable()
class LoginRequest {
  String token;
  String email;
  String password;

  LoginRequest({this.token, this.email, this.password});

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);

  static LoginRequest fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);
}

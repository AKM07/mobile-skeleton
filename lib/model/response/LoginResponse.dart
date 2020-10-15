import 'package:json_annotation/json_annotation.dart';

part 'LoginResponse.g.dart';

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: "UserID")
  final String userId;
  @JsonKey(name: "Email")
  final String email;
  @JsonKey(name: "NamaLengkap")
  final String fullName;
  @JsonKey(name: "Gender")
  final String gender;
  @JsonKey(name: "Alamat")
  final String address;
  @JsonKey(name: "NoHp")
  final String phone;
  @JsonKey(name: "TglLahir")
  final String birthDate;
  @JsonKey(name: "Kota")
  final String city;
  @JsonKey(name: "ZipCode")
  final String zipCode;
  @JsonKey(name: "Aktif")
  final String isActive;
  @JsonKey(name: "IdDoku")
  final String idDoku;
  @JsonKey(name: "WhatsAppNumber")
  final String whatsAppNumber;
  @JsonKey(name: "CekLogin")
  final String loginCheck;
  @JsonKey(name: "DeviceLoyalty")
  final String deviceLoyalty;
  @JsonKey(name: "CreateDate")
  final String createDate;
  final String error;

  LoginResponse(
      {this.userId,
      this.email,
      this.fullName,
      this.gender,
      this.address,
      this.phone,
      this.birthDate,
      this.city,
      this.zipCode,
      this.isActive,
      this.idDoku,
      this.whatsAppNumber,
      this.loginCheck,
      this.deviceLoyalty,
      this.createDate,
      this.error});

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

  static LoginResponse fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  LoginResponse.withError(String errorValue)
      : userId = "",
        email = "",
        fullName = "",
        gender = "",
        address = "",
        phone = "",
        birthDate = "",
        city = "",
        zipCode = "",
        isActive = "",
        idDoku = "",
        whatsAppNumber = "",
        loginCheck = "",
        deviceLoyalty = "",
        createDate = "",
        error = errorValue;
}

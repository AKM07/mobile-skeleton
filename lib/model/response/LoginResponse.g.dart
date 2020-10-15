// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LoginResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) {
  return LoginResponse(
    userId: json['UserID'] as String,
    email: json['Email'] as String,
    fullName: json['NamaLengkap'] as String,
    gender: json['Gender'] as String,
    address: json['Alamat'] as String,
    phone: json['NoHp'] as String,
    birthDate: json['TglLahir'] as String,
    city: json['Kota'] as String,
    zipCode: json['ZipCode'] as String,
    isActive: json['Aktif'] as String,
    idDoku: json['IdDoku'] as String,
    whatsAppNumber: json['WhatsAppNumber'] as String,
    loginCheck: json['CekLogin'] as String,
    deviceLoyalty: json['DeviceLoyalty'] as String,
    createDate: json['CreateDate'] as String,
    error: json['error'] as String,
  );
}

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'UserID': instance.userId,
      'Email': instance.email,
      'NamaLengkap': instance.fullName,
      'Gender': instance.gender,
      'Alamat': instance.address,
      'NoHp': instance.phone,
      'TglLahir': instance.birthDate,
      'Kota': instance.city,
      'ZipCode': instance.zipCode,
      'Aktif': instance.isActive,
      'IdDoku': instance.idDoku,
      'WhatsAppNumber': instance.whatsAppNumber,
      'CekLogin': instance.loginCheck,
      'DeviceLoyalty': instance.deviceLoyalty,
      'CreateDate': instance.createDate,
      'error': instance.error,
    };

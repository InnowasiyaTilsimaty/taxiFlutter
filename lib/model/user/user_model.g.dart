// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpModel _$SignUpModelFromJson(Map<String, dynamic> json) => SignUpModel(
      username: json['username'] as String,
      phone: json['phone'] as String,
      referral: json['referral'] as String,
    );

Map<String, dynamic> _$SignUpModelToJson(SignUpModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'phone': instance.phone,
      'referral': instance.referral,
    };

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
      username: json['username'] as String,
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'phone': instance.phone,
    };

Response _$ResponseFromJson(Map<String, dynamic> json) => Response(
      token: json['token'] as String,
    );

Map<String, dynamic> _$ResponseToJson(Response instance) => <String, dynamic>{
      'token': instance.token,
    };

GetMe _$GetMeFromJson(Map<String, dynamic> json) => GetMe(
      id: json['id'] as String?,
      lastLogin: json['last_login'] as String?,
      username: json['username'] as String?,
      dateJoined: json['date_joined'] as String?,
      phone: json['phone'] as String?,
      qrCode: json['qr_code'] as String?,
      referralCode: json['referral_code'] as String?,
      parent: json['parent'] as String?,
      parentName: json['parent_name'] as String?,
    );

Map<String, dynamic> _$GetMeToJson(GetMe instance) => <String, dynamic>{
      'id': instance.id,
      'last_login': instance.lastLogin,
      'username': instance.username,
      'date_joined': instance.dateJoined,
      'phone': instance.phone,
      'qr_code': instance.qrCode,
      'referral_code': instance.referralCode,
      'parent': instance.parent,
      'parent_name': instance.parentName,
    };

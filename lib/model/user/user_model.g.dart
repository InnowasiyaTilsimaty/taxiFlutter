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

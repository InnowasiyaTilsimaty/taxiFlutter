import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class SignUpModel {
  final String username;
  final String phone;
  final String referral;

  const SignUpModel({
    required this.username,
    required this.phone,
    required this.referral,
  });

  Map<String, dynamic> toJson() => _$SignUpModelToJson(this);

  factory SignUpModel.fromJson(Map<String, dynamic> json) => _$SignUpModelFromJson(json);
}

@JsonSerializable()
class LoginModel {
  final String username;
  final String phone;

  const LoginModel({
    required this.username,
    required this.phone,
  });

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);

  factory LoginModel.fromJson(Map<String, dynamic> json) => _$LoginModelFromJson(json);
}

@JsonSerializable()
class Response {
  final String token;

  const Response({required this.token});

  Map<String, dynamic> toJson() => _$ResponseToJson(this);

  factory Response.fromJson(Map<String, dynamic> json) => _$ResponseFromJson(json);
}

@JsonSerializable()
class GetMe {
  final String? id;
  @JsonKey(name: 'last_login')
  final String? lastLogin;
  final String? username;
  @JsonKey(name: 'date_joined')
  final String? dateJoined;
  final String? phone;
  @JsonKey(name: 'qr_code')
  final String? qrCode;
  @JsonKey(name: 'referral_code')
  final String? referralCode;
  final String? parent;
  @JsonKey(name: 'parent_name')
  final String? parentName;

  const GetMe({
    required this.id,
    required this.lastLogin,
    required this.username,
    required this.dateJoined,
    required this.phone,
    required this.qrCode,
    required this.referralCode,
    required this.parent,
    required this.parentName,
  });

  Map<String, dynamic> toJson() => _$GetMeToJson(this);

  factory GetMe.fromJson(Map<String, dynamic> json) => _$GetMeFromJson(json);
}

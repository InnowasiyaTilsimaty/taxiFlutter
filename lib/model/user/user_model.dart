import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class SignUpModel {
  final String username;
  final String phone;
  final String referral;

  SignUpModel({
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

  LoginModel({
    required this.username,
    required this.phone,
  });
}

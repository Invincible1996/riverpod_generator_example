import 'package:json_annotation/json_annotation.dart';

part 'auth_req.g.dart';

@JsonSerializable()
class AuthReq {
  final String username;
  final String password;
  @JsonKey(name: 'expiresInMins')
  final int? expiresInMins;

  AuthReq({
    required this.username,
    required this.password,
    this.expiresInMins,
  });

  factory AuthReq.fromJson(Map<String, dynamic> json) =>
      _$AuthReqFromJson(json);

  Map<String, dynamic> toJson() => _$AuthReqToJson(this);
}

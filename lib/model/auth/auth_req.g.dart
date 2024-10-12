// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthReq _$AuthReqFromJson(Map<String, dynamic> json) => AuthReq(
      username: json['username'] as String,
      password: json['password'] as String,
      expiresInMins: (json['expiresInMins'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AuthReqToJson(AuthReq instance) => <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'expiresInMins': instance.expiresInMins,
    };

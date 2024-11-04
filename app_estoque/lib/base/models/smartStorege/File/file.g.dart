// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileIMG _$FileIMGFromJson(Map<String, dynamic> json) => FileIMG(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      active: fromJsonBoolean(json['active']),
      fileName: json['fileName'] as String,
      base64Arquiv: json['base64Arquiv'] as String,
      sync: fromJsonBoolean(json['sync']),
    );

Map<String, dynamic> _$FileIMGToJson(FileIMG instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'active': instance.active,
      'sync': instance.sync,
      'fileName': instance.fileName,
      'base64Arquiv': instance.base64Arquiv,
    };

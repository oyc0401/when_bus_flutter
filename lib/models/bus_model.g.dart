// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bus_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BusModel _$$_BusModelFromJson(Map<String, dynamic> json) => _$_BusModel(
      id: json['id'] as int,
      departAt: json['departAt'] as String,
      createAt: json['createAt'] as String,
      busId: json['busId'] as int,
      busInterval: json['busInterval'] as int,
      busNum: json['busNum'] as String,
      message: json['message'] as String,
      isFirst: json['isFirst'] as bool,
      isLast: json['isLast'] as bool,
    );

Map<String, dynamic> _$$_BusModelToJson(_$_BusModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'departAt': instance.departAt,
      'createAt': instance.createAt,
      'busId': instance.busId,
      'busInterval': instance.busInterval,
      'busNum': instance.busNum,
      'message': instance.message,
      'isFirst': instance.isFirst,
      'isLast': instance.isLast,
    };

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
    );

Map<String, dynamic> _$$_BusModelToJson(_$_BusModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'departAt': instance.departAt,
      'createAt': instance.createAt,
      'busId': instance.busId,
    };

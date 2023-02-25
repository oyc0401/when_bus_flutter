// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bus_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BusModel _$BusModelFromJson(Map<String, dynamic> json) {
  return _BusModel.fromJson(json);
}

/// @nodoc
mixin _$BusModel {
  int get id => throw _privateConstructorUsedError;
  String get departAt => throw _privateConstructorUsedError;
  String get createAt => throw _privateConstructorUsedError;
  int get busId => throw _privateConstructorUsedError;
  int get busInterval => throw _privateConstructorUsedError;
  String get busNum => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  bool get isFirst => throw _privateConstructorUsedError;
  bool get isLast => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BusModelCopyWith<BusModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusModelCopyWith<$Res> {
  factory $BusModelCopyWith(BusModel value, $Res Function(BusModel) then) =
      _$BusModelCopyWithImpl<$Res, BusModel>;
  @useResult
  $Res call(
      {int id,
      String departAt,
      String createAt,
      int busId,
      int busInterval,
      String busNum,
      String message,
      bool isFirst,
      bool isLast});
}

/// @nodoc
class _$BusModelCopyWithImpl<$Res, $Val extends BusModel>
    implements $BusModelCopyWith<$Res> {
  _$BusModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? departAt = null,
    Object? createAt = null,
    Object? busId = null,
    Object? busInterval = null,
    Object? busNum = null,
    Object? message = null,
    Object? isFirst = null,
    Object? isLast = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      departAt: null == departAt
          ? _value.departAt
          : departAt // ignore: cast_nullable_to_non_nullable
              as String,
      createAt: null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as String,
      busId: null == busId
          ? _value.busId
          : busId // ignore: cast_nullable_to_non_nullable
              as int,
      busInterval: null == busInterval
          ? _value.busInterval
          : busInterval // ignore: cast_nullable_to_non_nullable
              as int,
      busNum: null == busNum
          ? _value.busNum
          : busNum // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      isFirst: null == isFirst
          ? _value.isFirst
          : isFirst // ignore: cast_nullable_to_non_nullable
              as bool,
      isLast: null == isLast
          ? _value.isLast
          : isLast // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BusModelCopyWith<$Res> implements $BusModelCopyWith<$Res> {
  factory _$$_BusModelCopyWith(
          _$_BusModel value, $Res Function(_$_BusModel) then) =
      __$$_BusModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String departAt,
      String createAt,
      int busId,
      int busInterval,
      String busNum,
      String message,
      bool isFirst,
      bool isLast});
}

/// @nodoc
class __$$_BusModelCopyWithImpl<$Res>
    extends _$BusModelCopyWithImpl<$Res, _$_BusModel>
    implements _$$_BusModelCopyWith<$Res> {
  __$$_BusModelCopyWithImpl(
      _$_BusModel _value, $Res Function(_$_BusModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? departAt = null,
    Object? createAt = null,
    Object? busId = null,
    Object? busInterval = null,
    Object? busNum = null,
    Object? message = null,
    Object? isFirst = null,
    Object? isLast = null,
  }) {
    return _then(_$_BusModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      departAt: null == departAt
          ? _value.departAt
          : departAt // ignore: cast_nullable_to_non_nullable
              as String,
      createAt: null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as String,
      busId: null == busId
          ? _value.busId
          : busId // ignore: cast_nullable_to_non_nullable
              as int,
      busInterval: null == busInterval
          ? _value.busInterval
          : busInterval // ignore: cast_nullable_to_non_nullable
              as int,
      busNum: null == busNum
          ? _value.busNum
          : busNum // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      isFirst: null == isFirst
          ? _value.isFirst
          : isFirst // ignore: cast_nullable_to_non_nullable
              as bool,
      isLast: null == isLast
          ? _value.isLast
          : isLast // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BusModel implements _BusModel {
  _$_BusModel(
      {required this.id,
      required this.departAt,
      required this.createAt,
      required this.busId,
      required this.busInterval,
      required this.busNum,
      required this.message,
      required this.isFirst,
      required this.isLast});

  factory _$_BusModel.fromJson(Map<String, dynamic> json) =>
      _$$_BusModelFromJson(json);

  @override
  final int id;
  @override
  final String departAt;
  @override
  final String createAt;
  @override
  final int busId;
  @override
  final int busInterval;
  @override
  final String busNum;
  @override
  final String message;
  @override
  final bool isFirst;
  @override
  final bool isLast;

  @override
  String toString() {
    return 'BusModel(id: $id, departAt: $departAt, createAt: $createAt, busId: $busId, busInterval: $busInterval, busNum: $busNum, message: $message, isFirst: $isFirst, isLast: $isLast)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BusModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.departAt, departAt) ||
                other.departAt == departAt) &&
            (identical(other.createAt, createAt) ||
                other.createAt == createAt) &&
            (identical(other.busId, busId) || other.busId == busId) &&
            (identical(other.busInterval, busInterval) ||
                other.busInterval == busInterval) &&
            (identical(other.busNum, busNum) || other.busNum == busNum) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.isFirst, isFirst) || other.isFirst == isFirst) &&
            (identical(other.isLast, isLast) || other.isLast == isLast));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, departAt, createAt, busId,
      busInterval, busNum, message, isFirst, isLast);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BusModelCopyWith<_$_BusModel> get copyWith =>
      __$$_BusModelCopyWithImpl<_$_BusModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BusModelToJson(
      this,
    );
  }
}

abstract class _BusModel implements BusModel {
  factory _BusModel(
      {required final int id,
      required final String departAt,
      required final String createAt,
      required final int busId,
      required final int busInterval,
      required final String busNum,
      required final String message,
      required final bool isFirst,
      required final bool isLast}) = _$_BusModel;

  factory _BusModel.fromJson(Map<String, dynamic> json) = _$_BusModel.fromJson;

  @override
  int get id;
  @override
  String get departAt;
  @override
  String get createAt;
  @override
  int get busId;
  @override
  int get busInterval;
  @override
  String get busNum;
  @override
  String get message;
  @override
  bool get isFirst;
  @override
  bool get isLast;
  @override
  @JsonKey(ignore: true)
  _$$_BusModelCopyWith<_$_BusModel> get copyWith =>
      throw _privateConstructorUsedError;
}

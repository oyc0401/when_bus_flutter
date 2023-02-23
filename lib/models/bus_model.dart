import 'package:freezed_annotation/freezed_annotation.dart';

part 'bus_model.g.dart';

part 'bus_model.freezed.dart';

// BusModel
// my_favorite_model

// $ flutter pub run build_runner build

@freezed
class BusModel with _$BusModel {
  factory BusModel({
    required int id,
    required String departAt,
    required String createAt,
    required int busId,
  }) = _BusModel;

  factory BusModel.fromJson(Map<String, dynamic> json) =>
      _$BusModelFromJson(json);
}

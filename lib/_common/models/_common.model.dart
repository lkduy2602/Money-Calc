import 'package:json_annotation/json_annotation.dart';
import 'package:money_calc/_common/helpers/time.helper.dart';

abstract class CommonTable {
  static const String createdAt = 'created_at';
  static const String updatedAt = 'updatedAt';
}

abstract class CommonModel {
  @JsonKey(name: CommonTable.createdAt)
  String? createdAt;

  @JsonKey(name: CommonTable.updatedAt)
  String? updatedAt = TimeHelper.now();
}

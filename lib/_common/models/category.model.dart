import 'package:json_annotation/json_annotation.dart';
import 'package:money_calc/_common/helpers/string.helper.dart';
import 'package:money_calc/_common/models/_common.model.dart';

part 'category.model.g.dart';

abstract class CategoryTable {
  static const String tableName = 'categories';
  static const String id = 'id';
  static const String name = 'name';
  static const String normalizedText = 'normalized_text';
}

@JsonSerializable()
class CategoryModel extends CommonModel {
  @JsonKey(name: CategoryTable.id)
  int? id;

  String? _name;
  @JsonKey(name: CategoryTable.name)
  String? get name => _name;
  set name(String? value) {
    _name = value;
    normalizedText = StringHelper.normalized(value!);
  }

  @JsonKey(name: CategoryTable.normalizedText)
  String? normalizedText;

  CategoryModel();

  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() {
    final data = _$CategoryModelToJson(this);
    data.removeWhere((key, value) => value == null);

    return data;
  }
}

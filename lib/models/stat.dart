import 'package:json_annotation/json_annotation.dart';

part 'stat.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Stat {
  Stat(
    this.name,
    this.baseStat,
  );

  String name;
  int baseStat;

  factory Stat.fromJson(Map<String, dynamic> json) => _$StatFromJson(json);

  Map<String, dynamic> toJson() => _$StatToJson(this);

  @override
  String toString() {
    return 'Stat{name: $name, baseStat: $baseStat}';
  }
}

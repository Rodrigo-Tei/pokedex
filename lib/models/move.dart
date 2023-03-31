import 'package:json_annotation/json_annotation.dart';

part 'move.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Move {
  Move(this.name, this.type);

  String name;
  String type;

  factory Move.fromJson(Map<String, dynamic> json) => _$MoveFromJson(json);

  Map<String, dynamic> toJson() => _$MoveToJson(this);

  @override
  String toString() {
    return 'Move{name: $name, type: $type}';
  }
}

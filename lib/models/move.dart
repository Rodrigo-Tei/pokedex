import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex/models/move_details.dart';

part 'move.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Move {
  Move(this.name, this.moveDetails);

  @JsonKey(name: 'move', fromJson: _extractMoveName)
  String name;
  @JsonKey(name: 'version_group_details', fromJson: _extractMoveDetails)
  MoveDetails moveDetails;

  factory Move.fromJson(Map<String, dynamic> json) => _$MoveFromJson(json);

  Map<String, dynamic> toJson() => _$MoveToJson(this);

  @override
  String toString() {
    return '''Move{name: $name, moveDetails: $moveDetails}''';
  }

  static String _extractMoveName(Map<String, dynamic> move) {
    return move['name'];
  }

  static MoveDetails _extractMoveDetails(List list) {
    return MoveDetails.fromJson(list[0]);
  }
}

import 'package:json_annotation/json_annotation.dart';

part 'move_details.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MoveDetails {
  MoveDetails(this.learnedMethod, this.levelLearnedAt);

  @JsonKey(name: 'move_learn_method', fromJson: _extractLearnedMethod)
  String learnedMethod;
  int levelLearnedAt;

  factory MoveDetails.fromJson(Map<String, dynamic> json) =>
      _$MoveDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$MoveDetailsToJson(this);

  @override
  String toString() {
    return '''MoveDetails{learnedMethod: $learnedMethod, levelLearnedAt: $levelLearnedAt}''';
  }

  static String _extractLearnedMethod(Map<String, dynamic> methodObject) {
    return methodObject['name'];
  }
}

import 'dart:convert';

import 'package:tutorial_mobx/src/modules/features/info/domain/entities/information.dart';

class InformationModel extends Information {
  const InformationModel({required super.id, required super.text});

  factory InformationModel.fromEntity(Information entity) {
    return InformationModel(
      id: entity.id,
      text: entity.text,
    );
  }

  factory InformationModel.fromJson(String source) =>
      InformationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory InformationModel.fromMap(Map<String, dynamic> map) =>
      InformationModel(
        id: map['id'],
        text: map['text'],
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'text': text,
      };

  String toJson() => json.encode(toMap());
}

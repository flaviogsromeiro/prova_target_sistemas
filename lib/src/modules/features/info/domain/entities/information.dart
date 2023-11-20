// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Information extends Equatable {
  final String id;
  final String text;

  const Information({
    required this.id,
    required this.text,
  });

  @override
  List<Object> get props => [
        text,
        id,
      ];
}

import 'package:equatable/equatable.dart';

class House extends Equatable {
  final int id;
  final String name;
  final int floorsAmount;

  const House({
    required this.id,
    required this.name,
    required this.floorsAmount,
  });

  House.formJSON(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        floorsAmount = json['floorsAmount'];

  @override
  List<Object?> get props => [id, name, floorsAmount];
}

import 'package:json_annotation/json_annotation.dart';

part 'especialidad.g.dart';

///***************************************************************************
/// Specialties
///***************************************************************************

@JsonSerializable()
class Especialidad {
  final int id;
  final String namEspeci;

  Especialidad({required this.id, required this.namEspeci});

  factory Especialidad.fromJson(Map<String, dynamic> json) => _$EspecialidadFromJson(json);

  Map<String, dynamic> toJson() => _$EspecialidadToJson(this);
}

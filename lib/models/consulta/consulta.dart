
import 'package:json_annotation/json_annotation.dart';

part 'consulta.g.dart';
///***************************************************************************
/// Consulta
///***************************************************************************

@JsonSerializable()
class Consulta {
  final int idConsulta;
  final String nombreConsulta;

  Consulta({required this.idConsulta, required this.nombreConsulta});

  factory Consulta.fromJson(Map<String, dynamic> json) => _$ConsultaFromJson(json);

  Map<String, dynamic> toJson() => _$ConsultaToJson(this);
}

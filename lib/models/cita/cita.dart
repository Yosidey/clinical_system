import 'package:json_annotation/json_annotation.dart';

part 'cita.g.dart';

///***************************************************************************
/// Cita
///***************************************************************************

@JsonSerializable()
class Cita {
  final String cita;

  Cita({required this.cita});

  factory Cita.fromJson(Map<String, dynamic> json) => _$CitaFromJson(json);

  Map<String, dynamic> toJson() => _$CitaToJson(this);
}

///***************************************************************************
/// Cita
///***************************************************************************

@JsonSerializable()
class CitaData {
  final String idepacien;
  final String fechaAgenda;
  final String horaAgenda;
  final String tipsoli;
  final String tipCons;
  final String codprom;
  final String codEspe;

  CitaData({
    required this.idepacien,
    required this.fechaAgenda,
    required this.horaAgenda,
    required this.tipsoli,
    required this.tipCons,
    required this.codprom,
    required this.codEspe,
  });

  factory CitaData.fromJson(Map<String, dynamic> json) => _$CitaDataFromJson(json);

  Map<String, dynamic> toJson() => _$CitaDataToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'fecha.g.dart';

///***************************************************************************
/// Fecha
///***************************************************************************

@JsonSerializable()
class Fecha {
  final String fechas_Disp;

  Fecha({required this.fechas_Disp});

  factory Fecha.fromJson(Map<String, dynamic> json) => _$FechaFromJson(json);

  Map<String, dynamic> toJson() => _$FechaToJson(this);
}

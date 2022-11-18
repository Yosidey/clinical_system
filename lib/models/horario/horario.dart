import 'package:json_annotation/json_annotation.dart';
part 'horario.g.dart';
///***************************************************************************
/// Horario
///***************************************************************************
@JsonSerializable()
class Horario {
  final String fecha_disp;
  final String hora_inicio;
  final String hora_final;
  final String vis_hora;

  Horario({
    required this.fecha_disp,
    required this.hora_inicio,
    required this.hora_final,
    required this.vis_hora,
  });

  factory Horario.fromJson(Map<String, dynamic> json) => _$HorarioFromJson(json);

  Map<String, dynamic> toJson() => _$HorarioToJson(this);
}

///***************************************************************************
/// Hora
///***************************************************************************
@JsonSerializable()
class Hora {
  final String idemedico;
  final String fecha;

  Hora({
    required this.idemedico,
    required this.fecha,

  });

  factory Hora.fromJson(Map<String, dynamic> json) => _$HoraFromJson(json);

  Map<String, dynamic> toJson() => _$HoraToJson(this);
}

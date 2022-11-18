part of'horario.dart';


///Horario
Horario _$HorarioFromJson(Map<String, dynamic> json) => Horario(
  fecha_disp: json['fecha_disp'] as String,
  hora_inicio: json['hora_inicio'] as String,
  hora_final: json['hora_final'] as String,
  vis_hora: json['vis_hora'] as String,
);

Map<String, dynamic> _$HorarioToJson(Horario instance) => <String, dynamic>{
  'fecha_disp': instance.fecha_disp,
  'hora_inicio': instance.hora_inicio,
  'hora_final': instance.hora_final,
  'vis_hora': instance.vis_hora,
};

///Hora
Hora _$HoraFromJson(Map<String, dynamic> json) => Hora(
  idemedico: json['idemedico'] as String,
  fecha: json['fecha'] as String,

);

Map<String, dynamic> _$HoraToJson(Hora instance) => <String, dynamic>{
  'idemedico': instance.idemedico,
  'fecha': instance.fecha,
};
part of 'cita.dart';

///Cita
Cita _$CitaFromJson(Map<String, dynamic> json) => Cita(
      cita: json['cita'] as String,
    );

Map<String, dynamic> _$CitaToJson(Cita instance) => <String, dynamic>{
      'cita': instance.cita,
    };

///CitaData
CitaData _$CitaDataFromJson(Map<String, dynamic> json) => CitaData(
  idepacien: json['idepacien'] as String,
  fechaAgenda: json['fechaAgenda'] as String,
  horaAgenda: json['horaAgenda'] as String,
  tipsoli: json['tipsoli'] as String,
  tipCons: json['tipCons'] as String,
  codprom: json['codprom'] as String,
  codEspe: json['idepacien'] as String,
);

Map<String, dynamic> _$CitaDataToJson(CitaData instance) => <String, dynamic>{
  'idepacien': instance.idepacien,
  'fechaAgenda': instance.fechaAgenda,
  'horaAgenda': instance.horaAgenda,
  'tipsoli': instance.tipsoli,
  'tipCons': instance.tipCons,
  'codprom': instance.codprom,
  'codEspe': instance.codEspe,
};

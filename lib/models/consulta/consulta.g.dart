part of 'consulta.dart';

///Consulta
Consulta _$ConsultaFromJson(Map<String, dynamic> json) => Consulta(
      idConsulta: json['idConsulta'] as int,
      nombreConsulta: json['nombreConsulta'] as String,
    );

Map<String, dynamic> _$ConsultaToJson(Consulta instance) => <String, dynamic>{
      'idConsulta': instance.idConsulta,
      'nombreConsulta': instance.nombreConsulta,
    };

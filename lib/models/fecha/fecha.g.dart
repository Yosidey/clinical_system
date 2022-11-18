part of 'fecha.dart';

///Fecha
Fecha _$FechaFromJson(Map<String, dynamic> json) => Fecha(
      fechas_Disp: json['fechas_Disp'] as String,
    );

Map<String, dynamic> _$FechaToJson(Fecha instance) => <String, dynamic>{
      'fechas_Disp': instance.fechas_Disp,
    };

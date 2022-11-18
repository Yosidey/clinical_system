part of 'doctor.dart';

///Doctor
Doctor _$DoctorFromJson(Map<String, dynamic> json) => Doctor(
  idMedico: json['idMedico'] as int,
  nomDoctor: json['nomDoctor'] as String,
);

Map<String, dynamic> _$DoctorToJson(Doctor instance) => <String, dynamic>{
  'correo': instance.idMedico,
  'nomDoctor': instance.nomDoctor,
};
part of 'especialidad.dart';

///Specialties
Especialidad _$EspecialidadFromJson(Map<String, dynamic> json) => Especialidad(
  id: json['id'] as int,
  namEspeci: json['namEspeci'] as String,
);

Map<String, dynamic> _$EspecialidadToJson(Especialidad instance) => <String, dynamic>{
  'id': instance.id,
  'namEspeci': instance.namEspeci,
};

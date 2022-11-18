
import 'package:json_annotation/json_annotation.dart';

part 'doctor.g.dart';
///***************************************************************************
/// Doctor
///***************************************************************************

@JsonSerializable()
class Doctor {
  final int idMedico;
  final String nomDoctor;

  Doctor({required this.idMedico, required this.nomDoctor});

  factory Doctor.fromJson(Map<String, dynamic> json) => _$DoctorFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorToJson(this);
}

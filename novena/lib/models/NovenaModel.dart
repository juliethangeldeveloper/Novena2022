 //"Novena": "Story about novena"


 import 'package:novena/models/VillancicosModel.dart';

class NovenaModel {

  final String novena;

  NovenaModel(this.novena);

  factory NovenaModel.fromJson(Map<String, dynamic> json) =>
      _$NovenaModelFromJson(json);

}

// **************************************************************************
// JsonSerializable
// **************************************************************************

 _$NovenaModelFromJson(Map<String, dynamic> json) => NovenaModel(
      json['Novena'] as String,
    );
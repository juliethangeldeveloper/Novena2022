/*
    "chorus": "Coro",
    "prayers": "Oraciones",
    "carols": "Villancicos",
    "remaining": "Faltan",
    "days": "dias",
    "days_for_novena": "para la \nNovena de \nAguinaldos",
    "video_of_villancico": "Video al villancico",
    "december": "Diciembre",
    "monday": "Lunes",
    "tuesday": "Martes",
    "wednesday": "Miercoles",
    "thursday": "Jueves",
    "friday": "Viernes",
    "saturday": "Sabado",
    "sunday": "Domingo"
*/

class TranslateTextModel {
  final String coro;
  final String oraciones;
  final String villancicos;
  final String faltan;
  final String dias;
  final String para_la_novena_de_aguinaldos;
  final String video_al_villancico;
  final String diciembre;
  final String lunes;
  final String martes;
  final String miercoles;
  final String jueves;
  final String viernes;
  final String sabado;
  final String domingo;

  TranslateTextModel(
    this.coro, 
    this.oraciones, 
    this.villancicos, 
    this.faltan, 
    this.dias, 
    this.para_la_novena_de_aguinaldos, 
    this.video_al_villancico, 
    this.diciembre, 
    this.lunes,
    this.martes, 
    this.miercoles,
    this.jueves, 
    this.viernes,
    this.sabado, 
    this.domingo);

  factory TranslateTextModel.fromJson(Map<String, dynamic> json) =>
      _$TranslateTextModelFromJson(json);

}

// **************************************************************************
// JsonSerializable
// **************************************************************************

 _$TranslateTextModelFromJson(Map<String, dynamic> json) => TranslateTextModel(
      json['chorus'] as String,
      json['prayers'] as String,
      json['carols'] as String,
      json['remaining'] as String,
      json['days'] as String,
      json['days_for_novena'] as String,
      json['video_of_villancico'] as String,
      json['december'] as String,
      json['monday'] as String,
      json['tuesday'] as String,
      json['wednesday'] as String,
      json['thursday'] as String,
      json['friday'] as String,
      json['saturday'] as String,
      json['sunday'] as String,
    );


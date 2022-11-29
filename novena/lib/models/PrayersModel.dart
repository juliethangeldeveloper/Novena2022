//"prayers": {
//    "id": 1,
//    "title": "Dia Uno",
//    "prayer": "Benignísimo Dios de infinita caridad.....",
//    "chorus": "Ven ven ven ven a nuestras almas....",
//    "pray": "Se reza tres veces el Gloria al Padre"
//  },

import 'dart:convert';

import 'package:flutter/services.dart';

class PrayersModel {
  final int id;
  final String title;
  final String prayer;
  final String chorus;
  final String pray;
  PrayersModel(this.id, this.title, this.prayer, this.chorus, this.pray);

  factory PrayersModel.fromJson(Map<String, dynamic> json) =>
      _$PrayersModelFromJson(json);
@override
    String toString() {
        return "id # $id, Title = $title, \nPrayer = $prayer, \nchorus = $chorus, \nPray = $pray";
    }
}


// **************************************************************************
// JsonSerializable
// **************************************************************************

 _$PrayersModelFromJson(Map<String, dynamic> json) => PrayersModel(
      json['id'] as int,
      json['title'] as String,
      json['prayer'] as String,
      json['chorus'] ?? "None",
      json['pray'] ?? "None",
    );


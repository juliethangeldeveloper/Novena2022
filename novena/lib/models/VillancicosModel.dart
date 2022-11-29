//"prayers": {
//    "id": 1,
//    "title": "Dia Uno",
//    "link": "Campana Sobre Campana",
//    "song": "Campana Sobre Campana y sobre ca...."
//  },
import 'dart:convert';

import 'package:flutter/services.dart';

class VillancicosModel {
  final int id;
  final String title;
  final String link;
  final String song;

  VillancicosModel(this.id, this.title, this.link, this.song);

  factory VillancicosModel.fromJson(Map<String, dynamic> json) =>
      _$VillancicosModelFromJson(json);
@override
    String toString() {
        return "id # $id, Title = $title, \nlink = $link, \nsong = $song";
    }
}


// **************************************************************************
// JsonSerializable
// **************************************************************************

 _$VillancicosModelFromJson(Map<String, dynamic> json) => VillancicosModel(
      json['id'] as int,
      json['title'] as String,
      json['link'] as String,
      json['song'] as String,
    );


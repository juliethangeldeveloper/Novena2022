 class PrayersModel {

  final String novena;
  final List<PrayersModel> prayers;

  PrayersModel(this.novena, this.prayers);

  factory PrayersModel.fromJson(Map<String, dynamic> json) =>
      _$PrayersModelFromJson(json);

}

// **************************************************************************
// JsonSerializable
// **************************************************************************

 _$PrayersModelFromJson(Map<String, dynamic> json) => PrayersModel(
 
      json['title'] as String,
      json['prayers'] ,
    );
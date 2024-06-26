import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:novena/homeScreen.dart';
import 'package:novena/models/PrayersModel.dart';
import 'package:novena/models/VillancicosModel.dart';

void main() {
  runApp(const MyApp());
}

List<PrayersModel> prayersForNovena = [];
List<PrayersModel> prayersForNovenaDay = [];
List<VillancicosModel> villancicosList = [];

int numberOfDates = 0;
bool dayOfNovena = false;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/novena.json');
    final data = await json.decode(response);
    var listPrayers = data['prayers'] as List;
    var prayersNovena =
        listPrayers.map((tagJson) => PrayersModel.fromJson(tagJson)).toList();
    var listdayPrayers = data['Daily'] as List;
    var listdailyPrayers = listdayPrayers
        .map((tagJson) => PrayersModel.fromJson(tagJson))
        .toList();
    var villancicos = data['Villancicos'] as List;
    villancicosList = villancicos
        .map((tagJson) => VillancicosModel.fromJson(tagJson))
        .toList();
    prayersForNovena = prayersNovena + listdailyPrayers;
    prayersForNovenaDay = prayersNovena;
  }

  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  void currentDateDays() {
    DateTime now = DateTime.now();

    //checks the year and sets date of novena starts Dec 16
    final novenaDayStarts = DateTime(now.year, 12, 16);

    //check navidad date of year
    final navidadAfter = DateTime(now.year, 12, 25);
    final novenaAfterYear = DateTime(now.year + 1, 12, 16);

    // check number of dates until novena
    int numberDatesUntil = daysBetween(now, novenaDayStarts);
    int numberDatesAfterYear = daysBetween(now, novenaAfterYear);

    if (now.isAtSameMomentAs(novenaDayStarts) || now.isAfter(novenaDayStarts) && navidadAfter.isAfter(now)) {
      numberOfDates = numberDatesUntil.abs()+1;
      for (var i = 0; i < prayersForNovena.length; i++) {
        if (prayersForNovena[i].id == numberOfDates) {
          prayersForNovenaDay.insert(1, prayersForNovena[i]);
        }
      }
      dayOfNovena = true;
    } else if (novenaDayStarts.isBefore(now)) {
      numberOfDates = numberDatesAfterYear;
      dayOfNovena = false;
    } else {
      numberOfDates = numberDatesUntil;
      dayOfNovena = false;
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          dividerColor: Colors.transparent,
        ),
        home: FutureBuilder(
            future: readJson(),
            builder: (context, snapshot) {
                  currentDateDays();
              if (prayersForNovena.isNotEmpty) {
                return HomeScreen(dayOfNovena, numberOfDates, prayersForNovena,
                    prayersForNovenaDay, villancicosList, 1);
              } else {
                return Container( color: Color.fromARGB(255, 23, 61, 88),
                  child: const Center(
                    child: CircularProgressIndicator()),
                );
              }
            }));
  }
}

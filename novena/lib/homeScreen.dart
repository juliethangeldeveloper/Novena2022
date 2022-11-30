import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:novena/models/VillancicosModel.dart';
import 'package:novena/pages/NovenaScreen.dart';
import 'package:novena/models/PrayersModel.dart';
import 'package:novena/pages/VillancicoScreen.dart';
import 'package:novena/pages/beforeNovenaPage.dart';
import 'package:novena/pages/PrayerScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  int dateDays = 0;
  int _selectedIndex = 1;
  late List<PrayersModel> prayersForNovena = [];
  late List<PrayersModel> prayersForNovenaDay = [];
  late List<VillancicosModel> villancicosList = [];

  double fontSize = 15;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  late Widget nextPage;
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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  int daysBetween(DateTime from, DateTime to) {
    //compare dates
//     String YYYY_MM_DD = from.toIso8601String().split('T').first;
// print(villancicosList.length);
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
     print("Dates compared $from to date $to");
    return (to.difference(from).inHours / 24).round();
  }

  Widget currentDateDays() {
    //checks today date to caompare
    DateTime now = new DateTime.now();


    //checks the year and sets date of novena starts Dec 16
    final novenaDayStarts = DateTime(now.year, 12, 16);
    final novenaDaybefore= DateTime(now.year, 12, 15);

    //check navidad date of year
    final navidad = DateTime(now.year, 12, 24);
        final navidadAfter = DateTime(now.year, 12, 25);

    final novenaAfterYear = DateTime(now.year + 1, 12, 16);

    // check number of dates until novena
    int numberDatesUntil = daysBetween(now, novenaDayStarts);

    int numberDatesAfter = daysBetween(now, navidad);
    int numberDatesAfterYear = daysBetween(now, novenaAfterYear);
    int numberOfDates = 0;

    if (now.isAfter(novenaDaybefore) && navidadAfter.isAfter(now)) {
      numberOfDates = numberDatesUntil.abs()+1;
      print("Days Novena");
      for (var i = 0; i < prayersForNovena.length; i++) {
        if (prayersForNovena[i].id == numberOfDates) {
          prayersForNovenaDay.insert(1, prayersForNovena[i]);
        }
      }

      return PrayerScreen(prayersForNovenaDay, fontSize - 15);
    } else if (novenaDayStarts.isBefore(now)) {
      numberOfDates = numberDatesAfterYear;
      print("Days same year after Navidad");
      return BeforeNovenaScreen(numberOfDates, fontSize - 15);
    } else {
      numberOfDates = numberDatesUntil;
      print("Days before Navidad");
      return BeforeNovenaScreen(numberOfDates, fontSize - 15);
    }
  }

  @override
  Widget build(BuildContext context) {
    readJson();
    List<Widget> widgetOptions = <Widget>[
      NovenaScreen(prayersForNovena, fontSize - 15),
      currentDateDays(),
      VillancicoSceen(villancicosList, fontSize - 15)
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 23, 61, 88),
        title: const Text('Novena'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 23, 61, 88),
        onPressed: () {
          if (fontSize == 15) {
            fontSize = 18;
          } else if (fontSize == 18) {
            fontSize = 22;
          } else if (fontSize == 22) {
            fontSize = 15;
          }
          setState(() {});
        },
        child: Text(
          "Aa",
          style: TextStyle(fontSize: fontSize),
        ),
      ),
      body: Center(
        child: widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 23, 61, 88),
        selectedLabelStyle: TextStyle(
          fontSize: fontSize,
          fontFamily: 'Futura',
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: fontSize,
          fontFamily: 'Futura',
        ),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(
              const AssetImage("assets/AngelIcon.png"),
              size: fontSize + 6,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            label: 'Oraciones',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              const AssetImage("assets/NovenaIcon.png"),
              size: fontSize + 6,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            label: 'Novena',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              const AssetImage("assets/VillancioIcon.png"),
              size: fontSize + 6,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            label: 'Villancicos',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.white,
        selectedItemColor: const Color.fromARGB(255, 172, 80, 68),
        onTap: _onItemTapped,
      ),
    );
  }
}

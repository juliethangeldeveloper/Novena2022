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
  HomeScreen(this.dayOfNovena, this.numberOfDates, this.prayersForNovena,
      this.prayersForNovenaDay, this.villancicosList, this.startTab,
      {Key? key})
      : super(key: key);
  int numberOfDates = 0;
  List<PrayersModel> prayersForNovena = [];
  List<PrayersModel> prayersForNovenaDay = [];
  List<VillancicosModel> villancicosList = [];
  bool dayOfNovena;
  int startTab;
  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  int dateDays = 0;
  int _selectedIndex = 0;
  double fontSize = 15;
  late Widget nextPage;
  String oraciones = "Oraciones";
  String novena = "Novena";
  String villancicos = "Villancicos";
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    _selectedIndex = widget.startTab;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetOptions = <Widget>[
      NovenaScreen(widget.prayersForNovena, fontSize - 15),
      widget.dayOfNovena
          ? PrayerScreen(widget.prayersForNovenaDay, fontSize - 15)
          : BeforeNovenaScreen(widget.numberOfDates, fontSize - 15),
      VillancicoSceen(widget.villancicosList, fontSize - 15)
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
            label: oraciones,
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              const AssetImage("assets/NovenaIcon.png"),
              size: fontSize + 6,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            label: novena,
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              const AssetImage("assets/VillancioIcon.png"),
              size: fontSize + 6,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            label: villancicos,
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

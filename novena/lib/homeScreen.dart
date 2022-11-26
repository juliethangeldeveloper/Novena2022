import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:novena/NovenaSceen.dart';
import 'package:novena/OracionesPage.dart';
import 'package:novena/PrayersModel.dart';
import 'package:novena/VillancicoScreen.dart';
import 'package:novena/beforeNovena.dart';
import 'package:novena/beforeNovenaPage.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
 int dateDays =  0;
  int _selectedIndex = 1;
  late List<PrayersModel> prayersForNovena = [];
  double fontSize = 15;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  late Widget nextPage;
Future<void> readJson() async {
final String response = await rootBundle.loadString('assets/novena.json');
final data = await json.decode(response);
  var listPrayers = data['prayers'] as List;
    var prayersNovena = listPrayers.map((tagJson) => PrayersModel.fromJson(tagJson)).toList();
  var listdayPrayers = data['Daily'] as List;
    var listdailyPrayers = listdayPrayers.map((tagJson) => PrayersModel.fromJson(tagJson)).toList();
    prayersForNovena = prayersNovena + listdailyPrayers;
}

   

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

    int daysBetween(DateTime from, DateTime to) {
     from = DateTime(from.year, from.month, from.day);
     to = DateTime(to.year, to.month, to.day);
   return (to.difference(from).inHours / 24).round();
  }

  Widget currentDateDays(){
  DateTime now = new DateTime.now();
  final novenaDayStarts = DateTime(now.year, 12, 16);
  final navidad = DateTime(now.year, 12, 24);


   int numberdates = daysBetween(now, novenaDayStarts);

     if(numberdates >= 0 ){
      return BeforeNovenaScreen(numberdates);
    } else{
      return beforeNovena();
    }
  }

  @override
  Widget build(BuildContext context) {
    readJson();
    List<Widget> _widgetOptions = <Widget>[
   NovenaScreen(prayersForNovena, fontSize - 15),
   currentDateDays(),
   VillancicoSceen()
  ];
  
    return Scaffold(
      appBar: AppBar( 
        backgroundColor: 
        Color.fromARGB(255, 23, 61, 88),
        title: const Text('Novena'),
      ), floatingActionButton:
      FloatingActionButton( child: Text("Aa", style: TextStyle(fontSize: fontSize),),     
        backgroundColor: Color.fromARGB(255, 23, 61, 88), 
        onPressed: () {
          if(fontSize == 15){
            fontSize = 20;
          }else if(fontSize == 20){
            fontSize = 25;
          }else if(fontSize == 25){
            fontSize = 15;
          }
          setState(() {
          });
        },),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 23, 61, 88),  
        selectedLabelStyle: TextStyle(fontSize: fontSize), 
        unselectedLabelStyle: TextStyle(fontSize: fontSize),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/AngelIcon.png"),
             color: Color.fromARGB(255, 255, 255, 255),
              ),
            label: 'Oraciones',
          ),
          BottomNavigationBarItem( 
            icon:ImageIcon(
            AssetImage("assets/NovenaIcon.png"),
             color: Color.fromARGB(255, 255, 255, 255),
            ), 
            label: 'Novena', 
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
            AssetImage("assets/VillancioIcon.png"),
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

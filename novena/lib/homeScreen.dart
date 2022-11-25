import 'package:flutter/material.dart';
import 'package:novena/NovenaPagexd.dart';
import 'package:novena/beforeNovena.dart';
import 'package:novena/beforeNovenaPage.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
 int dateDays =  0;
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  late Widget nextPage;

   List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
   beforeNovena(),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

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

  void currentDateDays(){
  DateTime now = new DateTime.now();
       final crhistmas = DateTime(now.year, 12,16);

   int numberdates = daysBetween(now, crhistmas);
    print(numberdates<0);
    print("<");
     if(numberdates >= 0 ){
      _widgetOptions.removeAt(1);
      _widgetOptions.insert(1,  BeforeNovenaScreen());
    } else{
            _widgetOptions.removeAt(1);
      _widgetOptions.insert(1,  beforeNovena());
    }
  }

  @override
  Widget build(BuildContext context) {
  currentDateDays();
    return Scaffold(
      appBar: AppBar( 
        backgroundColor: 
        Color.fromARGB(255, 23, 61, 88),
        title: const Text('Novena'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 23, 61, 88),
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

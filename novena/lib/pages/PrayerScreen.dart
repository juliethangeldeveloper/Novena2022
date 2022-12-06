import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:novena/models/PrayersModel.dart';

class PrayerScreen extends StatefulWidget {
  final List<PrayersModel> prayersOfTheDay;
  final double fontSize;
  const PrayerScreen(this.prayersOfTheDay, this.fontSize,{Key? key})
      : super(key: key);

  @override
  State<PrayerScreen> createState() => _PrayerScreenState();
}

class _PrayerScreenState extends State<PrayerScreen> {
  late ScrollController _scrollController;
  String currentDate = "";
  List<PrayersModel> novenasCurrent = [];
  String coro = "Coro";

  @override
  void initState() {
    if(widget.prayersOfTheDay.length > 5){
        novenasCurrent = widget.prayersOfTheDay.sublist(0,6);
    }
  String currentDateWeek = DateFormat("EEEE").format(DateTime.now()); 
  String currentDateMonth = DateFormat("MMMM").format(DateTime.now()); 
  String currentDateDay= DateFormat("d").format(DateTime.now()); 

   switch (currentDateWeek){
    case "Sunday":
    currentDateWeek = "Domingo";
    break;
    case "Saturday":
        currentDateWeek = "Sábado";
    break; 
    case "Monday":
        currentDateWeek = "Lunes";
    break;
    case "Tuesday":
        currentDateWeek = "Martes";
    break;
    case "Wednesday":
        currentDateWeek = "Miércoles";
    break;
    case "Thursday":
        currentDateWeek = "Jueves";
    break;
    case "Friday":
        currentDateWeek = "Viernes";
    break;
    default:
    break;
   }
   if(currentDateMonth == "December"){
    currentDateMonth = "Diciembre";
   }

   currentDate = currentDateWeek+ ", " + currentDateMonth + " " + currentDateDay;
    super.initState();
    _scrollController = ScrollController();
  }

  List<AssetImage> photos = [
    const AssetImage("assets/christmasPhoto.png"),
    const AssetImage("assets/pesebre3Image.jpg"),
    const AssetImage("assets/virgenImage.jpg"),
    const AssetImage("assets/sanJoseImageOrig.jpg"),
    const AssetImage("assets/candles2Image.jpg"),
    const AssetImage("assets/pesebreImageCenter.jpg"),
    const AssetImage("assets/pesebreNavidad.jpg"),
  ];

  List<AssetImage> photos2 = [
    const AssetImage("assets/christmasPhoto.png"),
    const AssetImage("assets/pesebre3Image.jpg"),
    const AssetImage("assets/candles2Image.jpg"),
    const AssetImage("assets/pesebreImageCenter.jpg"),
    const AssetImage("assets/pesebreNavidad.jpg"),
    const AssetImage("assets/candlesImage.jpg"),
  ];

  Widget hasChorus(int index) {
    if (widget.prayersOfTheDay[index].chorus != "None") {
      return Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: Text(coro,
                style: TextStyle(
                  fontSize: 20 + widget.fontSize,
                  color: const Color.fromARGB(255, 0, 0, 0),
                )),
            alignment: Alignment.centerLeft,
          ),
          Text(
            novenasCurrent[index].chorus,
            style: TextStyle(
              fontSize: 15 + widget.fontSize,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ],
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      controller: _scrollController,
      itemBuilder: (BuildContext context, int index) {
        return Column(children: <Widget>[
          index == 0 ? Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(right: 20, left: 20, top: 20),
            child: Text( currentDate + "\n" +
              novenasCurrent[1].title,textAlign: TextAlign.center,
              style: TextStyle( 
                fontSize: 25 + widget.fontSize,
                fontFamily: 'Apple Chancery',
                color: Color(0xff509a79),
              ),
            ),
          ) : Container(),
          SizedBox(
            height: 160,
            child: Image(
              image: index == 1 ? photos2[Random().nextInt(photos2.length)] : photos[index],
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(right: 20, left: 20, top: 20),
            child: Text(
              novenasCurrent[index].title,
              style: TextStyle(
                fontSize: 25 + widget.fontSize,
                fontFamily: 'Apple Chancery',
                color: Color(0xff509a79),
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.only(right: 20, left: 20),
              child: hasChorus(index)),
          Container(
            padding: EdgeInsets.only(right: 20, left: 20, bottom: 10),
            child: Text(
              novenasCurrent[index].prayer,
              style: TextStyle(
                height: 2.0,
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 18 + widget.fontSize,
              ),
            ),
          ),
          novenasCurrent[index].pray != "None" ? 
          Container(
            padding: EdgeInsets.only(right: 20, left: 20, bottom: 10),
            child: Text(
              novenasCurrent[index].pray,
              style: TextStyle(
                height: 2.0,
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 18 + widget.fontSize,
              ),
            ),
          ): Container(),
        ]);
      },
      itemCount: novenasCurrent.length,
    );
  }
}

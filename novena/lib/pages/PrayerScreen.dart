import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:novena/models/PrayersModel.dart';

class PrayerScreen extends StatefulWidget {
  final List<PrayersModel> prayersOfTheDay;
  final double fontSize;
  const PrayerScreen(this.prayersOfTheDay, this.fontSize, {Key? key})
      : super(key: key);

  @override
  State<PrayerScreen> createState() => _PrayerScreenState();
}

class _PrayerScreenState extends State<PrayerScreen> {
  late ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  List<AssetImage> photos = [
    AssetImage("assets/christmasPhoto.png"),
    AssetImage("assets/virgenImage.jpg"),
    AssetImage("assets/sanJoseImageOrig.jpg"),
    AssetImage("assets/candles2Image.jpg"),
    AssetImage("assets/pesebreImageCenter.jpg"),
    AssetImage("assets/pesebreNavidad.jpg"),
    AssetImage("assets/candlesImage.jpg"),
    AssetImage("assets/pesebreImage1.jpg"),
    AssetImage("assets/pesebre3Image.jpg"),
    AssetImage("assets/navidadImage.jpg"),
    AssetImage("assets/candles2Image.jpg"),
    AssetImage("assets/pesebreImage3.jpg"),
    AssetImage("assets/pesebreImage2.jpg"),
    AssetImage("assets/christmasPhoto.png"),
  ];

  Widget hasChorus(int index) {
    if (widget.prayersOfTheDay[index].chorus != "None") {
      return Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: Text("Coro",
                style: TextStyle(
                  fontSize: 20 + widget.fontSize,
                  color: const Color.fromARGB(255, 0, 0, 0),
                )),
            alignment: Alignment.centerLeft,
          ),
          Text(
            widget.prayersOfTheDay[index].chorus,
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
      controller: _scrollController,
      itemBuilder: (BuildContext context, int index) {
        return Column(children: <Widget>[
          SizedBox(
            height: 160,
            child: Image(
              image: photos[index],
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(right: 20, left: 20, top: 20),
            child: Text(
              widget.prayersOfTheDay[index].title,
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
              widget.prayersOfTheDay[index].prayer,
              style: TextStyle(
                height: 2.0,
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 18 + widget.fontSize,
              ),
            ),
          ),
        ]);
      },
      itemCount: widget.prayersOfTheDay.length,
    );
  }
}

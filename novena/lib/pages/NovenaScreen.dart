import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:novena/main.dart';
import 'package:novena/models/PrayersModel.dart';

class NovenaScreen extends StatefulWidget {
  final List<PrayersModel> prayers;
  final double fontSize;
  const NovenaScreen(this.prayers, this.fontSize, {Key? key}) : super(key: key);

  @override
  State<NovenaScreen> createState() => _NovenaScreen();
}

class _NovenaScreen extends State<NovenaScreen> with WidgetsBindingObserver{
  var buttonVissbible = false;
  late ScrollController _scrollController;
  String coro = "Coro";


  @override
  void initState() {
    super.initState();
     _scrollController = ScrollController();
     WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
  WidgetsBinding.instance.removeObserver(this);
  super.dispose();
}

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
         Navigator.pushReplacement(
    context, 
    PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => const MyApp(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
    ),
);        
        break;
      case AppLifecycleState.inactive:
        print("app is in inactive state");
        break;
      case AppLifecycleState.paused:
        print("app is in paused state");
        break;
      case AppLifecycleState.detached:
        print("app has been removed");
        break;
    }
}
  

  Widget hasChorus(int index) {
    if (widget.prayers[index].chorus != "None") {
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
            widget.prayers[index].chorus,
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

  Widget hasPrayers(int index) {
    if (widget.prayers[index].pray != "None") {
      return Text(
        ("(${widget.prayers[index].pray})"),
        style: TextStyle(
          fontSize: 15 + widget.fontSize,
          color: Colors.black
        ),
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
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
    return Stack(
      children: [
        ListView.builder(
          controller: _scrollController,
          itemBuilder: (BuildContext context, int index) {
            return Column(children: <Widget>[
              ExpansionTile(
                collapsedIconColor: Color.fromARGB(255, 23, 61, 88),
                onExpansionChanged: (value) {
                  setState(() {
                    buttonVissbible = value;
                  });
                },
                title: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(right: 30, left: 30),
                  child: Text(
                    widget.prayers[index].title,
                    style: TextStyle(
                      fontSize: 25 + widget.fontSize,
                      fontFamily: 'Futura',
                      color: Color(0xff509a79),
                    ),
                  ),
                ),
                children: <Widget>[
                  SizedBox(
                    height: 160,
                    child: Image(
                      image: photos[index],
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.only(right: 55, left: 55),
                      child: hasChorus(index)),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding:
                        const EdgeInsets.only(right: 55, left: 55, bottom: 10),
                    child: Text(
                      widget.prayers[index].prayer,
                      style: TextStyle(
                        height: 2.0,
                        color: Colors.black,
                        fontSize: 18 + widget.fontSize,
                      ),
                    ),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.only(right: 55, left: 55),
                      child: hasPrayers(index)),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Divider(
                  color: Color.fromARGB(18, 23, 61, 88),
                  thickness: 1,
                  height: 0,
                ),
              ),
            ]);
          },
          itemCount: widget.prayers.length,
        ),
        Visibility(
          visible: buttonVissbible,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 23, 61, 88),
                    child: IconButton(
                      onPressed: () {
                        _scrollController.animateTo(
                          _scrollController.position.minScrollExtent,
                          duration: const Duration(seconds: 2),
                          curve: Curves.fastOutSlowIn,
                        );
                      },
                      icon: const Icon(Icons.arrow_upward),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

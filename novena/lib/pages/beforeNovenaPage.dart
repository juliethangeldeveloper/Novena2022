import 'package:flutter/material.dart';
import 'package:novena/main.dart';

class BeforeNovenaScreen extends StatefulWidget {
  final int days;
  final double fontSize;

  const BeforeNovenaScreen(this.days, this.fontSize, {Key? key})
      : super(key: key);
  @override
  State<BeforeNovenaScreen> createState() => _BeforeNovenaScreenState();
}

class _BeforeNovenaScreenState extends State<BeforeNovenaScreen> with WidgetsBindingObserver{
  String faltanText = "Faltan";
  String diasText = "dias";
  String novenaText = "para la \nNovena de \nAguinaldos";
  String dateDays = "0";


  @override
  void initState() {
    super.initState();
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
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.detached:
        break;
    }
}
   
  @override
  Widget build(BuildContext context) {
      var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Stack(
      children: [
        Container(color :Color.fromRGBO(0, 0, 0, 1),
          child: Image(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            image: const AssetImage("assets/christmasPhoto.png"),
            fit: BoxFit.fitWidth,
          ),
        ),
        Container(
          color: const Color.fromRGBO(255, 255, 255, 0.9),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        faltanText,
                        style: TextStyle(
                          fontFamily: 'Apple Chancery',
                          fontSize: 40 + widget.fontSize,
                          color: Color(0xff509a79),
                        ),
                        softWrap: false,
                      ),
                      Container(
                        padding: const EdgeInsets.only(right:10, left: 10),
                        child: Text(
                          widget.days.toString(),
                          style: TextStyle(
                            fontFamily: 'Apple Chancery',
                            fontSize: 55 + widget.fontSize,
                            color: Color(0xff69130c),
                          ),
                          softWrap: false,
                        ),
                      ),
                      Text(
                        diasText,
                        style: TextStyle(
                          fontFamily: 'Apple Chancery',
                          fontSize: 40 + widget.fontSize,
                          color: Color(0xff509a79),
                        ),
                        softWrap: false,
                      ),
                    ],
                  ),
                  Text(
                    novenaText,
                    style: TextStyle(
                      fontFamily: 'Apple Chancery',
                      fontSize: 40 + widget.fontSize,
                      color: Color(0xff4e9762),
                    ),
                    textAlign: TextAlign.center,
                    softWrap: false,
                  ),
                  Visibility( visible: isPortrait,
                    child: Container(
                        padding: const EdgeInsets.all(40),
                        child: const Image(
                          image: AssetImage("assets/NovenaIcon.png"),
                          color: Color.fromARGB(255, 23, 61, 88),
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

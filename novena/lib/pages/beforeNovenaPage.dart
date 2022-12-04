import 'package:flutter/material.dart';

class BeforeNovenaScreen extends StatefulWidget {
  final int days;
  final double fontSize;

  const BeforeNovenaScreen(this.days, this.fontSize, {Key? key})
      : super(key: key);
  @override
  State<BeforeNovenaScreen> createState() => _BeforeNovenaScreenState();
}

class _BeforeNovenaScreenState extends State<BeforeNovenaScreen> {
  String faltanText = "Faltan";
  String diasText = "dias";
  String novenaText = "para la \nNovena de \nAguinaldos";
  String dateDays = "0";

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          image: const AssetImage("assets/christmasPhoto.png"),
          fit: BoxFit.fill,
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
                        padding: const EdgeInsets.all(15),
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
                  Container(
                      padding: const EdgeInsets.all(40),
                      child: const Image(
                        image: AssetImage("assets/NovenaIcon.png"),
                        color: Color.fromARGB(255, 23, 61, 88),
                      ))
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

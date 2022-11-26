import 'package:flutter/material.dart';

class BeforeNovenaScreen extends StatefulWidget {
 int days;
   BeforeNovenaScreen(this.days,{Key? key}) : super(key: key);
  @override
  State<BeforeNovenaScreen> createState() => _BeforeNovenaScreenState();
}

class _BeforeNovenaScreenState extends State<BeforeNovenaScreen> {
String faltanText = "Faltan";
String  diasText = "dias";
String  novenaText = "para la \nNovena de Aguinaldos";
 String dateDays = "0";

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
          const Image(image: 
               AssetImage("assets/christmasPhoto.png"), 
               fit: BoxFit.fill,
                  ),
        Container(    
          color: const Color.fromRGBO(255, 255, 255, 0.9),
        height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width, alignment: Alignment.center,
          child: Row(  mainAxisAlignment: MainAxisAlignment.spaceAround,        
            children: [
              Column(mainAxisAlignment: MainAxisAlignment.center, 
              children: [
                Row(children: [
                Text(
                    faltanText,
                    style: const TextStyle(
                      fontFamily: 'Apple Chancery',
                      fontSize: 40,
                      color: Color(0xff509a79),
                    ),
                    softWrap: false,
                  ),
             Container(  
              padding: const EdgeInsets.all(15),
                child: Text(
                    widget.days.toString(),
                      style: const TextStyle(
                        fontFamily: 'Apple Chancery',
                        fontSize: 55,
                        color: Color(0xff69130c),
                      ),
                      softWrap: false,
                    ),
                
             ),
              Text(
                  diasText,
                  style: const TextStyle(
                    fontFamily: 'Apple Chancery',
                    fontSize: 40,
                    color: Color(0xff509a79),
                  ),
                  softWrap: false,
                ),
                ],),   
             Text(
                 novenaText,
                 style: const TextStyle(
                   fontFamily: 'Apple Chancery',
                   fontSize: 40,
                   color: Color(0xff4e9762),
                 ),
                 textAlign: TextAlign.center,
                 softWrap: false,
               ),
             Container( padding: const EdgeInsets.all(40),
              child: const Image(image: 
             AssetImage("assets/NovenaIcon.png"),
             color: Color.fromARGB(255, 23, 61, 88),
                )
             )
              ],)
               ],
          ),
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:novena/models/VillancicosModel.dart';
import 'package:url_launcher/url_launcher.dart';

class VillancicoSceen extends StatefulWidget {
  final List<VillancicosModel> villancicosList;
  final double fontSize;
  const VillancicoSceen(this.villancicosList, this.fontSize, {Key? key})
      : super(key: key);

  @override
  State<VillancicoSceen> createState() => _VillancicoSceenState();
}

class _VillancicoSceenState extends State<VillancicoSceen> {
  late ScrollController _scrollController;
  var buttonVissbible = false;
  List<AssetImage> photos = [
    const AssetImage("assets/christmasPhoto.png"),
    const AssetImage("assets/virgenImage.jpg"),
    const AssetImage("assets/candles2Image.jpg"),
    const AssetImage("assets/christmasPhoto.png"),
    const AssetImage("assets/pesebreNavidad.jpg"),
    const AssetImage("assets/candlesImage.jpg"),
    const AssetImage("assets/pesebreImage1.jpg"),
    const AssetImage("assets/pesebre3Image.jpg"),
    const AssetImage("assets/navidadImage.jpg"),
    const AssetImage("assets/virgenImage.jpg"),
    const AssetImage("assets/candles2Image.jpg"),
    const AssetImage("assets/pesebreImage3.jpg"),
    const AssetImage("assets/pesebreImage2.jpg"),
    const AssetImage("assets/christmasPhoto.png"),
    const AssetImage("assets/candles2Image.jpg"),
    const AssetImage("assets/navidadImage.jpg"),
  ];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  Future<void> _launchInWebViewOrVC(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(
          headers: <String, String>{'my_header_key': 'my_header_value'}),
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          controller: _scrollController,
          itemBuilder: (BuildContext context, int index) {
            return Column(children: <Widget>[
              ExpansionTile(
                collapsedIconColor: const Color.fromARGB(255, 23, 61, 88),
                onExpansionChanged: (value) {
                  setState(() {
                    buttonVissbible = value;
                  });
                },
                leading: CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 23, 61, 88),
                  backgroundImage: photos[index],
                  radius: 25 + widget.fontSize,
                ),
                title: Container(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(
                    widget.villancicosList[index].title,
                    style: TextStyle(
                      fontSize: 25 + widget.fontSize,
                      fontFamily: 'Futura',
                      color: const Color(0xff509a79),
                    ),
                  ),
                ),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SizedBox(
                      height: 160,
                      child: Image(
                        image: photos[index],
                        width: double.infinity,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        _launchInWebViewOrVC(Uri.parse(
                          widget.villancicosList[index].link,
                        ));
                      },
                      child: Text(
                        "Video a cancion",
                        style: TextStyle(
                          height: 2.0,
                          fontSize: 18 + widget.fontSize,
                        ),
                      )),
                  Container(width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(right: 20, left: 20, bottom: 10),
                    child: Text(
                      widget.villancicosList[index].song,
                      style: TextStyle(
                        height: 2.0,
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 18 + widget.fontSize,
                      ),
                    ),
                  ),
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
          itemCount: widget.villancicosList.length,
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
                    backgroundColor: Color.fromARGB(255, 23, 61, 88),
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

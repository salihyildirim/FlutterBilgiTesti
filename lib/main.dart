import 'package:flutter/material.dart';

import 'constants.dart';
import 'test_veri.dart';

void main() => runApp(BilgiTesti());

class BilgiTesti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.indigo[700],
            body: SafeArea(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: SoruSayfasi(),
            ))));
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  @override
  List<Widget> secimler = [];
  /*

     List<String> sorular = [
    "Titanic gelmiş geçmiş en büyük gemidir",
    "Dünyadaki tavuk sayısı insan sayısından fazladır",
    "Kelebeklerin ömrü bir gündür",
    "Dünya düzdür",
    "Kaju fıstığı aslında bir meyvenin sapıdır",
    "Fatih Sultan Mehmet hiç patates yememiştir",
    "Fransızlar 80 demek için, 4 - 20 der"
  ];
  List<bool> yanitlar = [false, true, false, false, true, true, true];
  */

  TestVeri test_1 = new TestVeri();
  //RandomSoru test_1_random = new RandomSoru();

  void butonFonksiyon(bool secim) {
    if (test_1.TestBittiMi()) {
      secimler = [];
      test_1.TestiSifirla();
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("Test Sona Erdi."),
            content: new Text("Başa Dönmek için kapatıp devam edebilirsiniz."),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new MaterialButton(
                child: new Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      setState(() {
        if (test_1.getSoruYaniti() == secim) {
          secimler.add(kDogruIconu);
        } else {
          secimler.add(kYanlisIconu);
        }
        test_1.sonrakiSoru();
      });
    }
  }

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                test_1.getSoruMetni(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap(
          //direction: Axis.vertical,
          //alignment: WrapAlignment.center
          spacing: 5,
          runSpacing: 5,
          children: secimler,
        ),
        Expanded(
          flex: 1,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0),
              child: Row(children: <Widget>[
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: MaterialButton(
                          padding: EdgeInsets.all(12),
                          textColor: Colors.white,
                          color: Colors.red[400],
                          child: Icon(
                            Icons.thumb_down,
                            size: 30.0,
                          ),
                          onPressed: () {
                            butonFonksiyon(false);
                          },
                        ))),
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: MaterialButton(
                          padding: EdgeInsets.all(12),
                          textColor: Colors.white,
                          color: Colors.green[400],
                          child: Icon(Icons.thumb_up, size: 30.0),
                          onPressed: () {
                            butonFonksiyon(true);
                          },
                        ))),
              ])),
        )
      ],
    );
  }
}

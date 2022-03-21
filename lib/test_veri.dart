import 'dart:math';

import 'package:bilgitesti/Soru.dart';

class TestVeri {
  int _soruIndex = 0;

  List<Soru> _soruBankasi = [
    Soru(
        soruMetni: "Titanic gelmiş geçmiş en büyük gemidir.",
        soruYaniti: false),
    Soru(
        soruMetni: "Dünyadaki tavuk sayısı insan sayısından fazladır.",
        soruYaniti: true),
    Soru(soruMetni: "Kelebeklerin ömrü bir gündür", soruYaniti: false),
    Soru(
        soruMetni: "İnsanın yetiştirdiği ilk yiyecek patatestir. ",
        soruYaniti: false),
    Soru(
        soruMetni: "Kaju fıstığı aslında bir meyvenin sapıdır.",
        soruYaniti: true),
    Soru(
        soruMetni: "Fatih Sultan Mehmet hiç patates yememiştir.",
        soruYaniti: true),
    Soru(soruMetni: "Fransızlar 80 demek için, 4 - 20 der.", soruYaniti: true)
  ];

  String getSoruMetni() {
    return _soruBankasi[_soruIndex].soruMetni;
  }

  bool getSoruYaniti() {
    return _soruBankasi[_soruIndex].soruYaniti;
  }

  void sonrakiSoru() {
    if (_soruIndex == _soruBankasi.length - 1) {
      _soruIndex = 0;
    } else if (_soruIndex < _soruBankasi.length - 1) {
      _soruIndex++;
    }
  }

  bool TestBittiMi() {
    if (_soruIndex >= _soruBankasi.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void TestiSifirla() {
    _soruIndex = 0;
  }
}

class RandomSoru extends TestVeri {
  @override
  void sonrakiSoru() {
    if (_soruIndex == _soruBankasi.length - 1) {
      _soruIndex = 0;
    } else if (_soruIndex < _soruBankasi.length - 1) {
      Random rnd = Random();
      _soruIndex = rnd.nextInt(_soruBankasi.length);
    }
  }
}

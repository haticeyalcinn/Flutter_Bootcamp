

import 'package:flutter/material.dart';

import '../../data/entity/kisiler.dart';

class DetaySayfa extends StatefulWidget {
  Kisiler kisi;
  @override

  DetaySayfa({required this.kisi});

  State<DetaySayfa> createState() => _DetaySayfaState();


}

class _DetaySayfaState extends State<DetaySayfa> {

  var tfKisiAdi = TextEditingController();
  var tfKisiTel = TextEditingController();

  Future<void> guncelle(int kisi_id,String kisi_ad,String kisi_tel) async{
    print("Kişi güncelle : $kisi_id -$kisi_ad - $kisi_tel");
  }

  @override
  void initState() {//Sayfa açıldığında çalışır
    // TODO: implement initState
    super.initState();
    var kisi = widget.kisi ;
    tfKisiAdi.text = kisi.kisi_ad ;
    tfKisiTel.text = kisi.kisi_tel ;
    
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title : const Text("Detay Sayfa"),) ,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50.0,right: 50.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(controller: tfKisiAdi,decoration: const InputDecoration(hintText: "Kisi Adi"),),
              TextField(controller: tfKisiTel,decoration: const InputDecoration(hintText: "Kisi Tel"),),
              ElevatedButton(onPressed: (){
                guncelle(widget.kisi.kisi_id, tfKisiAdi.text, tfKisiTel.text);
              }, child: const Text("GÜNCELLE"))
            ],
          ),
        ),

      ),

    );
  }
}


import 'package:calisma_yapisi/sonuc_ekrani.dart';
import 'package:flutter/material.dart';

import 'kisiler.dart';

class OyunEkrani extends StatefulWidget {
  Kisiler kisi;


  OyunEkrani({required this.kisi});

  @override
  State<OyunEkrani> createState() => _OyunEkraniState();
}

class _OyunEkraniState extends State<OyunEkrani> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          title: const Text("Oyun Ekranı"),
          //Appbar a geri dönme için ikon ekleyip işlevsel hale getirdik: İkonu istediğimiz gibi seçebiliriz
          leading:IconButton(onPressed: (){
            print("appbar geri tuşu seçildi");
            Navigator.pop(context);
          },icon: const Icon(Icons.arrow_back_ios_new_outlined),) ,
        ),
        body:Center(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //Veri transferi
                Text("${widget.kisi.ad} - ${widget.kisi.yas} - ${widget.kisi.boy} - ${widget.kisi.bekar}"),
                ElevatedButton(onPressed: (){
                  //Butona basıldığında başka sayfaya yönlendirme kısmı
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>const SonucEkrani()));


                }, child: const Text("Bitti")),

              ],
            )
        )
    );
  }
}

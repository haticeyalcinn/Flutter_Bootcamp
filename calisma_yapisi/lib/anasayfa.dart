import 'package:calisma_yapisi/kisiler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'oyun_ekrani.dart';

class Anasayfa extends StatefulWidget {
  //stateful widget, UI'nın dinamik olarak değişebildiği durumlarda kullanılan bir widget türüdür.
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  int sayac = 0;
  bool kontrol = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("initstate çalıştı.");//Sadece ilk açılırken çalışır
  }

  Future<int> toplama(int sayi1,int sayi2) async{
    int toplam = sayi1 + sayi2 ;
    return toplam;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: const Text("Anasayfa"),),
      body:Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Sonuç  : $sayac"),
            ElevatedButton(onPressed: (){
              setState(() {//build metodu tekrar çalışır,arayüzü günceller
                sayac = sayac +1;

              });
            }, child: const Text("Tıkla")),
            ElevatedButton(onPressed: (){
              //Butona basıldığında başka sayfaya yönlendirme
              var kisi= Kisiler(ad: "Ahmet", yas: 23, boy: 1.45, bekar: true);
              Navigator.push(context, MaterialPageRoute(builder: (context) => OyunEkrani(kisi:kisi)))
              .then((value ) {//Bu kısımla ne zaman bu komutla geri dönüldüğü anlaşılır
                print("anasayfaya dönüldü");//Bu kısım, OyunEkrani sayfasından geri dönüldüğünde çalışır

              });

              }, child: const Text("Başla")),
            //Görsel nesnenin görünürlüğünü ayarlama
            Visibility(visible:kontrol,child:const Text("Merhaba")),//Text e option enter ile widget seçip visibility yazdık
                                                              //visible değeri true olursa görünür false olursa görünmez yapar
            Text(kontrol ? "Merhaba":"Güle Güle",style: TextStyle(color: kontrol ? Colors.blue : Colors.red),),//Kontrol değerine göre stil değiştirdik

            ((){
              if(kontrol){
                return const Text("Merhaba",style: TextStyle(color: Colors.blue),);
              }else{
                return const Text("Güle güle",style: TextStyle(color: Colors.red),);
              }

            }()),
            ElevatedButton(onPressed: (){
              setState(() {//build metodu tekrar çalışır,arayüzü günceller
              kontrol = true;

              });
            }, child: const Text("Durum 1 (True)")),
            ElevatedButton(onPressed: (){
              setState(() {//build metodu tekrar çalışır,arayüzü günceller
                kontrol = false;

              });
            }, child: const Text("Durum 1 (False)")),
            //FutureBuilder:Bu yapı, uygulamanızın arka planda çalışan bir asenkron işlemi
            // (örneğin bir veri tabanından veri çekme, bir API'den yanıt bekleme) takip
            // ederken UI'nin dinamik olarak güncellenmesini sağlar.
            FutureBuilder<int>(
              future : toplama(10 ,20),
              builder : (context,snapshot){
                if(snapshot.hasError){
                  return const Text("Hata Oluştu");
                }
                if(snapshot.hasData){
                  return  Text("Sonuç. ${snapshot.data}");
                }else{
                  return const Text("sonuç yok");
                }
              },
            ),

    ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}


class _AnasayfaState extends State<Anasayfa> {

  int sayac= 0;

  @override
  void initState() {
    super.initState();
    //test();
    sayacKontrol();
  }

  Future<void> sayacKontrol() async {
    var sp = await SharedPreferences.getInstance();
    sayac = sp.getInt("sayac") ?? 0;

    setState(() {//setState içerisinde yapılan değişiklikler, widget'ın yeniden çizilmesini (rebuild) sağlar.
                 //İçerisinde yapılan değişiklikler, kullanıcı arayüzüne (UI) yansır.
      sayac = sayac+1;
    });
    sp.setInt("sayac", sayac);


  }


    Future<void> test() async{
    var sp = await SharedPreferences.getInstance();

    //Veri Kaydı
    sp.setString("ad", "Ahmet");//ad => anahtar Ahmet =>değer
    sp.setInt("yas",23);
    sp.setDouble("boy", 1.78);
    sp.setBool("bekar", true);

    var ArkadasListesi = <String>[];
    ArkadasListesi.add("Ali");
    ArkadasListesi.add("Ece");
    sp.setStringList("arkadasListesi",ArkadasListesi );
    
    //Veri Silme
    //sp.remove("ad");

    //Veri Okuma
    String gelenAd = sp.getString("ad") ?? "İsim Yok";//Eğer set kısmında sorun çıkarsa isim yok'u ata
    int gelenYas = sp.getInt("yas") ?? 0;
    double gelenBoy = sp.getDouble("boy") ?? 0.0;
    bool gelenBekar = sp.getBool("bekar") ?? false;
    print("Gelen Ad: $gelenAd");
    print("Gelen yaş: $gelenYas");
    print("Gelen boy: $gelenBoy");
    print("Gelen beka: $gelenBekar");

    var gelenArkadasListesi = sp.getStringList("arkadasListesi") ?? <String>[];
    if(gelenArkadasListesi != null){
      for(var a in gelenArkadasListesi){
        print("arkadaş : $a");
      }
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Shared Prefences"),),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Açılış Sayfası $sayac",style: TextStyle(fontSize: 50),)
          ],
        ),
      ),
    );
  }
}

veritabanı giriş


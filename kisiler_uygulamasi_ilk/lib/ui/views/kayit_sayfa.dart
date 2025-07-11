import 'package:flutter/material.dart';

class KayitSayfa extends StatefulWidget {
  const KayitSayfa({super.key});

  @override
  State<KayitSayfa> createState() => _KayitSayfaState();
}

class _KayitSayfaState extends State<KayitSayfa> {
  var tfKisiAdi = TextEditingController();
  var tfKisiTel = TextEditingController();

  Future<void> kaydet(String kisi_ad,String kisi_tel) async{
    print("Kişi kaydet : $kisi_ad - $kisi_tel");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title : const Text("Kayıt Sayfa"),) ,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50.0,right: 50.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(controller: tfKisiAdi,decoration: const InputDecoration(hintText: "Kisi Adi"),),
              TextField(controller: tfKisiTel,decoration: const InputDecoration(hintText: "Kisi Tel"),),
              ElevatedButton(onPressed: (){
                kaydet(tfKisiAdi.text,tfKisiTel.text);

              }, child: const Text("KAYDET"))
            ],
          ),
        ),

      ),

    );
  }
}

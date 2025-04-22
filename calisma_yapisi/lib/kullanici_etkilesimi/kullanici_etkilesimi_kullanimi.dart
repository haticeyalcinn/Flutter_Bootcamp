import 'package:flutter/material.dart';

class  KullaniciEtkilesimiKullanimi extends StatefulWidget {
  const  KullaniciEtkilesimiKullanimi({super.key});

  @override
  State<KullaniciEtkilesimiKullanimi> createState() => _State();
}

class _State extends State<KullaniciEtkilesimiKullanimi> {
  var tfControl=TextEditingController();//Text almamızı sağlar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("Kullanıcı Etkileşimi") ,),
      body:Center(
    child:Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
    ElevatedButton(onPressed: (){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: const Text("silmek istiyor musunuz"),//Kullanıcıya kısa süreli bilgi vermek için kullanılır.
          action: SnackBarAction(label: "Evet",onPressed: (){//Snackbara action ekledik eğer basılırsa tekrar mesaj yollayacak
            ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: const Text("Silindi"),));
          },),
          )
      );

    }, child: const Text("Snackbar")),
    ElevatedButton(onPressed: (){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: const Text("silmek istiyor musunuz",style: TextStyle(color:Colors.blueAccent)),//Kullanıcıya kısa süreli bilgi vermek için kullanılır.
            backgroundColor:Colors.white38 ,
            action: SnackBarAction(label: "Evet",textColor:Colors.blue,onPressed: (){//Snackbara action ekledik eğer basılırsa tekrar mesaj yollayacak
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: const Text("Silindi",style: TextStyle(color: Colors.pink,))));
            },),
          )
      );

    }, child: const Text("Snackbar (özel)")),

    ElevatedButton(onPressed: (){//Alert:Kullaıcya mesaj iletmek için kullanılır
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: const Text("Başlık"),
            content:const Text("İçerik") ,
            actions: [//Actionda Alert e buton ekleyebiliriz
              TextButton(onPressed: (){
              print("iptal seçti");
              Navigator.pop(context);//Butona basınca kapanması için bir önceki sayfaya götüren navigatör kullandık
              }, child: const Text("İptal")),


              TextButton(onPressed: (){
                print("tamam seçti");//Butona basınca yapılacaklar
                Navigator.pop(context);
              }, child: const Text("Tamam")),

            ],
          );

    });
    }, child: const Text("Alert")),

      ElevatedButton(onPressed: (){
        showDialog(
            context: context,
            builder: (BuildContext context){
              return AlertDialog(
                title: const Text("kayıt işlemi"),
                content: TextField(controller: tfControl,decoration: const InputDecoration(hintText: "veri"),) ,//Kullanıcıdan giriş almak için
                backgroundColor: Colors.orange,
                actions: [//Actionda Alert e buton ekleyebiliriz
                  TextButton(onPressed: (){
                    print("iptal seçti");
                    Navigator.pop(context);//Butona basınca kapanması için bir önceki sayfaya götüren navigatör kullandık
                  }, child: const Text("İptal",style: TextStyle(color:Colors.deepPurple),)),


                  TextButton(onPressed: (){
                    print("tamam seçti");//Butona basınca yapılacaklar
                    Navigator.pop(context);
                    tfControl.text = "";
                  }, child: const Text("kaydet")),

                ],
              );

            });

      }, child: const Text("Alert (özel)")),


    ],

    ),
    ),
    );
}
}

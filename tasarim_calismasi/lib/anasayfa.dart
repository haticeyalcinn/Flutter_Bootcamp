import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasarim_calismasi/renkler.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});
//St ile classı oluştur
// const placeholder kımına Scaffold() yapısını ekle
  //Daha sonra appbar ve body kısmını tasarla
  @override
  State<Anasayfa> createState() => _AnasayfaState();
}
//left - start -leading
//right - end -trailing

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    //Çoklu ekran desteği
    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;
    print("Ekran yüksekliği : $ekranYuksekligi");
    print("Ekran genişliği : $ekranGenisligi");

    //Dil desteği için
    var d = AppLocalizations.of(context);


    return Scaffold(
      appBar: AppBar(
        title: Text("Pizza",style: TextStyle(color: yaziRenk1,fontFamily: "Pacifico",fontSize: ekranGenisligi/19),),
        backgroundColor:anaRenk,
        centerTitle: true,
      ),
     /* body: Center(
        child: Column(//Tüm column ile işlem yapmak için option enter ile seç padding yapabilirsin=>
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,//Ana eksende hizalama yapar
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(width: 100,height: 100,color:Colors.red,),
            Container(width: 50,height: 50,color:Colors.blue,),
            Container(width: 80,height: 50,color:Colors.green,),

          ],

        ),
      )*/
        //Row,Column,Stack yapıları içinde birden çok nesneyi barındırdığı için'childiren'kullanırız

       body: Column(
         children: [
           Padding(//Text e gelip option enter ile padding seçtik alt üst sağ sol boşluk oluşturmak için (only kısmından nerelere boşluk istendiği ayarlanabilir
             padding: const EdgeInsets.only(top: 16.0),//Sadece üstten 16 lık boşluk
             child: Text(d!.pizzaBaslik,style: TextStyle(fontSize: 36,color: anaRenk,fontWeight: FontWeight.bold),),
           ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              //Resim ekleme:Yeni klasör oluşturup eklemek istediğimiz resmi bu klasöre ekliyoruz
              //Daha sonra pubspec.yaml de bu resmi tanıtıyoruz,sonra burada tanımlayarak kullanabiliriz
              child: Image.asset("resimler/pizza_resim.png"),
            ),
           Padding(
             padding: const EdgeInsets.only(top:16.0),
             child: Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,//Bu hizalamaları en son yapmak daha iyi
               children: [
               /*  TextButton(onPressed:(){},
                     child: Text("Cheese",style: TextStyle(color:yaziRenk1),),
                     style : TextButton.styleFrom(backgroundColor: anaRenk),
                 ),
                 TextButton(onPressed:(){},
                   child: Text("Sausage",style: TextStyle(color:yaziRenk1),),
                   style : TextButton.styleFrom(backgroundColor: anaRenk),
                 ),
                 TextButton(onPressed:(){},
                   child: Text("Olive",style: TextStyle(color:yaziRenk1),),
                   style : TextButton.styleFrom(backgroundColor: anaRenk),
                 ),
                 TextButton(onPressed:(){},
                   child: Text("Pepper",style: TextStyle(color:yaziRenk1),),
                   style : TextButton.styleFrom(backgroundColor: anaRenk),
                 ),*/
                 //Sadece içeriği değişen textbuttonları tek tek yapmak yerine stalesswidget ile bir kere tanıtıp kullandık
                 Chip(icerik:d.peyirYazi),
                 Chip(icerik: d.sucukYazi),
                 Chip(icerik: d.zeytinYazi),
                 Chip(icerik: d.biberYazi),

                 
               ],
             ),
           ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(d.teslimatSure,style: TextStyle(fontSize: 22,color: yaziRenk2,fontWeight: FontWeight.bold),),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(d.teslimatBaslik,style: TextStyle(fontSize: 22,color: anaRenk,fontWeight: FontWeight.bold),),
                ),
                Text(d.pizzaAciklama,
                  style: TextStyle(fontSize: 21,color: yaziRenk2),textAlign:TextAlign.center,),//Sondaki komut text i ortalar

              ],
            ),
          ),
           Padding(
             padding: const EdgeInsets.all(10.0),
             child: Row(//mainAxisAlignment: MainAxisAlignment.spaceEvenly,//Rowun içinde bulunanları hizalar
               children: [
                 Text(d.fiyat,style: TextStyle(fontSize: 44,color: anaRenk,fontWeight: FontWeight.bold),),
                 const Spacer(),   //İki bileşen arasına boşluk koymak için kullanılabilir
                 SizedBox(width: 200,height: 50,//Textbutton un boyutlarının ayarı
                   child: TextButton(onPressed:(){},
                     child: Text(d.buttonYazi,style: TextStyle(color:yaziRenk1,fontSize: 18),),
                     style : TextButton.styleFrom(
                         backgroundColor: anaRenk,
                          shape: const RoundedRectangleBorder(borderRadius:BorderRadius.all(Radius.circular(5)) ),//Textbutton un kenarını oval yapma
                     ),
                   ),
                 ),

               ],
             ),
           )

         ],

       )

    );
  }
}
//Özelleştirilmiş widget
class Chip extends StatelessWidget {
  String icerik;


  Chip({required this.icerik});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed:(){},
      child: Text(icerik,style: TextStyle(color:yaziRenk1),),
      style : TextButton.styleFrom(backgroundColor: anaRenk),
    );
  }
}

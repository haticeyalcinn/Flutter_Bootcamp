import 'package:flutter/material.dart';
import 'package:kisiler_uygulamasi/data/entity/kisiler.dart';
import 'package:kisiler_uygulamasi/ui/views/detay_sayfa.dart';
import 'package:kisiler_uygulamasi/ui/views/kayit_sayfa.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  bool aramaYapiliyorMu = false;

  Future<void> ara(String aramaKelimesi) async{
    print("Kişi Ara :$aramaKelimesi ");
  }

  Future<List<Kisiler>> kisileriYukle() async{
    var kisilerListesi = <Kisiler>[];
    var k1 = Kisiler(kisi_id: 1, kisi_ad: "Ahmet", kisi_tel: "1111");
    var k2 = Kisiler(kisi_id: 2, kisi_ad: "Zeynep", kisi_tel: "2222");
    var k3 = Kisiler(kisi_id: 2, kisi_ad: "Beyza", kisi_tel: "3333");
    kisilerListesi.add(k1);
    kisilerListesi.add(k2);
    kisilerListesi.add(k3);
    return kisilerListesi;


  }
  Future<void> sil(int kisi_id) async{
    print("Kişi sil :$kisi_id ");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title : aramaYapiliyorMu ?
            TextField(
              decoration: const InputDecoration(hintText: "Ara"),
              onChanged: (aramSonucu) {
                ara(aramSonucu);
              },
            ):

        const Text("Kişiler"),
        actions: [
          aramaYapiliyorMu ?
          IconButton(onPressed: (){
            setState(() {
              aramaYapiliyorMu = false ;
            });

          }, icon: const Icon(Icons.clear)):
          IconButton(onPressed: (){
            setState(() {
              aramaYapiliyorMu = true ;
            });

          }, icon: const Icon(Icons.search))
        ],
      ) ,
      body:  FutureBuilder<List<Kisiler>>(// asenkron işlemleri kolayca yönetmek için kullanılır
        future: kisileriYukle(),
        builder:(context,snapshot){//Future tamamlandığında, sonuç snapshot nesnesinde tutulur.
          if(snapshot.hasData){
            var kisilerListesi = snapshot.data ;
            return ListView.builder(//Dinamik olarak liste elemanları oluşturmak için kullanılır
              itemCount: kisilerListesi!.length,
              itemBuilder: (context,indeks){
                var kisi = kisilerListesi[indeks];
                return GestureDetector(//Flutter'da dokunma (gesture) olaylarını algılamak ve bu olaylara tepki vermek için kullanılan bir widget
                  onTap:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  DetaySayfa(kisi: kisi)))
                        .then((value) {
                      print("Anasayfaya dönüldü");//kişiler sayfasına geri dönülünce bunu yap
                    });

                    print("${kisi.kisi_ad} seçildi.");
                  } ,
                  child: Card(//GestureDetector etkiler
                    child: SizedBox( height: 100,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(kisi.kisi_ad,style: const TextStyle(fontSize: 20) ,),
                                Text(kisi.kisi_tel),

                              ],
                            ),
                          ),
                          const Spacer(),//boşluk
                          IconButton(onPressed: (){
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content:Text("${kisi.kisi_ad} silinsin mi ?"),
                                    action:SnackBarAction(
                                      label: "Evet",
                                      onPressed: (){
                                        sil(kisi.kisi_id);
                                      },
                                    ) ,
                                )
                                );


                          }, icon: const Icon(Icons.clear,color : Colors.black54,),)
                        ],
                      ),
                    ),

                  ),
                );
              },
            );
          }else{
            return const Center();
          }
        } ,
      ),

      floatingActionButton: FloatingActionButton(//(FAB), genellikle bir uygulamanın önemli bir aksiyonunu gerçekleştirmek için kullanılan, dairesel, yüzen bir butondur.
        onPressed: (){//FABA tıklandığında kayıtsayfaya geçiş yap
          Navigator.push(context, MaterialPageRoute(builder: (context) => const KayitSayfa()))
              .then((value) {
            print("Anasayfaya dönüldü");//kişiler sayfasına geri dönülünce bunu yap
          });
        },
        child : const Icon(Icons.add),
      ),

    );
  }
}

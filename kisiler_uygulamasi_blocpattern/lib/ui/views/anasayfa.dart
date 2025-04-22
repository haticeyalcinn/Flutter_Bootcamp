import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi/data/entity/kisiler.dart';
import 'package:kisiler_uygulamasi/ui/cubit/anasayfa_cubit.dart';
import 'package:kisiler_uygulamasi/ui/views/detay_sayfa.dart';
import 'package:kisiler_uygulamasi/ui/views/kayit_sayfa.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  bool aramaYapiliyorMu = false;

  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<AnasayfaCubit>().kisileriYukle();

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title : aramaYapiliyorMu ?
            TextField(
              decoration: const InputDecoration(hintText: "Ara"),
              onChanged: (aramSonucu) {
                context.read<AnasayfaCubit>().ara(aramSonucu);
              },
            ):

        const Text("Kişiler"),
        actions: [
          aramaYapiliyorMu ?
          IconButton(onPressed: (){
            setState(() {
              aramaYapiliyorMu = false ;
            });
            context.read<AnasayfaCubit>().kisileriYukle();
          }, icon: const Icon(Icons.clear)):
          IconButton(onPressed: (){
            setState(() {
              aramaYapiliyorMu = true ;
            });

          }, icon: const Icon(Icons.search))
        ],
      ) ,
      body:  BlocBuilder<AnasayfaCubit,List<Kisiler>>(// asenkron işlemleri kolayca yönetmek için kullanılır
        builder:(context,kisilerListesi){//Future tamamlandığında, sonuç snapshot nesnesinde tutulur.
          if(kisilerListesi.isNotEmpty){
            return ListView.builder(//Dinamik olarak liste elemanları oluşturmak için kullanılır
              itemCount: kisilerListesi.length,
              itemBuilder: (context,indeks){
                var kisi = kisilerListesi[indeks];
                return GestureDetector(//Flutter'da dokunma (gesture) olaylarını algılamak ve bu olaylara tepki vermek için kullanılan bir widget
                  onTap:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  DetaySayfa(kisi: kisi)))
                        .then((value) {
                      context.read<AnasayfaCubit>().kisileriYukle();

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
                                        context.read<AnasayfaCubit>().sil(int.parse(kisi.kisi_id));
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
               context.read<AnasayfaCubit>().kisileriYukle();//anasayfaya dönüldüğünde çalışır
          });
        },
        child : const Icon(Icons.add),
      ),

    );
  }
}

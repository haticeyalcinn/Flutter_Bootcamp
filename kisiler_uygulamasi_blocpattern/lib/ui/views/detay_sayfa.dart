

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi/ui/cubit/detay_sayfa_cubit.dart';

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
                context.read<DetaySayfaCubit>().guncelle(int.parse(widget.kisi.kisi_id), tfKisiAdi.text, tfKisiTel.text);
              }, child: const Text("GÜNCELLE"))
            ],
          ),
        ),

      ),

    );
  }
}

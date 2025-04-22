import 'package:flutter/material.dart';
import 'package:sayfa_gecisi/y_sayfasi.dart';

class BSayfa extends StatefulWidget {
  const BSayfa({super.key});

  @override
  State<BSayfa> createState() => _BSayfaState();
}

class _BSayfaState extends State<BSayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("b sayfası"),
      ),
      body:
      ElevatedButton(onPressed: (){
        //Butona basıldığında başka sayfaya yönlendirme kısmı
        Navigator.push(context, MaterialPageRoute(builder: (context) =>const YSayfa()));

      }, child: const Text("Git y")),



    );
  }
}

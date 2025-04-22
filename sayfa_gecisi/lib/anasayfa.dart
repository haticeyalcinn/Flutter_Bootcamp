import 'package:flutter/material.dart';
import 'package:sayfa_gecisi/b_sayfas%C4%B1.dart';

import 'a_sayfası.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
        title: const Text("Anasayfa"),
      ),

      body:
      Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(width: 100,height: 100,
            child: ElevatedButton(onPressed: (){
              //Butona basıldığında başka sayfaya yönlendirme kısmı
              Navigator.push(context, MaterialPageRoute(builder: (context) =>const ASayfa()));

            }, child: const Text("Git a")),
          ),
          ElevatedButton(onPressed: (){
            //Butona basıldığında başka sayfaya yönlendirme kısmı
            Navigator.push(context, MaterialPageRoute(builder: (context) =>const BSayfa()));

          }, child: const Text("Git b"),
          style: ElevatedButton.styleFrom(
            minimumSize: Size(200, 50),  // Genişlik ve yükseklik
          ),)




        ],
            ),
      ),

    );
  }
}
import 'package:flutter/material.dart';
import 'package:sayfa_gecisi/b_sayfas%C4%B1.dart';

class ASayfa extends StatefulWidget {
  const ASayfa({super.key});

  @override
  State<ASayfa> createState() => _ASayfaState();
}

class _ASayfaState extends State<ASayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
    title: const Text("a sayfası"),
    ),
    body:
    ElevatedButton(onPressed: (){
    //Butona basıldığında başka sayfaya yönlendirme kısmı
    Navigator.push(context, MaterialPageRoute(builder: (context) =>const BSayfa()));

      }, child: const Text("Git b")),



    );
  }
}

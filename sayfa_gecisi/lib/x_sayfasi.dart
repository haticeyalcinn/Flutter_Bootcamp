import 'package:flutter/material.dart';
import 'package:sayfa_gecisi/y_sayfasi.dart';

class XSayfa extends StatefulWidget {
  const XSayfa({super.key});

  @override
  State<XSayfa> createState() => _XSayfaState();
}

class _XSayfaState extends State<XSayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("x sayfası",),
      ),
      body:
      ElevatedButton(onPressed: (){
        //Butona basıldığında başka sayfaya yönlendirme kısmı
        Navigator.push(context, MaterialPageRoute(builder: (context) =>const YSayfa()));

      }, child: const Text("Git y")),



    );
  }
}

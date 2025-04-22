import 'package:flutter/material.dart';

class YSayfa extends StatefulWidget {
  const YSayfa({super.key});

  @override
  State<YSayfa> createState() => _YSayfaState();
}

class _YSayfaState extends State<YSayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("y sayfası"),
        leading:IconButton(onPressed: (){
          print("appbar geri tuşu seçildi");
          Navigator.of(context).popUntil((route) => route.isFirst);//Ana sayfaya dön
        },icon: const Icon(Icons.arrow_back_sharp),) ,
      ),




    );
  }
}

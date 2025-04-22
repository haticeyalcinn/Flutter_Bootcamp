import 'package:calisma_yapisi/botttomnavigator_kullanimi/sayfa_bir.dart';
import 'package:calisma_yapisi/botttomnavigator_kullanimi/sayfa_iki.dart';
import 'package:calisma_yapisi/botttomnavigator_kullanimi/sayfa_uc.dart';
import 'package:flutter/material.dart';

class BottomNavigationSayfaa extends StatefulWidget {
  const BottomNavigationSayfaa({super.key});

  @override
  State<BottomNavigationSayfaa> createState() => _BottomNavigationSayfaaState();
}

class _BottomNavigationSayfaaState extends State<BottomNavigationSayfaa> {
  int secilenindex = 1;
  var sayfalar = [const SayfaBir(),const SayfaIki(),const SayfaUc()];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("bottom navigation"),backgroundColor: Colors.deepPurple,),
      body:sayfalar[secilenindex],
      //Bottomnavigation:a uygulamanın alt kısmına yerleştirilen bir navigasyon
      // çubuğudur ve kullanıcının uygulamadaki farklı ekranlar veya sayfalar arasında
      // geçiş yapmasını sağlar.
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.looks_one_outlined),label:"Bir"),
          BottomNavigationBarItem(icon: Icon(Icons.looks_two_outlined),label:"iki"),
          BottomNavigationBarItem(icon: Icon(Icons.looks_3_outlined),label:"üç"),

        ],
        currentIndex: secilenindex,
        backgroundColor: Colors.deepPurple,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.white,
        onTap: (indeks){
          setState(() {
            secilenindex = indeks;
          });
        }
      ),
    );
  }
}

import 'package:arayuz_calismasi/renkler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Job Details",style: TextStyle(color: yaziRenk1,fontFamily: "font",fontSize: 28),),
        backgroundColor: yaziRenk2,
        centerTitle: true,
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
           Image.asset("resimler/resim.jpeg"),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
            children : [
              Text("\$ 500\n Sallary",style: TextStyle(color: yaziRenk1,fontSize: 21),),
              Text("Job Details\nApplications",style: TextStyle(color: yaziRenk1,fontSize: 21),),
              Text("Job Details\nJob Type",style: TextStyle(color: yaziRenk1,fontSize: 21),),

            ],
          ),
          Text("Your role as a product designer goes beyond aesthetics.",style: TextStyle(color: yaziRenk1,fontSize: 21),),
          Text("By analyzing user feedback",style: TextStyle(color: yaziRenk1,fontSize: 21),),
          TextButton(onPressed: (){},
              child: Text("Expertise Specifications   >",style:TextStyle(color :yaziRenk1,fontSize: 23),),
              style: TextButton.styleFrom(backgroundColor: buttonRenk),),
          TextButton(onPressed: (){},
            child: Text("Assignment Of Responsibilies   >",style:TextStyle(color :yaziRenk1,fontSize: 23),),
            style: TextButton.styleFrom(backgroundColor: buttonRenk),),


        ],
      )
    );
  }
}

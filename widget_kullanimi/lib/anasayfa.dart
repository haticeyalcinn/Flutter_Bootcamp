import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget{
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  var tfController = TextEditingController();
  String alinanveri ="";
  String resimAdi  = "mutlu.png";
  bool switchKontrol = false;
  bool checkboxKontrol = false;
  bool progressKontrol = false;
  int radioDeger = 0;
  double ilerleme = 30.0;
  var tfSaat = TextEditingController();
  var tfTarih = TextEditingController();
  var ulkelerListesi = <String>[];
  String secilenUlke = "Türkiye";

  @override
  void initState() {//Veri listesinden veri alma,veri okuma işlemleri bu fonksiyonda olur
    // TODO: implement initState
    super.initState();
    ulkelerListesi.add("Türkiye");
    ulkelerListesi.add("İtalya");
    ulkelerListesi.add("Japonya");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("widgets"),),
      body:SingleChildScrollView(//Widget option enter ile yapıldı.Scroll özelliği ile taşma sorunu çözüldü
        child: Center(
          child: Column(
            children: [
              Text(alinanveri),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(controller: tfController,//TextField, kullanıcıların bir arayüze veri girmesini sağlayan bir bileşendir
                  decoration: InputDecoration(hintText: "veri"),
                  keyboardType:TextInputType.number ,//Sadece istediğimiz özellikte klavyeyi yazmaya izin verir
                  obscureText: true,//Şifreyi yazarken gizler
                ),
              ),
              ElevatedButton(onPressed: (){
                setState(() {
                  alinanveri  =tfController.text;
                });
              }, child: const Text("Veriyi al")),
        
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){
                  setState(() {
                  resimAdi = "mutlu.png";
                  });
                }, child: const Text("resim 1")),
        
                Image.asset("resimler/$resimAdi"),//Butonlara bastıkça resimadi değişkeni değişecek ve resimde değişmiş olacak
                //Image.network("http://kofte/resmi"),//internetten resim çekme
                ElevatedButton(onPressed: (){
                  setState(() {
                    resimAdi = "uzgun.png";
                  });
                }, child: const Text("resim 2")),
        
        
              ],),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: SwitchListTile(
                          title: const Text("Dart"),
                          controlAffinity:ListTileControlAffinity.leading,//İkonun konumunu seçtik
                          value: switchKontrol,
                          onChanged: (veri){
                          setState(() {
                            switchKontrol = veri;
                          });
                          }
                      ),
                  ),
        
        
                      Flexible(
                        child: CheckboxListTile(
                          title: const Text("Flutter"),
                          controlAffinity:ListTileControlAffinity.leading,//İkonun konumunu seçtik
                          value: checkboxKontrol,
                          onChanged: (veri){
                            setState(() {
                              checkboxKontrol = veri!;
                            });
                          }
                                          ),
                      ),
        
        
        
        
                ],),
        
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(//Radiolist ile seçeneklerden biri seçime zorlanır
                    child: RadioListTile(
                        title: const Text("Barcelona"),
                        value: 1,
                        groupValue: radioDeger,
                        onChanged: (veri){
                          setState(() {
                            radioDeger = veri!;
                          });
                        }
                    ),
                  ),
        
        
                  Flexible(
                    child: RadioListTile(
                        title: const Text("Flutter"),
                        value: 2,
                        groupValue: radioDeger,
                        onChanged: (veri){
                          setState(() {
                            radioDeger = veri!;
                          });
                        }
                    ),
                  ),
        
        
        
        
                ],),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: (){
                    setState(() {
                    progressKontrol = true;
                    });
                  }, child: const Text("Başla")),
                  Visibility(visible:progressKontrol ,child: const CircularProgressIndicator()),
                  //progress bar: Yükleme işlemi yaparken kullanıcıya gösterme:circularindicator seçip optin enter ile widget-visibilty ayarlanır
                  //progresskontrol true olunca görünür oldu
                  ElevatedButton(onPressed: (){
                    setState(() {
                      progressKontrol = false;
        
                    });
                  }, child: const Text("Dur")),
        
        
                ],),
                Text(ilerleme.toInt().toString()),//Textte çalıştırmak için stringe çevirdik
              Slider(max:100.0,min:0.0,value: ilerleme, onChanged: (veri){
               setState(() {
                 ilerleme = veri;
               });
              }),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
        
                   SizedBox(width: 100,
                     child: TextField(controller: tfSaat,//TextField, kullanıcıların bir arayüze veri girmesini sağlayan bir bileşendir
                          decoration: InputDecoration(hintText: "Saat"),
                        ),
                   ),
        
                    IconButton(onPressed: (){
                      showTimePicker(context: context, initialTime: TimeOfDay.fromDateTime(DateTime.now()))
                      .then((value)=> {
                        tfSaat.text = "${value!.hour} : ${value.minute}"
                      });
        
                    }, icon: const Icon(Icons.access_time)),
        
                SizedBox(width: 100,
                  child: TextField(controller: tfTarih,//TextField, kullanıcıların bir arayüze veri girmesini sağlayan bir bileşendir
                          decoration: InputDecoration(hintText: "Tarih"),
        
                      ),
                ),
        
                    IconButton(onPressed: (){
                      showDatePicker(
                      context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2030))
                          .then((value) {//Tarihi alma
                        tfTarih.text =
                        "${value!.day} : ${value.month }:${value.year }";
                      });
        
                    }, icon: const Icon(Icons.date_range)),
        
        
        
        
                  ],),
              DropdownButton(
                  value :secilenUlke,
                  icon: const Icon(Icons.arrow_drop_down),
                  items: ulkelerListesi.map((ulke){
                    return DropdownMenuItem(value:ulke ,child: Text(ulke),);
                  }).toList(),
                  onChanged: (veri){
                    setState(() {
                      secilenUlke = veri! ;
                    });
                  }),
              GestureDetector(//Container e option enter gesturedetector yapıp tıklanma bilgisini aldık
                onTap: (){
                  print("Container tek tıklandı");
                },
                  onDoubleTap: (){
                  print("Container çift tıklandı");
              },
                  onLongPress: (){
                  print("Container üzerine uzun tıklandı");
              },
        
        
        
                  child: Container(width: 100,height: 200,color:Colors.red,)),
                  //heighttan dolayı taşma oldu option enterdan body kısmını
                 //SingleChildScrollView seçerek sayfayı kayabilir hale getirip sorunu çözdük
        
        
              ElevatedButton(onPressed: (){
                print("Switch durum: $switchKontrol");
                print("Checkbox durum: $checkboxKontrol");
                print("radio durum: $radioDeger");
                print("slider durum: $ilerleme");
                print("Ülke durum: $secilenUlke");
        
        
              }, child: const Text("Göster")),
        
        
            ],
          ),
        
        ),
      )
    );
  }
}

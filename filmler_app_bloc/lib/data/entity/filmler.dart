class Filmler{
  int id;
  String ad;
  String resim;
  int fiyat;

  Filmler({required this.id, required this.ad,required this.resim,required this.fiyat});

  factory Filmler.fromJson(Map<String,dynamic> json){
    return Filmler(//Jsondan gelen cevabı filmler nesnesine çevirir
      id:json["id"] as int,
      ad:json["ad"] as String,
      resim:json["resim"] as String,
      fiyat:json["fiyat"] as int


    );
  }

}



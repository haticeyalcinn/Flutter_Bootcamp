import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:filmler_app/data/entity/filmler.dart';
import 'package:filmler_app/data/entity/filmler_cevap.dart';

class FilmlerdaoRepository{

  List<Filmler> parseFilmler(String cevap){
    return FilmlerCevap.fromJson(json.decode(cevap)).filmler;
  }// JSON cevabını bir film listesine (List<Filmler>) dönüştürür.


    Future<List<Filmler>> filmleriYukle() async {
     var url = "http://kasimadalan.pe.hu/filmler_yeni/tum_filmler.php";
     var cevap = await Dio().get(url);
     return parseFilmler(cevap.data.toString());
    }

}

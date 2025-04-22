import 'package:bloc_pattern_kullanimi/data/repo/matematik_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnasayfaCubit extends Cubit<int>{//Arayüze göndereceğimiz bir int değer old.
  AnasayfaCubit():super(0);//Varsayılan değer olarak 0 atadık

  var mrepo = MatematikRepository();//repoya erişim

  void toplamaYap(String alinanSayi1,String alinanSayi2){

    emit(mrepo.toplamaYap(alinanSayi1, alinanSayi2));//repoda veriyi işleyip arayüze gönderdi
  }

  void carpmaYap(String alinanSayi1,String alinanSayi2){

    emit(mrepo.carpmaYap(alinanSayi1, alinanSayi2));//Tetikleme ve veri gönderme

  }

}
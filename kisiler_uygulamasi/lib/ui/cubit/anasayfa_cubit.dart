import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi/data/repo/kisilerdao_repository.dart';

import '../../data/entity/kisiler.dart';

class AnasayfaCubit extends Cubit<List<Kisiler>>{
  AnasayfaCubit():super(<Kisiler>[]);//Döndüreceği tipe uygun değişken oluşturduk

  var krepo = KisilerdaoRepository();

  Future<void> kisileriYukle() async{//Repodan aldığını emit edecek sadece
   var liste= await krepo.kisileriYukle();
   emit(liste);

  }

  Future<void> ara(String aramaKelimesi) async{
    var liste= await krepo.ara(aramaKelimesi);
    emit(liste);
  }
  Future<void> sil(int kisi_id) async{
    await krepo.sil(kisi_id);
    await kisileriYukle();//Sildikten sonraki arayüzü gösterir

    }

}
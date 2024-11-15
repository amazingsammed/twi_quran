

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:twi_quran/features/home/domain/models/chapter.dart';
import 'package:twi_quran/features/home/domain/models/surah.dart';

import '../../../shared/network/network.dart';
import '../../../shared/ui/snackbars.dart';
import '../data/implementation/home_implentation.dart';

class HomeController extends GetxController{
  final networkInfo = NetworkInfoImpl();
 var selectedChapter = <Chapters>[].obs;
  HomeImplentation homeImplentation = HomeImplentation();
 Future<List<Chapters>> getAllChapters() async {
   // if (!await networkInfo.hasInternet()) {
   //   showErrorSnackbar(message: 'no_internet'.tr);
   //   return [];
   // }
   var results = await homeImplentation.getAllChapters();

  return results.fold((Left){
   showErrorSnackbar(message: Left.message);
     return [];
   }, (Right){
     return Right;
   });

 }

 Future<List<Surah>> getSurah(Chapters chapter) async{
   var results = await homeImplentation.getSurah(chapter);

   return results.fold((Left){
     showErrorSnackbar(message: Left.message);
     return [];
   }, (Right){
     return Right;
   });
   return [];
  }
}
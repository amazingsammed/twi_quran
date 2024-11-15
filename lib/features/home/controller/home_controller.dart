

import 'package:get/get.dart';
import 'package:twi_quran/features/home/domain/models/chapter.dart';
import 'package:twi_quran/features/home/domain/models/surah.dart';

import '../../../shared/network/network.dart';
import '../../../shared/ui/snackbars.dart';

class HomeController extends GetxController{
  final networkInfo = Get.find<NetworkInfo>();
 var selectedChapter = <Chapters>[].obs;
 Future<List<Chapters>> getAllChapters() async{
   if (!await networkInfo.hasInternet()) {
     showErrorSnackbar(message: 'no_internet'.tr);
     return [];
   }

   return [];
 }

 Future<List<Surah>> getSurah(Chapters selected) async{
   return [];
  }
}
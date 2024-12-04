

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
  var chapterList = <Chapters>[].obs;
  var surahList = <Surah>[].obs;
  var bookmarkList = <Surah>[].obs;
  HomeImplentation homeImplentation = HomeImplentation();

  @override
  Future<void> onInit() async {
    await getAllChapters();
    await getBookmarks();
    // TODO: implement onInit
    super.onInit();
  }


 Future<List<Chapters>> getAllChapters() async {
   var results = await homeImplentation.getAllChapters();

  return results.fold((Left){
   showErrorSnackbar(message: Left.message);
     return [];
   }, (Right){
    chapterList.value = Right;
     return Right;
   });

 }

 Future<List<Surah>> getSurah(Chapters? chapter) async{
   var results = await homeImplentation.getSurah(chapter??selectedChapter.value[0]);

   return results.fold((Left){
     showErrorSnackbar(message: Left.message);
     return [];
   }, (Right){
     surahList.value = Right;
     return Right;
   });
   return [];
  }

  Future<List<Surah>> getBookmarks() async{
    var results = await homeImplentation.getBookmarks();

    return results.fold((Left){
      showErrorSnackbar(message: Left.message);
      return [];
    }, (Right){
      bookmarkList.value = Right;
      return Right;
    });
    return [];
  }

  bookmark(Surah surah) async {
    var results = await homeImplentation.saveBookmark(surah);

    return results.fold((Left){
      showErrorSnackbar(message: Left.message);
      return [];
    }, (Right){
      return Right;
    });
  }
}
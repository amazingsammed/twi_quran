

import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:twi_quran/features/home/domain/models/chapter.dart';
import 'package:twi_quran/features/home/domain/models/surah.dart';
import 'package:twi_quran/responsive.dart';



class Dbhelper  {
  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  initDb() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "believers34.db");
    bool dbExists = await File(path).exists();

    if (!dbExists) {
      ByteData data = await rootBundle.load("assets/believers.db");
      List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);

    }


    // sqfliteFfiInit();
    // databaseFactory = databaseFactoryFfi;
    //

    var theDb = await databaseFactory.openDatabase(path);
    return theDb;
  }

Future<List<Chapters>> getChapters() async {
    List<Chapters> results= [];
  var dbClient = await db;
  List<Map<String, dynamic>> lists =
      await dbClient!.query('quran_chapters');
  for (var element in lists) {
    results.add(Chapters.fromMap(element));
  }
  return results;
}
  Future<List<Surah>> getSurah(int index) async {
    List<Surah> results= [];
    var dbClient = await db;
    List<Map<String, dynamic>> lists =
    await dbClient!.query('verses', where: "sura = $index");
    for (var element in lists) {
      results.add(Surah.fromMap(element));
    }
    return results;
  }

  Future<List<Surah>> getBookmarks() async {
    List<Surah> results= [];
    var dbClient = await db;
    List<Map<String, dynamic>> lists =
        await dbClient!.query('verses', where: "bookmark = 1");
    for (var element in lists) {
      results.add(Surah.fromMap(element));
    }
    return results;
  }
  Future<bool> saveBookmarks(Surah surah) async {
    int id = surah.bookmark == 0 ?1:0;
    List<Surah> results= [];
    var dbClient = await db;
    var lists =
    await dbClient!.update('verses', {'bookmark':id},where: "sura = ${surah.sura} and ayah = ${surah.ayah}");
   return true;
  }


}
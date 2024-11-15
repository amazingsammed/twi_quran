import 'package:dartz/dartz.dart';
import 'package:twi_quran/features/home/domain/models/chapter.dart';
import 'package:twi_quran/features/home/domain/models/surah.dart';
import 'package:twi_quran/features/home/domain/repository/quran_repo.dart';
import 'package:twi_quran/shared/error/failure.dart';

import '../local/database.dart';

class HomeImplentation extends QuranRepository {
  @override
  Future<Either<Failure, List<Chapters>>> getAllChapters() async {
    try {
      Dbhelper mydb = Dbhelper();
      return Right(await mydb.getChapters());
    } catch (e) {
      return Left(Failure('Unable to fetch Chapters'));
    }
  }

  @override
  Future<Either<Failure, List<Surah>>> getSurah(Chapters chapter) async{
    try {
      Dbhelper mydb = Dbhelper();
      return Right(await mydb.getSurah(chapter.index));
    } catch (e) {
    return Left(Failure('Unable to fetch Verses'));
    }
  }
}

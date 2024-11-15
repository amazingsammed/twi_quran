import 'package:dartz/dartz.dart';
import 'package:twi_quran/features/home/domain/models/chapter.dart';
import 'package:twi_quran/features/home/domain/models/surah.dart';

import '../../../../shared/error/failure.dart';

abstract class QuranRepository {
 Future<Either<Failure, List<Chapters>>> getAllChapters();
 Future<Either<Failure, List<Surah>>> getSurah(Chapters chapter);
}
import 'package:dartz/dartz.dart';
import 'package:twi_quran/features/home/domain/models/chapter.dart';
import 'package:twi_quran/features/home/domain/models/surah.dart';

import '../../../../shared/error/failure.dart';

abstract class ProfileRepository {
 Future<Either<Failure, Chapters>> getAllChapters();
 Future<Either<Failure, Surah>> getSurah(Chapters chapter);
}
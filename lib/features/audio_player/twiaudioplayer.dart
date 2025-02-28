import 'dart:async';

import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:record/record.dart';
import 'package:twi_quran/features/home/domain/models/surah.dart';

class TwiAudioPlayer extends GetxController {
  var isPlaying = false.obs;
  var currentTime = 1.0.obs;
  late AudioPlayer _audioPlayer;
  final record = AudioRecorder();

  @override
  Future<void> onInit() async {

    super.onInit();

    _audioPlayer = AudioPlayer();

    await _audioPlayer.setAsset("assets/audio/114.mp3");


    _audioPlayer.positionStream.listen((position) {
      currentTime.value = position.inMilliseconds.toDouble();
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  // Play the audio
  void play() {
    _audioPlayer.play();
  }

  // Pause the audio
  void pause() {
    _audioPlayer.pause();
  }

  playSegment(Surah surah) async {
    print(surah.bookmark);
    List data = [
      {"sura": 114, "ayah": 1, "time": 9537, "NAVICAT_ROWID": 6231},
      {"sura": 114, "ayah": 2, "time": 11228, "NAVICAT_ROWID": 6232},
      {"sura": 114, "ayah": 3, "time": 13135, "NAVICAT_ROWID": 6233},
      {"sura": 114, "ayah": 4, "time": 21156, "NAVICAT_ROWID": 6234},
      {"sura": 114, "ayah": 5, "time": 24364, "NAVICAT_ROWID": 6235},
      {"sura": 114, "ayah": 6, "time": 28829, "NAVICAT_ROWID": 6236}
    ];
    var item = data.firstWhere((e) => surah.ayah == e['ayah']);
    print(item);
    int startTime = item['ayah'] > 1
        ? data.firstWhere((e) => item['ayah'] - 1 == e['ayah'])['time']
        : 0;
    print(startTime);
    await _audioPlayer.seek(Duration(milliseconds: startTime));
    int endTime = item['time'];
    // Start playing
    _audioPlayer.play();

    isPlaying.value = true;

    // Stop after the segment duration (endTime - startTime)
    Timer(Duration(milliseconds: (endTime - startTime)), () {
      _audioPlayer.pause();

      isPlaying.value = false;
    });
  }

// Skip to the timing of a verse
// void _skipToVerse(int index) {
//   _audioPlayer.seek(Duration(seconds: verses[index]['startTime'].toInt()));
// }
}

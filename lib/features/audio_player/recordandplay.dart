import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:get/get.dart';
import 'package:twi_quran/features/home/domain/models/surah.dart';

import '../home/controller/home_controller.dart';

class RecordAndPlayButton extends StatefulWidget {
  final Surah surah; // Path where audio will be saved

  RecordAndPlayButton({required this.surah});

  @override
  _RecordAndPlayButtonState createState() => _RecordAndPlayButtonState();
}

class _RecordAndPlayButtonState extends State<RecordAndPlayButton> {
  HomeController controller = Get.find();
  late AudioRecorder _audioRecorder;
  late AudioPlayer _audioPlayer;
  bool isRecording = false;
  bool isPlaying = false;
  double position = 0;
  late Directory _path;

  checkPath() async {
    _path = Directory(
        '/storage/emulated/0/Music/Twi_Quran/${controller.chapterList[widget.surah.sura-1].title}');
    if (!await _path.exists()) {
      await _path.create(recursive: true);
    }
    print(_path.path);
  }

  Future<bool> checkIfFileExist() async {
    await checkPath();
    return await File('${_path.path}/${widget.surah.ayah}.m4a').exists();
  }

  Future deleteFile() async {
     await File('${_path.path}/${widget.surah.ayah}.m4a').delete();
     setState(() {

     });
  }

  @override
  void initState() {
    super.initState();
    _audioRecorder = AudioRecorder();
    _audioPlayer = AudioPlayer();
    _audioPlayer.positionStream.listen((audioDuration) {
      setState(() {
        position = audioDuration.inSeconds/60;
      });



    });
  }

  // Function to start recording
  Future<void> _startRecording() async {
    try {
      if (await _audioRecorder.hasPermission()) {
        await checkPath();
        await _audioRecorder.start(const RecordConfig(),
            path: '${_path.path}/${widget.surah.ayah}.m4a');
        setState(() {
          isRecording = true;
        });
      }
    } catch (e) {
      print("Error starting recorder: $e");
    }
  }

  // Function to stop recording
  Future<void> _stopRecording() async {
    try {
      await _audioRecorder.stop();
      setState(() {
        isRecording = false;
      });
    } catch (e) {
      print("Error stopping recorder: $e");
    }
  }

  // Function to play the recorded audio
  Future<void> _playRecording() async {
    await checkPath();
    try {
      setState(() {
        isPlaying = true;
      });
      await _audioPlayer
          .setFilePath('${_path.path}/${widget.surah.ayah}.m4a');
      await _audioPlayer.play();
      setState(() {
        isPlaying = false;
      });
    } catch (e) {
      print("Error playing audio: $e");
    }
  }

  // Function to stop playing the audio
  Future<void> _stopPlaying() async {
    try {
      await _audioPlayer.stop();
      setState(() {
        isPlaying = false;
      });
    } catch (e) {
      print("Error stopping player: $e");
    }
  }

  @override
  void dispose() {
    _audioRecorder.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          icon: Icon(isRecording ? Icons.stop : Icons.mic),
          onPressed: isRecording ? _stopRecording : _startRecording,
        ),
        FutureBuilder(
            future: checkIfFileExist(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data) {
                  return Row(
                    children: [
                      IconButton(
                        icon:
                            Icon(isPlaying ? Icons.stop : Icons.play_arrow),
                        onPressed:
                            isPlaying ? _stopPlaying : _playRecording,
                      ),Slider(
                        value: position,
                        max:_audioPlayer.duration==null?1.0:_audioPlayer.duration!.inSeconds/60,
                        onChanged: (a){
                        // setState(() {
                        //   position=a;
                        // });
                      },), IconButton(
                        icon:
                        Icon(Icons.delete),
                        onPressed:() async {
                          await deleteFile();
                        },
                      )
                    ],
                  );
                }
                return SizedBox();
              } else if (snapshot.hasError) {
                return Icon(Icons.error_outline);
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      ],
    );
  }
}

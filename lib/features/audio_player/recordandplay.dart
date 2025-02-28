import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

class RecordAndPlayButton extends StatefulWidget {
  final String audioFilePath; // Path where audio will be saved

  RecordAndPlayButton({required this.audioFilePath});

  @override
  _RecordAndPlayButtonState createState() => _RecordAndPlayButtonState();
}

class _RecordAndPlayButtonState extends State<RecordAndPlayButton> {
  late AudioRecorder _audioRecorder;
  late AudioPlayer _audioPlayer;
  bool isRecording = false;
  bool isPlaying = false;
  late Directory _path ;


  load() async{
    _path =  (await getApplicationDocumentsDirectory());
  }
  @override
  void initState()  {
    super.initState();
    load();
    _audioRecorder = AudioRecorder();
    _audioPlayer = AudioPlayer();
  }

  // Function to start recording
  Future<void> _startRecording() async {
    try {
      if (await _audioRecorder.hasPermission()) {}
      await _audioRecorder.start(const RecordConfig(), path: '$_path/${widget.audioFilePath}.m4a');
      setState(() {
        isRecording = true;
      });
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
    try {
      await _audioPlayer.setAsset('$_path/${widget.audioFilePath}.m4a');
      _audioPlayer.play();
      setState(() {
        isPlaying = true;
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
      children: [
        Row(
          children: [
            IconButton(
              icon: Icon(isRecording ? Icons.stop : Icons.mic),
              onPressed: isRecording ? _stopRecording : _startRecording,
            ),
            IconButton(
              icon: Icon(isPlaying ? Icons.stop : Icons.play_arrow),
              onPressed: isPlaying ? _stopPlaying : _playRecording,
            ),
          ],
        ),
      ],
    );
  }
}

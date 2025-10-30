

import 'package:flutter/material.dart';
import 'package:twi_quran/features/library/domain/model/reciter.dart';
import 'package:twi_quran/features/library/presentation/component/audio_playertile.dart';

import '../../home/data/local/database.dart';

class AudioListPage extends StatelessWidget {
  final Reciter reciter;
  const AudioListPage({super.key, required this.reciter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(),
    body: FutureBuilder(
        future: DbManager().getAudioById(reciter.uuid),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                var item = snapshot.data[index];
              return AudioTileExpanded(title: item['title'], assetPath: "assets/audio/${reciter.uuid}/${item['id']}");
            },);
          } else if (snapshot.hasError) {
            return Icon(Icons.error_outline);
          } else {
            return Center(
                child: CircularProgressIndicator()
            );
          }
        })
    );
  }
}

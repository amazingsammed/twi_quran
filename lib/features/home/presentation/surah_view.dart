

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twi_quran/features/home/controller/home_controller.dart';
import 'package:twi_quran/features/home/domain/models/surah.dart';

class SurahView extends GetView<HomeController> {
  const SurahView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quran in Twi"),
        leading: IconButton(onPressed: (){},icon: Icon(Icons.menu),),
        actions: [
          IconButton(onPressed: (){},icon: Icon(Icons.search),),
        ],
      ),
      body: FutureBuilder(
          future: controller.getSurah(controller.selectedChapter.value[0]),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  Surah surah = snapshot.data[index];
                  return ListTile(title: Text(surah.arabic),);
                },);
            } else if (snapshot.hasError) {
              return Icon(Icons.error_outline);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),

    );
  }
}

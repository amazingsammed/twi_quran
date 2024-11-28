import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twi_quran/features/home/domain/models/chapter.dart';
import 'package:twi_quran/features/home/presentation/surah_view.dart';

import '../controller/home_controller.dart';

class Home extends GetView<HomeController> {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Quran in Twi"),
      //   leading: IconButton(onPressed: (){},icon: Icon(Icons.menu),),
      // actions: [
      //   IconButton(onPressed: (){},icon: Icon(Icons.search),),
      // ],
      ),
      body: FutureBuilder(
            future: controller.getAllChapters(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.separated(itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                  Chapters chapter = snapshot.data[index];
                    return ListTile(
                      onTap: ()=>Get.to(()=>SurahPage(selectedchapter: chapter, chapters: snapshot.data,)),
                      leading: CircleAvatar(child: Text("${index +1 }")),

                      title: Text(chapter.title,style: TextStyle(color: Colors.green[800],fontWeight: FontWeight.bold),),
                      subtitle: Text(chapter.titleEn),
                      trailing: Text(chapter.titleAr,style: TextStyle(fontFamily: 'arabic'),),
                    );
                  }, separatorBuilder: (BuildContext context, int index) => Divider(color: Colors.grey.withOpacity(0.2),));
              } else if (snapshot.hasError) {
                return Icon(Icons.error_outline);
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  }
}




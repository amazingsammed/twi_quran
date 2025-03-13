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
          title: const Text("Al-Quran Twi"),
          //   leading: IconButton(onPressed: (){},icon: Icon(Icons.menu),),
          actions: [
          ],
        ),
        body: Obx(() {
          return RefreshIndicator(
            onRefresh: () async {
              await controller.getAllChapters();
            },
            child: ListView.separated(
                itemCount: controller.chapterList.value.length,
                itemBuilder: (BuildContext context, int index) {
                  Chapters chapter = controller.chapterList.value[index];
                  return ListTile(
                    onTap: () => Get.to(() {
                      controller.selectedChapter.clear();
                      controller.selectedChapter.add(chapter);
                      controller.getSurah(chapter);
                      return SurahPage(selectedchapter: chapter);
                    }),
                    leading: CircleAvatar(child: Text("${index + 1}")),
                    title: Text(
                      chapter.title,
                      style: TextStyle(
                          color: Colors.green[800],
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(chapter.titleEn),
                    trailing: Text(
                      chapter.titleAr,
                      style: TextStyle(fontFamily: 'arabic'),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) => Divider(
                  thickness: 2,
                      color: Colors.grey.withOpacity(0.1),
                    )),
          );
        }));
  }
}

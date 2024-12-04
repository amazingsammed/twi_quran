import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:twi_quran/features/home/presentation/surah_view.dart';

import '../../home/controller/home_controller.dart';
import '../../home/domain/models/surah.dart';
import '../../home/presentation/component/surah_view_drawer.dart';

class Bookmark extends GetView<HomeController> {
  const Bookmark({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: SurahViewDrawer(),
      appBar: AppBar(
        title: Text('Bookmark'),
      ),
      body: RefreshIndicator(onRefresh: () async {
        await controller.getBookmarks();
      },
        child: Obx(() {
          if(controller.bookmarkList.value.isEmpty) return Center(child: Text('No Bookmarks'),);
          return ListView.separated(
            itemCount: controller.bookmarkList.value.length,
            itemBuilder: (BuildContext context, int index) {
              Surah surah = controller.bookmarkList.value[index];
              return Card(
                child: Column(
                  children: [
                    Text(controller.chapterList.where((e)=>e.index==surah.sura).first.title),
                    VerseTile(surah: surah, index: surah.ayah),
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                Divider(
                  color: Colors.grey.withOpacity(0.3),
                  thickness: 20,
                ),
          );
        }),),
    );
  }
}

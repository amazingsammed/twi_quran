import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twi_quran/features/home/controller/home_controller.dart';
import 'package:twi_quran/features/home/domain/models/chapter.dart';
import 'package:twi_quran/features/home/domain/models/surah.dart';
import 'package:twi_quran/features/home/presentation/home.dart';
import 'package:twi_quran/shared/ui/custom_bottomsheet.dart';

import '../../audio_player/twiaudioplayer.dart';
import 'component/surah_view_drawer.dart';
import 'component/verse_tile.dart';

class SurahView extends StatefulWidget {
  final Chapters chapter;

  SurahView({super.key, required this.chapter});

  @override
  State<SurahView> createState() => _SurahViewState();
}

class _SurahViewState extends State<SurahView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  HomeController controller = Get.find();
 TwiAudioPlayer audioPlayer = Get.find();

  @override
  Widget build(BuildContext context) {
    controller.getSurah(widget.chapter);
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: SurahViewDrawer(),
      appBar: AppBar(

        title: Text(widget.chapter.title),
        actions: [
          IconButton(
            onPressed: () {
              _scaffoldKey.currentState?.openEndDrawer();
            },
            icon: Icon(Icons.menu_open),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.getSurah(widget.chapter);
        },
        child: Obx(() {
          return ListView.separated(
            itemCount: controller.surahList.value.length,
            itemBuilder: (BuildContext context, int index) {
              Surah surah = controller.surahList.value[index];
              if (index == 0) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.chapter.title,
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.chapter.place,
                            style: TextStyle(fontSize: 20),
                          ),
                          Obx(() {
                            return Text(
                              controller.surahList.value.length.toString(),
                              style: TextStyle(fontSize: 20),
                            );
                          })
                        ],
                      ),
                    ),
                    if(widget.chapter.index != 9 &&
                        widget.chapter.index != 1) Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('بِسۡمِ ٱللَّهِ ٱلرَّحۡمَٰنِ ٱلرَّحِيمِ',
                          style: TextStyle(fontFamily: 'arabic',
                              fontSize: 20,
                              fontWeight: FontWeight.bold),),
                      ],
                    ),

                    VerseTile(surah: surah, index: index)
                  ],
                );
              }
              return VerseTile(
                surah: surah,
                index: index,
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                Divider(
                  color: Colors.grey.withOpacity(0.3),
                  thickness: 20,
                ),
          );
        }),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(

          color: Colors.green[800]
        ),
        height: 50,
        child: Row(
          children: [
            IconButton(onPressed: () async {
             audioPlayer.play();
            }, icon: Icon(Icons.play_arrow_outlined,color: Colors.white,)),
            IconButton(onPressed: () async {
              //audioPlayer.pause();
            }, icon: Icon(Icons.pause,color: Colors.white,)),

            // Obx(() {
            //   return Text(audioPlayer.currentTime.value.toString());
            // })
          ],
        ),
      ),
    );
  }
}


class SurahPage extends StatefulWidget {
  final Chapters selectedchapter;

  SurahPage({super.key, required this.selectedchapter});

  @override
  State<SurahPage> createState() => _SurahPageState();
}

class _SurahPageState extends State<SurahPage> {
  HomeController controller = Get.find();
  late PageController pageController;
  int selectedpage = 0;

  @override
  void initState() {
    pageController =
        PageController(initialPage: widget.selectedchapter.index - 1);
    selectedpage = widget.selectedchapter.index - 1;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(
            onPageChanged: (i) {
              setState(() {
                selectedpage = i;
                controller.getSurah(controller.chapterList.value[selectedpage]);
              });
            },
            controller: pageController,
            itemCount: controller.chapterList.value.length,
            itemBuilder: (context, i) {
              return SurahView(
                  chapter: controller.chapterList.value[selectedpage]);
            }));
  }
}

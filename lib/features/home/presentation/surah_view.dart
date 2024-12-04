import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twi_quran/features/home/controller/home_controller.dart';
import 'package:twi_quran/features/home/domain/models/chapter.dart';
import 'package:twi_quran/features/home/domain/models/surah.dart';
import 'package:twi_quran/features/home/presentation/home.dart';
import 'package:twi_quran/shared/ui/custom_bottomsheet.dart';

import 'component/surah_view_drawer.dart';

class SurahView extends StatefulWidget {
  final Chapters chapter;

  SurahView({super.key, required this.chapter});

  @override
  State<SurahView> createState() => _SurahViewState();
}

class _SurahViewState extends State<SurahView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  HomeController controller = Get.find();

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
                     if(widget.chapter.index!=9 &&widget.chapter.index!=1) Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text('بسم الله الرحمن الرحيم',style: TextStyle(fontFamily: 'arabic',fontSize: 20,fontWeight: FontWeight.bold),),
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
        )
      // bottomNavigationBar: BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed,
      //   selectedItemColor: Colors.white,
      //   unselectedItemColor: Colors.white,
      //   items:   [
      //     BottomNavigationBarItem(
      //       activeIcon: Icon(Icons.home_max),
      //       icon: Icon(Icons.home_filled),
      //       label: 'Contents',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.bookmark_add),
      //
      //       label: 'Auto Scroll',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.play_arrow_outlined),
      //       label: 'Play Audio',
      //     ),
      //
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.menu),
      //       label: 'Planner',
      //     ),
      //   ],
      //   onTap: (s){},
      //
      // ),
    );
  }
}

class VerseTile extends StatelessWidget {
  VerseTile({
    super.key,
    required this.surah,
    required this.index,
  });

  final Surah surah;
  final int index;

  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "${index + 1}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Spacer(),
                IconButton(
                    onPressed: () {
                      showCustomBottomSheet(
                          height: 200,
                          child: Column(
                            children: [
                              ListTile(
                                leading: Icon(Icons.copy),
                                title: Text("Copy"),
                                onTap: () {
                                  Clipboard.setData(ClipboardData(
                                      text:
                                      """Quran ${surah.sura}:${surah
                                          .ayah}\n${surah.english}\n${surah
                                          .twi}\nQuran Twi Translation"""));
                                  Navigator.of(context).pop();
                                },
                              ),
                              ListTile(
                                leading: Icon(Icons.bookmark),
                                title: Text(surah.bookmark != 1
                                    ? "Bookmark"
                                    : "Remove from Bookmark"),
                                onTap: () async {
                                  await controller.bookmark(surah);
                                  await controller.getBookmarks();
                                  await controller.getSurah(
                                      controller.selectedChapter.value[0]);
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ));
                    },
                    icon: Icon(Icons.more_vert))
              ],
            ),
            SizedBox(
              height: 4,
            ),
            if(controller.showArabic.value) Container(
                alignment: Alignment.centerRight,
                child: Text(
                  surah.arabic,
                  style: TextStyle(
                     fontFamily: 'arabic',
                      fontSize: 18),
                  maxLines: 7,
                  textAlign: TextAlign.right,
                  overflow: TextOverflow.ellipsis,
                )),
            if(controller.showArabic.value) SizedBox(
              height: 6,
            ),
            if(controller.showEnglish.value) Text(
              surah.english,
              style: GoogleFonts.robotoCondensed(),
            ),
            SizedBox(
              height: 8,
            ),
            if(controller.showAsanteTwi.value) Text(
              surah.twi,
              style: GoogleFonts.arimo(),
            ),
            Divider(),
            Row(
              children: [
                // IconButton(onPressed: (){}, icon: Icon(Icons.play_circle_outline,color: Colors.grey,)),
                IconButton(
                    onPressed: () async {
                      await controller.bookmark(surah);
                      await controller.getBookmarks();
                      await controller
                          .getSurah(controller.selectedChapter.value[0]);
                    },
                    icon: Icon(
                      Icons.bookmark,
                      color: surah.bookmark == 1 ? Colors.green : Colors.grey,
                    )),
              ],
            )
          ],
        ),
      );
    });
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

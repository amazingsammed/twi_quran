import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twi_quran/features/home/controller/home_controller.dart';
import 'package:twi_quran/features/home/domain/models/chapter.dart';
import 'package:twi_quran/features/home/domain/models/surah.dart';
import 'package:twi_quran/shared/ui/custom_bottomsheet.dart';

class SurahView extends GetView<HomeController> {
  final Chapters chapter;

  const SurahView({super.key, required this.chapter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(chapter.title),
        // actions: [
        //   IconButton(onPressed: (){},icon: Icon(Icons.menu_open),),
        // ],
      ),
      body: FutureBuilder(
          future: controller.getSurah(chapter),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  Surah surah = snapshot.data[index];
                  if (index == 0) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                chapter.title,
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
                                  chapter.place,
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  snapshot.data.length.toString(),
                                  style: TextStyle(fontSize: 20),
                                )
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "${index + 1}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
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
                                            ),
                                            ListTile(
                                              leading: Icon(
                                                  Icons.cloud_upload_rounded),
                                              title: Text("Share"),
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
                          Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                surah.arabic,
                                style: TextStyle(
                                  fontFamily: 'arabic',
                                  fontSize: 18
                                ),
                                maxLines: 7,
                                textAlign: TextAlign.right,
                                overflow: TextOverflow.ellipsis,
                              )),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            surah.english,
                            style: GoogleFonts.robotoCondensed(),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            surah.twi,
                            style: GoogleFonts.arimo(),
                          ),
                          // Divider(),
                          // Row(
                          //   children: [
                          //     IconButton(onPressed: (){}, icon: Icon(Icons.play_circle_outline,color: Colors.grey,)),
                          //     IconButton(onPressed: (){}, icon: Icon(Icons.bookmark,color: Colors.grey,)),
                          //   ],
                          // )
                        ],
                      ),
                    );
                  }
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "${index + 1}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
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
                                          ),
                                          ListTile(
                                            leading: Icon(
                                                Icons.cloud_upload_rounded),
                                            title: Text("Share"),
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
                        Container(
                            alignment: Alignment.centerRight,
                            child: Text(
                              surah.arabic,
                              style: TextStyle(
                                fontFamily: 'arabic',
                                fontSize: 18
                              ),
                              maxLines: 7,
                              textAlign: TextAlign.right,
                              overflow: TextOverflow.ellipsis,
                            )),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          surah.english,
                          style: GoogleFonts.robotoCondensed(),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(

                          surah.twi,
                          style: GoogleFonts.arimo(),
                        ),
                        // Divider(),
                        // Row(
                        //   children: [
                        //     IconButton(onPressed: (){}, icon: Icon(Icons.play_circle_outline,color: Colors.grey,)),
                        //     IconButton(onPressed: (){}, icon: Icon(Icons.bookmark,color: Colors.grey,)),
                        //   ],
                        // )
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) => Divider(
                  color: Colors.grey.withOpacity(0.3),
                  thickness: 20,
                ),
              );
            } else if (snapshot.hasError) {
              return Icon(Icons.error_outline);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
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



class SurahPage extends StatefulWidget {
  final List<Chapters> chapters;
  final Chapters selectedchapter;

   SurahPage({super.key, required this.chapters, required this.selectedchapter});

  @override
  State<SurahPage> createState() => _SurahPageState();
}

class _SurahPageState extends State<SurahPage> {
  late PageController controller;
  int selectedpage =0;
  @override
  void initState() {
    controller =PageController(initialPage: widget.selectedchapter.index);
    selectedpage = widget.selectedchapter.index-1;
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: PageView.builder(
      onPageChanged: (i){
        setState(() {
          selectedpage=i;
        });
      },
      controller: controller,
        itemCount: widget.chapters.length,
        itemBuilder: (context,i){
        return SurahView(chapter: widget.chapters[selectedpage]);

    })
    );
  }
}


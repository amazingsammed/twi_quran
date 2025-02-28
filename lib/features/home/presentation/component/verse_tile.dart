import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twi_quran/features/audio_player/twiaudioplayer.dart';

import '../../../../shared/ui/custom_bottomsheet.dart';
import '../../../audio_player/recordandplay.dart';
import '../../controller/home_controller.dart';
import '../../domain/models/surah.dart';

class VerseTile extends StatelessWidget {
  VerseTile({
    super.key,
    required this.surah,
    required this.index,
  });

  final Surah surah;
  final int index;

  final HomeController controller = Get.find();

  final TwiAudioPlayer audioPlayer =Get.find();

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
               if(surah.bookmark == 1) Icon(
                  Icons.bookmark,
                  color: surah.bookmark == 1 ? Colors.green : Colors.grey,
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
                                          """Quran ${surah.sura}:${surah.ayah}\n\n${surah.english}\n\n${surah.twi}\n\nQuran Twi Translation"""));
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
            if (controller.showArabic.value)
              Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    surah.arabic2,
                    style: TextStyle(
                        fontFamily: 'arabic',
                        fontSize: (controller.fontsize_arabic.value / 1) * 50),
                    maxLines: 20,
                    textAlign: TextAlign.right,
                    overflow: TextOverflow.ellipsis,
                  )),
            if (controller.showArabic.value)
              SizedBox(
                height: 6,
              ),
            if (controller.showEnglish.value)
              Text(
                surah.english,
                style: GoogleFonts.robotoCondensed().copyWith(
                    fontSize: (controller.fontsize_english.value / 1) * 50),
              ),
            SizedBox(
              height: 8,
            ),
            if (controller.showAsanteTwi.value)
              Text(
                surah.twi,
                style: GoogleFonts.arimo().copyWith(
                    fontSize: (controller.fontsizeAsanteTwi.value / 1) * 50),
              ),
            // Divider(),
            //  Row(
            //    children: [
            //      IconButton(onPressed: () async {
            //      await audioPlayer.playSegment(surah);
            //      }, icon: Icon(Icons.play_circle_outline,color: Colors.grey,)),
            //      IconButton(
            //          onPressed: () async {
            //            await controller.bookmark(surah);
            //            await controller.getBookmarks();
            //            await controller
            //                .getSurah(controller.selectedChapter.value[0]);
            //          },
            //          icon: Icon(
            //            Icons.bookmark,
            //            color: surah.bookmark == 1 ? Colors.green : Colors.grey,
            //          )
            //      ),
            //    ],
            //  ),
            // RecordAndPlayButton(audioFilePath: '${surah.sura}-${surah.ayah}',)
          ],
        ),
      );
    });
  }
}

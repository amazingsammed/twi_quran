import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twi_quran/features/options/presentation/settingspage.dart';
import 'package:twi_quran/features/translator/presentation/translatorpage.dart';
import 'package:twi_quran/shared/ui/custom_bottomsheet.dart';

import '../../../shared/utils/launch_url.dart';
import '../../home/presentation/component/surah_view_drawer.dart';
import 'dictonarypage.dart';

class Optionspage extends StatelessWidget {
  const Optionspage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Options"),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            children: [
              Container(
                height: 100,
                alignment: Alignment.center,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/logo.png'),
                  ),
                  title: Text("Believer"),
                  subtitle: Text("Muslim@gmail.com"),
                ),
              ),
              // OptionTile(title: "Account", icon: Icons.person),
              OptionTile(
                title: "Dictionary",
                icon: Icons.book,
                onTap: () {
                  Get.to(() => DictonaryPage());
                },
              ),
              OptionTile(
                title: 'Settings',
                icon: Icons.settings,
                onTap: () {
                  Get.to(() => SettingsPage());
                },
              ),
              OptionTile(
                title: "Translator",
                icon: Icons.translate,
                onTap: () {
                  Get.to(() => Translatorpage());
                },
              ),
              OptionTile(
                title: "Contact Us",
                icon: Icons.call,
                onTap: () {
                  showCustomBottomSheet(
                      height: 200,
                      child: Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              title: Text("Whatsapp"),
                              leading: Icon(Icons.chat),
                              onTap: () {
                                openLink("https://wa.me/233509912357");
                              },
                            ),
                            ListTile(
                              title: Text("Report Issue"),
                              leading: Icon(Icons.report),
                              onTap: () {
                                openLink("https://forms.gle/Lo69ux4HSQ1WCStJA");
                              },
                            )
                          ],
                        ),
                      ));
                },
              ),
            ],
          ),
        ));
  }
}

class OptionTile extends StatelessWidget {
  String title;
  String? subtitle;
  IconData icon;
  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      //color: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.black12, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon),
        title: Text(title),
        subtitle: subtitle == null
            ? null
            : Text(
                subtitle.toString(),
                style: TextStyle(color: Colors.grey),
              ),
        trailing: Icon(Icons.chevron_right),
      ),
    );
  }

  OptionTile(
      {super.key,
      required this.title,
      this.subtitle,
      required this.icon,
      this.onTap});
}

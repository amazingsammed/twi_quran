import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twi_quran/features/home/controller/home_controller.dart';

class SettingsPage extends GetView<HomeController> {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("My Settings"),),
        body: Container(
          child: Obx(() {
            return ListView(
              children: [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.green[900],
                  ),
                  accountName: Text('Quran KronKron'),
                  accountEmail: Text("Asante Twi Translation"),
                  currentAccountPicture: Image.asset("assets/images/logo.png"),
                ),
                CheckboxListTile(
                  value: controller.showArabic.value,
                  onChanged: (e) {
                    controller.showArabic.value = e!;
                    //  Navigator.of(context).pop();
                  },
                  title: Text("Show Arabic"),
                ),
                CheckboxListTile(
                  value: controller.showAsanteTwi.value,
                  onChanged: (e) {
                    controller.showAsanteTwi.value = e!;
                    // Navigator.of(context).pop();
                  },
                  title: Text("Show Asanti Twi"),
                ),
                CheckboxListTile(
                  value: controller.showEnglish.value,
                  onChanged: (e) {
                    controller.showEnglish.value = e!;
                    // Navigator.of(context).pop();
                  },
                  title: Text("Show English"),
                ),
                Divider(),
                ListTile(
                  title: Text('Arabic font size'),
                  subtitle: Slider(
                      divisions: 10,
                      min: 0.1,
                      value: controller.fontsize_arabic.value,
                      onChanged: (onChanged) {
                        controller.fontsize_arabic.value = onChanged;
                      }),
                  trailing: Text((controller.fontsize_arabic.value / 1 * 50)
                      .toStringAsFixed(1)),
                ),
                ListTile(
                  title: Text('Twi font size'),
                  subtitle: Slider(
                      divisions: 10,
                      min: 0.1,
                      value: controller.fontsizeAsanteTwi.value,
                      onChanged: (onChanged) {
                        controller.fontsizeAsanteTwi.value = onChanged;
                      }),
                  trailing: Text((controller.fontsizeAsanteTwi.value / 1 * 50)
                      .toStringAsFixed(1)),
                ),
                ListTile(
                  title: Text('English font size'),
                  subtitle: Slider(
                      divisions: 10,
                      min: 0.1,
                      value: controller.fontsize_english.value,
                      onChanged: (onChanged) {
                        controller.fontsize_english.value = onChanged;
                      }),
                  trailing: Text((controller.fontsize_english.value / 1 * 50)
                      .toStringAsFixed(1)),
                ),

              ],
            );
          }),
        ));
  }
}

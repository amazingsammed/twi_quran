

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twi_quran/features/home/controller/home_controller.dart';

class SurahViewDrawer extends GetView<HomeController> {
  const SurahViewDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(child: Container(
            child: ListView(
              children: [
                Text("Asanti Twi Quran Translation" ,style: TextStyle(fontSize: 20,color: Colors.green,fontWeight: FontWeight.bold),),
                SizedBox(height: 15,),
                Text("Asante Twi - QuranEnc api"),
                Text("Sahih English - FawazAhmed api"),
              ],
            ),
          )),
          CheckboxListTile(value: controller.showArabic.value, onChanged: (e){
            controller.showArabic.value = e!;
            Navigator.of(context).pop();
          },title: Text("Show Arabic"),),
          CheckboxListTile(value: controller.showEnglish.value, onChanged: (e){
            controller.showEnglish.value = e!;
            Navigator.of(context).pop();
          },title: Text("Show English"),),
          CheckboxListTile(value: controller.showAsanteTwi.value, onChanged: (e){
            controller.showAsanteTwi.value = e!;
            Navigator.of(context).pop();
          },title: Text("Show Asanti Twi"),),
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twi_quran/features/home/presentation/home.dart';

import '../../home/presentation/master.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text("Quran Translation"),
    ),
    body: Container(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: ListView(

        children: [
          Text("Asante Twi Translation",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          Text("Translation of the Quran meanings into Ashanti by Sheikh Haroun Ismaeel",style: TextStyle(fontSize: 20),),
          SizedBox(height: 50,),
          Text("Please note: The translation may not capture the full depth and nuances of the original Arabic text."),
          SizedBox(height: 80,),
          Text("More features on the way",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        ],
      ),
    ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: ElevatedButton(onPressed: (){
          Get.offAll(()=>Master());
        },child: Text('Proceed'),),
      ),
    );
  }
}

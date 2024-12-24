
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twi_quran/features/home/presentation/home.dart';

import '../../home/presentation/master.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Master();
    return Scaffold(
    appBar: AppBar(
      title: const Text("Quran Kronkron"),
    ),
    body: Container(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: ListView(

        children: [
          Text("Asante Twi Translation",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          Text("Translation of the Quran meanings into Ashanti by Sheikh Haroun Ismaeel",style: TextStyle(fontSize: 20),),
          SizedBox(height: 50,),
          Text("Please note: The translation may not capture the full depth and nuances of the original Arabic text.",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
          SizedBox(height: 80,),
          Text("Y3 Nya firii:  QuranEnc API ne FawazAhmed API",style: TextStyle(fontSize: 20),),
        ],
      ),
    ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.green),
            foregroundColor: WidgetStatePropertyAll(Colors.white),
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
padding: WidgetStatePropertyAll(EdgeInsets.all(12))
          ),
          onPressed: (){
          Get.offAll(()=>Master());
        },child: Text('Proceed',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
      ),
    );
  }
}

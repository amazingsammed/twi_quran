import 'package:flutter/material.dart';
import 'package:twi_quran/shared/ui/custom_bottomsheet.dart';

class DictonaryPage extends StatelessWidget {
  const DictonaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: Text('Dictionary'),actions: [
      IconButton(onPressed: (){
        showCustomBottomSheet(child: Container(
          child: Text("Coming Soon"),
        ));
      }, icon: Icon(Icons.search))
    ],),
    body: Container(
      child: Center(
        child: Text("Coming Soon"),
      ),
    )
    );
  }
}

import 'package:flutter/material.dart';

class Optionspage extends StatelessWidget {
  const Optionspage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   appBar: AppBar(
     title: Text("Options"),
   ),
    body: Center(
      child: Text("Coming Soon" ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
    )
    );
  }
}

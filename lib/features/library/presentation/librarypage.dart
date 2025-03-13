import 'package:flutter/material.dart';

class Library extends StatelessWidget {
  const Library({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Library"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical:10),
          child: SafeArea(
              child: SingleChildScrollView(child: Column(
            children: [
Text("Please note: The translation may not capture the full depth and nuances of the original Arabic text"),
              SizedBox(height: 20,),
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 20,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: Text('Full',style: TextStyle(color: Colors.white),),),
                    ListTile(

                      title: Text("Sheikh Haroun Ismaeel"),
                      subtitle: Text('Translation of the Quran into Ashanti by Sheikh Haroun Ismaeel',maxLines: 2, overflow: TextOverflow.ellipsis,),
                    ),
                  ],
                ),
              ),
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 20,
                      width: 70,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: Text('Partial',style: TextStyle(color: Colors.white),),),
                    ListTile(
                      title: Text(" Sheikh Harun Nkansah Agyekum"),
                      subtitle: Text('Translation of the Quran into Twi by  Sheikh Harun Nkansah Agyekum',maxLines: 2, overflow: TextOverflow.ellipsis,),
                    ),
                  ],
                ),
              ),
            ],
          ),)),
        )
    );
  }
}


import 'package:flutter/material.dart';
import 'package:twi_quran/shared/ui/snackbars.dart';

import '../../domain/model/reciter.dart';

class ProfileCard extends StatelessWidget {
  final Reciter reciter;
  const ProfileCard({super.key, required this.reciter});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        showSuccessSnackbar(message: "Audio of ${reciter.name.trim()} coming soon",title: "Dear User");
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 130,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(image: AssetImage(reciter.image),fit: BoxFit.cover),
                    color: Colors.red),
              ),
               Text(reciter.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
               Text("Reciter (Twi)"),



            ],
          ),
        ),
      ),
    );
  }
}

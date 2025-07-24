import 'package:flutter/material.dart';

import '../domain/model/reciter.dart';
import 'component/profile_card.dart';

class AudioLibrary extends StatelessWidget {
  const AudioLibrary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Audio Library"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: ListView(
            children: [
              Text(
                  "Please note: The translation may not capture the full depth and nuances of the original Arabic text"),
              GridView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 240,
                      crossAxisCount: 2
                  ),
                  itemCount: people.length,
                  itemBuilder: (c, i) {
                    Reciter reciter = people[i];
                    return ProfileCard(reciter: reciter,);
                  })
            ],
          ),
        ));
  }
}

List<Reciter> people=[
  Reciter(name: "Abdul Mumin Salahudeen", image: "assets/images/people/shakuur.jpg", phone: "+233 244622728", uuid: "Shakuur"),
  Reciter(name: "Abdul Hakim Alhassan ", image: "assets/images/people/hakim.jpg", phone: "+233 56120496", uuid: "Hakim"),
  Reciter(name: "Abubakar Mohammed ", image: "assets/images/people/hakim.jpg", phone: "+233 56120496", uuid: "Abuu"),
];

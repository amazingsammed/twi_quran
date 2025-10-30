
import 'package:flutter/material.dart';
import 'package:twi_quran/shared/ui/snackbars.dart';

import '../../domain/model/reciter.dart';

class ProfileCard extends StatelessWidget {
  final Reciter reciter;
  final VoidCallback? onTap;
  const ProfileCard({super.key, required this.reciter,this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child:   Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(reciter.image),
              ),
              title: Text(reciter.name),
              subtitle: const Text("Kumasi - Ghana"),
            ),
          ],
        ),
      ),
    );
  }
}

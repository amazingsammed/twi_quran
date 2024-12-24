
import 'package:flutter/material.dart';

class AuthHome extends StatelessWidget {
  const AuthHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    body: CustomScrollView(
      slivers: [
        SliverAppBar(

        ),
        SliverToBoxAdapter(
          child: Container(
            child: ListView(
              children: [
               TextFormField()

              ],
            ),
          ),
        )
      ],
    )
    );
  }
}

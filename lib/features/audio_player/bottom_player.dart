import 'package:flutter/material.dart';

class BottomPlayer extends StatefulWidget {
  const BottomPlayer({super.key});

  @override
  State<BottomPlayer> createState() => _BottomPlayerState();
}

class _BottomPlayerState extends State<BottomPlayer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.green
      ),
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [

  IconButton(icon: Icon(Icons.comment), onPressed: (){}),
  IconButton(icon: Icon(Icons.comment), onPressed: (){}),
  IconButton(icon: Icon(Icons.comment), onPressed: (){}),
],
      ),
    );
  }
}



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../bookmark/presentation/bookmark.dart';
import '../../options/presentation/optionspage.dart';
import '../../translator/presentation/translatorpage.dart';
import 'home.dart';

class Master extends StatefulWidget {
  Master({Key? key}) : super(key: key);
  @override
  State<Master> createState() => _MasterState();
}

class _MasterState extends State<Master> with SingleTickerProviderStateMixin {
  int currentIndex =0;
  late PageController pageController;
  var activecolor = Colors.white;
  var inactiveColor = Colors.white30;

  @override
  void initState() {
    pageController = PageController(initialPage: currentIndex);
    // TODO: implement initState
    super.initState();
  }
  void changeTabindex(int index) {
    setState(() {

    currentIndex = index;
    pageController.animateToPage(index, duration: Duration(microseconds: 300), curve: Curves.ease);
    });

  }
  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      Home(),
      Bookmark(),
      // Translatorpage(),
      Optionspage(),

    ];

    return Scaffold(
      body: PageView(
          controller: pageController,
          onPageChanged: changeTabindex,
          children:
          screens
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          selectedItemColor: activecolor,
          unselectedItemColor: inactiveColor,
          type: BottomNavigationBarType.fixed,

          iconSize: 27.5,
          items:   [
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.home_max),
              icon: Icon(Icons.home_filled),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              label: 'Bookmark',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.leaderboard),
            //   label: 'Planner',
            // ),

            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Options',
            ),
          ],
          onTap: changeTabindex,
        )

    );
  }


}
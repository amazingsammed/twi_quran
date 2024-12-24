import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twi_quran/responsive.dart';

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
  int currentIndex = 0;
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
      pageController.animateToPage(index,
          duration: Duration(microseconds: 300), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    List Tabs = [
      {"icon": Icons.home, "title": "Home"},
      {"icon": Icons.bookmark, "title": "BookMark"},
      {"icon": Icons.settings, "title": "Options"},
    ];

    List<Widget> screens = [
      Home(),
      Bookmark(),
      // Translatorpage(),
      Optionspage(),
    ];

    return Scaffold(
        body: Row(
          children: [
           if(ResponsiveLayout.isDesktop(context)) NavigationRail(
             elevation: 10,
              onDestinationSelected: changeTabindex,
                destinations: Tabs.map((e) {
                  return NavigationRailDestination(
                      icon: Icon(e['icon']), label: Text(e['title']));
                }).toList(),
                selectedIndex: currentIndex),
            Expanded(
              child: PageView(
                  scrollDirection: ResponsiveLayout.isMobile(context)
                      ? Axis.horizontal
                      : Axis.vertical,
                  controller: pageController,
                  onPageChanged: changeTabindex,
                  children: screens),
            ),
          ],
        ),
        bottomNavigationBar: ResponsiveLayout.isMobile(context)? BottomNavigationBar(
          currentIndex: currentIndex,
          selectedItemColor: activecolor,
          unselectedItemColor: inactiveColor,
          type: BottomNavigationBarType.fixed,
          iconSize: 27.5,
          items: Tabs.map((e) {
            return BottomNavigationBarItem(
                icon: Icon(e['icon']), label: e['title']);
          }).toList(),
          onTap: changeTabindex,
        ):null);
  }
}

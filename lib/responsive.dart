import 'package:flutter/material.dart';

class ResponsiveLayout {
 static bool isMobile(BuildContext context){
   return MediaQuery.of(context).size.width < 600;
 }
 static bool isDesktop(BuildContext context){
   return MediaQuery.of(context).size.width > 600;
 }

}

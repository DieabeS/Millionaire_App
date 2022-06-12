import 'package:flutter/material.dart';
import 'package:millionaire_app/ui/screens/customer_bottom_nav_bar_screen.dart';

BoxDecoration buildBackGroundGradient() {
  return BoxDecoration(
    gradient: LinearGradient(colors: [
      accentColor.withOpacity(0.5),
      scaffoldBackgroundColor,
      scaffoldBackgroundColor,
      accentColor.withOpacity(0.5),
    ], begin: Alignment.topLeft, end: Alignment.bottomCenter),
  );
}
GlobalKey<CustomerBottomNavBarScreenState> navBarGlobalKey = GlobalKey<CustomerBottomNavBarScreenState>();

const titleAppBarColor = Color(0xFF000000);
const scaffoldBackgroundColor = Color(0xFFF6F6F6);
const titleColor = Color(0xFF1f1f1f);
const iconsColor = Color(0xFFC4C4C4);
const subtitleColor = Color(0xFF707070);
const accentColor = Color(0xFF9AE9FA);
const lightTextColor = Color(0xff999999);
const mainText = Color(0xff434343);
const blueColoredText = Color(0xFF7CDCF5);
const prizeTextColor = Color(0xFFF5A600);
const progressIndicatorColor = Color(0xFFFFE651);
const yellowContainerColor = Color(0xFFFFE651);
const settingsGradientStart = Color(0xFF6796f6);
const settingsGradientEnd = Color(0xFFFFFFFF);
const popups = Color(0xffD7E7FB);
Color loadingBackgroundColor = Colors.black12.withOpacity(0.15);

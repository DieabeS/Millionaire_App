import 'package:flutter/material.dart';
import 'package:millionaire_app/ui/screens/settings_screen/settings_screen.dart';

class SettingsDrawer extends StatelessWidget {
  const SettingsDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: screenWidth > 450 ? screenWidth * 0.7 : screenWidth * 0.9,
      child: const Drawer(
        child: SettingsScreen(),
      ),
    );
  }
}

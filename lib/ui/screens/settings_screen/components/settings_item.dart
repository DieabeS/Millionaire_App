import 'package:flutter/material.dart';
import 'package:millionaire_app/ui/widgets/bouncing_animated_widget.dart';

import '../../../../constants.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem({
    Key? key,
    required this.icon,
    required this.settingText,
    required this.optionsAction,
  }) : super(key: key);

  final String icon;
  final String settingText;
  final Function() optionsAction;

  @override
  Widget build(BuildContext context) {
    return BounceAnimatedWidget(
      onTap: optionsAction,
      child: Padding(
        padding: const EdgeInsets.only(top: 16, bottom: 16, left: 20, right: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 34,
              width: 34,
              child: Image.asset(
                icon,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                settingText,
                style: const TextStyle(
                  color: mainText,
                  fontSize: 20,
                ),
              ),
            ),
            const Icon(
              Icons.navigate_next,
              color: subtitleColor,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}

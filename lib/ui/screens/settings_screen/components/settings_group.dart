import 'package:flutter/material.dart';
import 'package:millionaire_app/ui/screens/settings_screen/components/settings_item.dart';

class SettingsGroup extends StatelessWidget {
  const SettingsGroup({
    Key? key,
    required List<String> icons,
    required List<String> options,
    required List<Function()> functionsList,
  })  : _icons = icons,
        _options = options,
        _functionsList = functionsList,
        super(key: key);

  final List<String> _icons;
  final List<String> _options;
  final List<Function()> _functionsList;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(23),
      child: Container(
        color: Colors.white.withOpacity(0.25),
        child: Column(
          children: List.generate(
            _options.length,
            (index) => SettingsItem(
              optionsAction: _functionsList[index],
              icon: _icons[index],
              settingText: _options[index],
            ),
          ),
        ),
      ),
    );
  }
}

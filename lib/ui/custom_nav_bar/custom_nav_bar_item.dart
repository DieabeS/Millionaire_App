import 'package:flutter/material.dart';
import 'package:millionaire_app/constants.dart';
import 'package:millionaire_app/ui/custom_nav_bar/custom_nav_bar_theme.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

// ignore: must_be_immutable
class CustomNavBarItem extends StatelessWidget {
  final String? label;
  final String icon;
  final Duration? animationDuration;
  Color? selectedBackgroundColor;
  Color? selectedForegroundColor;
  Color? selectedLabelColor;

  int? index;
  int? selectedIndex;
  CustomNavBarTheme? theme;
  bool? showSelectedItemShadow;
  double itemWidth;

  void setIndex(int index) {
    this.index = index;
  }

  Color _getDerivedBorderColor() {
    return theme!.selectedItemBorderColor;
  }

  Color _getBorderColor(bool isOn) {
    return isOn ? _getDerivedBorderColor() : Colors.transparent;
  }

  bool _isItemSelected() {
    return index == selectedIndex;
  }

  static const kDefaultAnimationDuration = Duration(milliseconds: 1500);

  CustomNavBarItem({
    Key? key,
    this.label,
    this.itemWidth = 60,
    this.selectedBackgroundColor,
    this.selectedForegroundColor,
    this.selectedLabelColor,
    this.index,
    required this.icon,
    this.showSelectedItemShadow,
    this.selectedIndex,
    this.theme,
    this.animationDuration = kDefaultAnimationDuration,
  }) : super(key: key);

  Center _makeLabel(String label) {
    bool isSelected = _isItemSelected();
    return Center(
      child: Text(
        label.tr(),
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 13,
          color: mainText,
          letterSpacing: isSelected ? 1.1 : 1.0,
        ),
      ),
    );
  }

  Widget _makeIconArea(double itemWidth, String iconData) {
    bool isSelected = _isItemSelected();
    double radius = 27;
    double innerBoxSize = itemWidth;
    double innerRadius = (itemWidth - 8) / 2 - 4;

    return CircleAvatar(
      radius: isSelected ? radius : radius * 0.7,
      backgroundColor: _getBorderColor(isSelected),
      child: SizedBox(
        width: innerBoxSize,
        height: isSelected ? innerBoxSize : innerBoxSize / 2,
        child: CircleAvatar(
          radius: innerRadius,
          backgroundColor: isSelected
              ? selectedBackgroundColor ?? theme!.selectedItemBackgroundColor
              : theme!.unselectedItemBackgroundColor,
          child: _makeIcon(iconData),
        ),
      ),
    );
  }

  Widget _makeIcon(
    String icon,
  ) {
    bool isSelected = _isItemSelected();
    return Image.asset(
      icon,
      height: 25,
      width: 25,
      fit: BoxFit.cover,
      color: isSelected ? selectedForegroundColor ?? theme!.selectedItemIconColor : theme!.unselectedItemIconColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    theme = Provider.of<CustomNavBarTheme>(context);
    showSelectedItemShadow = theme!.showSelectedItemShadow;
    itemWidth = theme!.itemWidth;
    selectedIndex = Provider.of<int>(context);

    selectedBackgroundColor = selectedBackgroundColor ?? theme!.selectedItemBackgroundColor;
    selectedForegroundColor = selectedForegroundColor ?? theme!.selectedItemIconColor;
    selectedLabelColor = selectedLabelColor ?? theme!.selectedItemLabelColor;

    bool isSelected = _isItemSelected();
    double itemHeight = itemWidth - 20;
    double topOffset = isSelected ? -30 : -10;
    double iconTopSpacer = 10;
    double shadowTopSpacer = 4;

    Widget labelWidget = _makeLabel(label!);
    Widget iconAreaWidget = _makeIconArea(itemWidth, icon);

    return AnimatedContainer(
      width: itemWidth,
      height: double.maxFinite,
      duration: animationDuration!,
      child: SizedBox(
        width: itemWidth,
        height: itemHeight,
        child: Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            Positioned(
              top: topOffset,
              left: -itemWidth / 2,
              right: -itemWidth / 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: iconTopSpacer),
                  iconAreaWidget,
                  labelWidget,
                  SizedBox(height: shadowTopSpacer),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

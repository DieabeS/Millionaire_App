import 'package:flutter/material.dart';
import 'package:millionaire_app/ui/custom_nav_bar/custom_nav_bar_item.dart';
import 'package:millionaire_app/ui/custom_nav_bar/custom_nav_bar_theme.dart';
import 'package:provider/provider.dart';

class CustomNavBar extends StatefulWidget {
  final Function onSelectTab;
  final List<CustomNavBarItem> items;
  final CustomNavBarTheme theme;

  final int selectedIndex;

  CustomNavBar({
    Key? key,
    this.selectedIndex = 0,
    required this.onSelectTab,
    required this.items,
    required this.theme,
  }) : super(key: key) {
    assert(items.length >= 2 && items.length <= 5);
  }

  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    final CustomNavBarTheme theme = widget.theme;
    final bgColor = theme.barBackgroundColor;

    return MultiProvider(
      providers: [
        Provider<CustomNavBarTheme>.value(value: theme),
        Provider<int>.value(value: widget.selectedIndex),
      ],
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 2,
            ),
          ],
        ),
        child: SafeArea(
          child: Container(
            width: double.infinity,
            height: theme.barHeight,
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: widget.items.map((item) {
                var index = widget.items.indexOf(item);
                item.setIndex(index);

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.onSelectTab(index);
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / widget.items.length,
                      height: theme.barHeight,
                      child: item,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}

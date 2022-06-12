import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:millionaire_app/constants.dart';
import 'package:millionaire_app/managers/resource_manager.dart';
import 'package:millionaire_app/route/auto_route.gr.dart';
import 'package:millionaire_app/ui/custom_nav_bar/custom_nav_bar.dart';
import 'package:millionaire_app/ui/custom_nav_bar/custom_nav_bar_item.dart';
import 'package:millionaire_app/ui/custom_nav_bar/custom_nav_bar_theme.dart';

class CustomerBottomNavBarScreen extends StatefulWidget {
  final String? destinationRouteName;

  const CustomerBottomNavBarScreen({Key? key, this.destinationRouteName}) : super(key: key);

  @override
  CustomerBottomNavBarScreenState createState() => CustomerBottomNavBarScreenState();
}

class CustomerBottomNavBarScreenState extends State<CustomerBottomNavBarScreen> with SingleTickerProviderStateMixin {
  late int _lastTab;
  late final List<GlobalKey<AutoRouterState>> _routeKeys;
  TabsRouter? currentTabsRouter;
  clearRoutingStack(int index) {
    final router = _routeKeys[index].currentState?.controller;
    if (router?.canPopSelfOrChildren ?? false) {
      router?.popUntilRoot();
    }
  }

  @override
  void initState() {
    _routeKeys = List.generate(5, (index) => GlobalKey<AutoRouterState>());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int navigatorKeyIndex = 0;
    return WillPopScope(
      onWillPop: () {
        if (_lastTab == 0) {
          if (_routeKeys[0].currentState?.controller?.canPopSelfOrChildren ?? false) {
            _routeKeys[0].currentState?.controller?.pop();
            return Future.value(false);
          }
          return Future.value(true);
        } else {
          currentTabsRouter?.setActiveIndex(0);
          return Future.value(false);
        }
      },
      child: AutoTabsScaffold(
          routes: [
            HomeInitialPage(routerKey: _routeKeys[navigatorKeyIndex++]),
            MapInitialPage(routerKey: _routeKeys[navigatorKeyIndex++]),
            WinnerInitialPage(routerKey: _routeKeys[navigatorKeyIndex++]),
            NumbersInitialPage(routerKey: _routeKeys[navigatorKeyIndex++]),
            WalletInitialPage(routerKey: _routeKeys[navigatorKeyIndex++]),
          ],
          bottomNavigationBuilder: (_, tabsRouter) {
            currentTabsRouter = tabsRouter;
            _lastTab = tabsRouter.activeIndex;

            return CustomNavBar(
              theme: CustomNavBarTheme(
                  barBackgroundColor: Colors.white,
                  selectedItemBackgroundColor: Colors.white,
                  selectedItemIconColor: accentColor,
                  barHeight: 70,
                  showSelectedItemShadow: false,
                  selectedItemBorderColor: scaffoldBackgroundColor),
              selectedIndex: tabsRouter.activeIndex,
              items: [
                CustomNavBarItem(
                  index: 0,
                  icon: ResourceManager.getResource(name: 'home.png'),
                  label: 'Home',
                ),
                CustomNavBarItem(
                  index: 1,
                  icon: ResourceManager.getResource(name: 'maps.png'),
                  label: 'Maps',
                ),
                CustomNavBarItem(
                  index: 2,
                  icon: ResourceManager.getResource(name: 'winner.png'),
                  label: 'Winner',
                ),
                CustomNavBarItem(
                  index: 3,
                  icon: ResourceManager.getResource(name: 'numbers.png'),
                  label: 'Numbers',
                ),
                CustomNavBarItem(
                  index: 4,
                  icon: ResourceManager.getResource(name: 'bag.png'),
                  label: 'Wallet',
                ),
              ],
              onSelectTab: (index) {
                if (_lastTab == index) {
                  final router = _routeKeys[index].currentState?.controller;
                  if (router?.canPopSelfOrChildren ?? false) {
                    router?.pop();
                  }
                }
                tabsRouter.setActiveIndex(index);
              },
            );
          }),
    );
  }

  BottomNavigationBarItem bottomNavigationItem({required icon, required String title}) {
    return BottomNavigationBarItem(
      label: title,
      icon: icon is String
          ? ImageIcon(
              AssetImage(icon),
            )
          : icon,
    );
  }

  Widget bottomNavBarItem({required icon}) {
    return Column(
      children: [
        ImageIcon(AssetImage(icon)),
      ],
    );
  }
}

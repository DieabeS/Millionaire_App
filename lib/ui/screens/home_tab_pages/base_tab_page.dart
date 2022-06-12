import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class MainTabPage extends StatelessWidget {
  final GlobalKey<AutoRouterState> routerKey;
  const MainTabPage({Key? key, required this.routerKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoRouter(key: routerKey,);
  }
}

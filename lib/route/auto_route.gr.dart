// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i32;
import 'package:flutter/material.dart' as _i33;

import '../ui/screens/charge_screen/charge_screen.dart' as _i28;
import '../ui/screens/click_buy_screen.dart/click_buy_screen.dart' as _i13;
import '../ui/screens/customer_bottom_nav_bar_screen.dart' as _i3;
import '../ui/screens/drawer/how_it_works_screen.dart' as _i18;
import '../ui/screens/drawer/notification_screen.dart' as _i17;
import '../ui/screens/drawer/privacy_policy_screen.dart' as _i15;
import '../ui/screens/drawer/profile_screen.dart' as _i14;
import '../ui/screens/employee_bottom_nav_bar_screen.dart' as _i4;
import '../ui/screens/get_help_screen.dart/get_help_screen.dart' as _i16;
import '../ui/screens/home_screen/employee_home_screen.dart' as _i27;
import '../ui/screens/home_screen/home_screen.dart' as _i10;
import '../ui/screens/home_tab_pages/employee_home_initial_page.dart' as _i24;
import '../ui/screens/home_tab_pages/home_body_inital_page.dart' as _i5;
import '../ui/screens/home_tab_pages/invoices_initial_page.dart' as _i25;
import '../ui/screens/home_tab_pages/map_inital_page.dart' as _i6;
import '../ui/screens/home_tab_pages/numbers_initial_page.dart' as _i9;
import '../ui/screens/home_tab_pages/profile_initial_page.dart' as _i26;
import '../ui/screens/home_tab_pages/wallet_initial_page.dart' as _i8;
import '../ui/screens/home_tab_pages/winner_inital_page.dart' as _i7;
import '../ui/screens/invoices_screen/invoices_screen.dart' as _i31;
import '../ui/screens/login_screen/login_screen.dart' as _i1;
import '../ui/screens/map_screen/map_screen.dart' as _i20;
import '../ui/screens/notsubscriber_screen/notsubscriber_screen.dart' as _i29;
import '../ui/screens/numbers_screen/numbers_screen.dart' as _i23;
import '../ui/screens/product_screen/product_screen.dart' as _i11;
import '../ui/screens/results_screen/results_screen.dart' as _i19;
import '../ui/screens/select_number_screen/select_number_screen.dart' as _i12;
import '../ui/screens/settings_screen/wallet_screen/wallet_screen.dart' as _i22;
import '../ui/screens/sign_up_screen.dart/sign_up_screen.dart' as _i2;
import '../ui/screens/subscriber_screen/subscriber_screen.dart' as _i30;
import '../ui/screens/winner_screen/winner_screen.dart' as _i21;

class AppRouter extends _i32.RootStackRouter {
  AppRouter([_i33.GlobalKey<_i33.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i32.PageFactory> pagesMap = {
    LogInRoute.name: (routeData) {
      return _i32.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i1.LogInScreen());
    },
    SignUpRoute.name: (routeData) {
      return _i32.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i2.SignUpScreen());
    },
    CustomerBottomNavBarRoute.name: (routeData) {
      final args = routeData.argsAs<CustomerBottomNavBarRouteArgs>(
          orElse: () => const CustomerBottomNavBarRouteArgs());
      return _i32.CupertinoPageX<dynamic>(
          routeData: routeData,
          child: _i3.CustomerBottomNavBarScreen(
              key: args.key, destinationRouteName: args.destinationRouteName));
    },
    EmployeeBottomNavBarRoute.name: (routeData) {
      final args = routeData.argsAs<EmployeeBottomNavBarRouteArgs>(
          orElse: () => const EmployeeBottomNavBarRouteArgs());
      return _i32.CupertinoPageX<dynamic>(
          routeData: routeData,
          child: _i4.EmployeeBottomNavBarScreen(
              key: args.key, destinationRouteName: args.destinationRouteName));
    },
    HomeInitialPage.name: (routeData) {
      final args = routeData.argsAs<HomeInitialPageArgs>();
      return _i32.CupertinoPageX<dynamic>(
          routeData: routeData,
          child: _i5.HomeInitialPage(key: args.key, routerKey: args.routerKey));
    },
    MapInitialPage.name: (routeData) {
      final args = routeData.argsAs<MapInitialPageArgs>();
      return _i32.CupertinoPageX<dynamic>(
          routeData: routeData,
          child: _i6.MapInitialPage(key: args.key, routerKey: args.routerKey));
    },
    WinnerInitialPage.name: (routeData) {
      final args = routeData.argsAs<WinnerInitialPageArgs>();
      return _i32.CupertinoPageX<dynamic>(
          routeData: routeData,
          child:
              _i7.WinnerInitialPage(key: args.key, routerKey: args.routerKey));
    },
    WalletInitialPage.name: (routeData) {
      final args = routeData.argsAs<WalletInitialPageArgs>();
      return _i32.CupertinoPageX<dynamic>(
          routeData: routeData,
          child:
              _i8.WalletInitialPage(key: args.key, routerKey: args.routerKey));
    },
    NumbersInitialPage.name: (routeData) {
      final args = routeData.argsAs<NumbersInitialPageArgs>();
      return _i32.CupertinoPageX<dynamic>(
          routeData: routeData,
          child:
              _i9.NumbersInitialPage(key: args.key, routerKey: args.routerKey));
    },
    HomeRoute.name: (routeData) {
      return _i32.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i10.HomeScreen());
    },
    ProductRoute.name: (routeData) {
      final args = routeData.argsAs<ProductRouteArgs>(
          orElse: () => const ProductRouteArgs());
      return _i32.CupertinoPageX<dynamic>(
          routeData: routeData,
          child:
              _i11.ProductScreen(key: args.key, withDrawer: args.withDrawer));
    },
    SelectNumberRoute.name: (routeData) {
      final args = routeData.argsAs<SelectNumberRouteArgs>(
          orElse: () => const SelectNumberRouteArgs());
      return _i32.CupertinoPageX<dynamic>(
          routeData: routeData,
          child: _i12.SelectNumberScreen(
              key: args.key, withDrawer: args.withDrawer));
    },
    ClickBuyRoute.name: (routeData) {
      return _i32.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i13.ClickBuyScreen());
    },
    ProfileRoute.name: (routeData) {
      return _i32.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i14.ProfileScreen());
    },
    PrivacyPolicyRoute.name: (routeData) {
      return _i32.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i15.PrivacyPolicyScreen());
    },
    GetHelpRoute.name: (routeData) {
      return _i32.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i16.GetHelpScreen());
    },
    NotificationRoute.name: (routeData) {
      return _i32.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i17.NotificationScreen());
    },
    HowItWorksRoute.name: (routeData) {
      return _i32.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i18.HowItWorksScreen());
    },
    ResultsRoute.name: (routeData) {
      return _i32.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i19.ResultsScreen());
    },
    MapRoute.name: (routeData) {
      return _i32.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i20.MapScreen());
    },
    WinnerRoute.name: (routeData) {
      return _i32.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i21.WinnerScreen());
    },
    WalletRoute.name: (routeData) {
      return _i32.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i22.WalletScreen());
    },
    NumbersRoute.name: (routeData) {
      final args = routeData.argsAs<NumbersRouteArgs>(
          orElse: () => const NumbersRouteArgs());
      return _i32.CupertinoPageX<dynamic>(
          routeData: routeData,
          child:
              _i23.NumbersScreen(key: args.key, withDrawer: args.withDrawer));
    },
    EmployeeHomeInitialPage.name: (routeData) {
      final args = routeData.argsAs<EmployeeHomeInitialPageArgs>();
      return _i32.CupertinoPageX<dynamic>(
          routeData: routeData,
          child: _i24.EmployeeHomeInitialPage(
              key: args.key, routerKey: args.routerKey));
    },
    InvoicesInitialPage.name: (routeData) {
      final args = routeData.argsAs<InvoicesInitialPageArgs>();
      return _i32.CupertinoPageX<dynamic>(
          routeData: routeData,
          child: _i25.InvoicesInitialPage(
              key: args.key, routerKey: args.routerKey));
    },
    ProfileInitialPage.name: (routeData) {
      final args = routeData.argsAs<ProfileInitialPageArgs>();
      return _i32.CupertinoPageX<dynamic>(
          routeData: routeData,
          child: _i26.ProfileInitialPage(
              key: args.key, routerKey: args.routerKey));
    },
    EmployeeHomeRoute.name: (routeData) {
      return _i32.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i27.EmployeeHomeScreen());
    },
    EmployeeNumbersRoute.name: (routeData) {
      final args = routeData.argsAs<EmployeeNumbersRouteArgs>(
          orElse: () => const EmployeeNumbersRouteArgs());
      return _i32.CupertinoPageX<dynamic>(
          routeData: routeData,
          child:
              _i23.NumbersScreen(key: args.key, withDrawer: args.withDrawer));
    },
    ChargeRoute.name: (routeData) {
      return _i32.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i28.ChargeScreen());
    },
    NotSubscriberRoute.name: (routeData) {
      return _i32.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i29.NotSubscriberScreen());
    },
    SubscriberRoute.name: (routeData) {
      return _i32.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i30.SubscriberScreen());
    },
    InvoicesRoute.name: (routeData) {
      return _i32.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i31.InvoicesScreen());
    },
    EmployeeProfileRoute.name: (routeData) {
      return _i32.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i14.ProfileScreen());
    }
  };

  @override
  List<_i32.RouteConfig> get routes => [
        _i32.RouteConfig('/#redirect',
            path: '/', redirectTo: 'login', fullMatch: true),
        _i32.RouteConfig(LogInRoute.name, path: 'login'),
        _i32.RouteConfig(SignUpRoute.name, path: 'sign-up'),
        _i32.RouteConfig(CustomerBottomNavBarRoute.name,
            path: '/main',
            children: [
              _i32.RouteConfig(HomeInitialPage.name, path: 'home', children: [
                _i32.RouteConfig(HomeRoute.name, path: ''),
                _i32.RouteConfig(ProductRoute.name, path: 'product'),
                _i32.RouteConfig(SelectNumberRoute.name, path: 'select-number'),
                _i32.RouteConfig(ClickBuyRoute.name, path: 'click-buy'),
                _i32.RouteConfig(ProfileRoute.name, path: 'profile'),
                _i32.RouteConfig(PrivacyPolicyRoute.name,
                    path: 'privacy-policy'),
                _i32.RouteConfig(GetHelpRoute.name, path: 'get-help'),
                _i32.RouteConfig(NotificationRoute.name, path: 'notification'),
                _i32.RouteConfig(HowItWorksRoute.name, path: 'how-it-works'),
                _i32.RouteConfig(ResultsRoute.name, path: 'results-screen'),
                _i32.RouteConfig('*#redirect',
                    path: '*', redirectTo: '', fullMatch: true)
              ]),
              _i32.RouteConfig(MapInitialPage.name, path: 'map', children: [
                _i32.RouteConfig(MapRoute.name, path: ''),
                _i32.RouteConfig('*#redirect',
                    path: '*', redirectTo: '', fullMatch: true)
              ]),
              _i32.RouteConfig(WinnerInitialPage.name,
                  path: 'winner',
                  children: [
                    _i32.RouteConfig(WinnerRoute.name, path: ''),
                    _i32.RouteConfig(ProfileRoute.name, path: 'profile'),
                    _i32.RouteConfig(PrivacyPolicyRoute.name,
                        path: 'privacy-policy'),
                    _i32.RouteConfig(GetHelpRoute.name, path: 'get-help'),
                    _i32.RouteConfig(NotificationRoute.name,
                        path: 'notification'),
                    _i32.RouteConfig(HowItWorksRoute.name,
                        path: 'how-it-works'),
                    _i32.RouteConfig(ResultsRoute.name, path: 'results-screen'),
                    _i32.RouteConfig('*#redirect',
                        path: '*', redirectTo: '', fullMatch: true)
                  ]),
              _i32.RouteConfig(WalletInitialPage.name,
                  path: 'wallet',
                  children: [
                    _i32.RouteConfig(WalletRoute.name, path: ''),
                    _i32.RouteConfig(ProfileRoute.name, path: 'profile'),
                    _i32.RouteConfig(PrivacyPolicyRoute.name,
                        path: 'privacy-policy'),
                    _i32.RouteConfig(GetHelpRoute.name, path: 'get-help'),
                    _i32.RouteConfig(NotificationRoute.name,
                        path: 'notification'),
                    _i32.RouteConfig(HowItWorksRoute.name,
                        path: 'how-it-works'),
                    _i32.RouteConfig(ResultsRoute.name, path: 'results-screen'),
                    _i32.RouteConfig('*#redirect',
                        path: '*', redirectTo: '', fullMatch: true)
                  ]),
              _i32.RouteConfig(NumbersInitialPage.name,
                  path: 'numbers',
                  children: [
                    _i32.RouteConfig(NumbersRoute.name, path: ''),
                    _i32.RouteConfig(ProfileRoute.name, path: 'profile'),
                    _i32.RouteConfig(PrivacyPolicyRoute.name,
                        path: 'privacy-policy'),
                    _i32.RouteConfig(GetHelpRoute.name, path: 'get-help'),
                    _i32.RouteConfig(ResultsRoute.name, path: 'results-screen'),
                    _i32.RouteConfig(NotificationRoute.name,
                        path: 'notification'),
                    _i32.RouteConfig(HowItWorksRoute.name,
                        path: 'how-it-works'),
                    _i32.RouteConfig('*#redirect',
                        path: '*', redirectTo: '', fullMatch: true)
                  ])
            ]),
        _i32.RouteConfig(EmployeeBottomNavBarRoute.name,
            path: '/employee-main',
            children: [
              _i32.RouteConfig(EmployeeHomeInitialPage.name,
                  path: 'employee-home',
                  children: [
                    _i32.RouteConfig(EmployeeHomeRoute.name, path: ''),
                    _i32.RouteConfig(ProductRoute.name, path: 'product'),
                    _i32.RouteConfig(SelectNumberRoute.name,
                        path: 'select-number'),
                    _i32.RouteConfig(EmployeeNumbersRoute.name,
                        path: 'numbers'),
                    _i32.RouteConfig(ChargeRoute.name, path: 'charge'),
                    _i32.RouteConfig(NotSubscriberRoute.name,
                        path: 'not-subscriber'),
                    _i32.RouteConfig(SubscriberRoute.name, path: 'subscriber'),
                    _i32.RouteConfig('*#redirect',
                        path: '*', redirectTo: '', fullMatch: true)
                  ]),
              _i32.RouteConfig(InvoicesInitialPage.name,
                  path: 'invoices',
                  children: [
                    _i32.RouteConfig(InvoicesRoute.name, path: ''),
                    _i32.RouteConfig('*#redirect',
                        path: '*', redirectTo: '', fullMatch: true)
                  ]),
              _i32.RouteConfig(ProfileInitialPage.name,
                  path: 'employee-profile',
                  children: [
                    _i32.RouteConfig(EmployeeProfileRoute.name, path: ''),
                    _i32.RouteConfig('*#redirect',
                        path: '*', redirectTo: '', fullMatch: true)
                  ])
            ])
      ];
}

/// generated route for [_i1.LogInScreen]
class LogInRoute extends _i32.PageRouteInfo<void> {
  const LogInRoute() : super(name, path: 'login');

  static const String name = 'LogInRoute';
}

/// generated route for [_i2.SignUpScreen]
class SignUpRoute extends _i32.PageRouteInfo<void> {
  const SignUpRoute() : super(name, path: 'sign-up');

  static const String name = 'SignUpRoute';
}

/// generated route for [_i3.CustomerBottomNavBarScreen]
class CustomerBottomNavBarRoute
    extends _i32.PageRouteInfo<CustomerBottomNavBarRouteArgs> {
  CustomerBottomNavBarRoute(
      {_i33.Key? key,
      String? destinationRouteName,
      List<_i32.PageRouteInfo>? children})
      : super(name,
            path: '/main',
            args: CustomerBottomNavBarRouteArgs(
                key: key, destinationRouteName: destinationRouteName),
            initialChildren: children);

  static const String name = 'CustomerBottomNavBarRoute';
}

class CustomerBottomNavBarRouteArgs {
  const CustomerBottomNavBarRouteArgs({this.key, this.destinationRouteName});

  final _i33.Key? key;

  final String? destinationRouteName;
}

/// generated route for [_i4.EmployeeBottomNavBarScreen]
class EmployeeBottomNavBarRoute
    extends _i32.PageRouteInfo<EmployeeBottomNavBarRouteArgs> {
  EmployeeBottomNavBarRoute(
      {_i33.Key? key,
      String? destinationRouteName,
      List<_i32.PageRouteInfo>? children})
      : super(name,
            path: '/employee-main',
            args: EmployeeBottomNavBarRouteArgs(
                key: key, destinationRouteName: destinationRouteName),
            initialChildren: children);

  static const String name = 'EmployeeBottomNavBarRoute';
}

class EmployeeBottomNavBarRouteArgs {
  const EmployeeBottomNavBarRouteArgs({this.key, this.destinationRouteName});

  final _i33.Key? key;

  final String? destinationRouteName;
}

/// generated route for [_i5.HomeInitialPage]
class HomeInitialPage extends _i32.PageRouteInfo<HomeInitialPageArgs> {
  HomeInitialPage(
      {_i33.Key? key,
      required dynamic routerKey,
      List<_i32.PageRouteInfo>? children})
      : super(name,
            path: 'home',
            args: HomeInitialPageArgs(key: key, routerKey: routerKey),
            initialChildren: children);

  static const String name = 'HomeInitialPage';
}

class HomeInitialPageArgs {
  const HomeInitialPageArgs({this.key, required this.routerKey});

  final _i33.Key? key;

  final dynamic routerKey;
}

/// generated route for [_i6.MapInitialPage]
class MapInitialPage extends _i32.PageRouteInfo<MapInitialPageArgs> {
  MapInitialPage(
      {_i33.Key? key,
      required dynamic routerKey,
      List<_i32.PageRouteInfo>? children})
      : super(name,
            path: 'map',
            args: MapInitialPageArgs(key: key, routerKey: routerKey),
            initialChildren: children);

  static const String name = 'MapInitialPage';
}

class MapInitialPageArgs {
  const MapInitialPageArgs({this.key, required this.routerKey});

  final _i33.Key? key;

  final dynamic routerKey;
}

/// generated route for [_i7.WinnerInitialPage]
class WinnerInitialPage extends _i32.PageRouteInfo<WinnerInitialPageArgs> {
  WinnerInitialPage(
      {_i33.Key? key,
      required dynamic routerKey,
      List<_i32.PageRouteInfo>? children})
      : super(name,
            path: 'winner',
            args: WinnerInitialPageArgs(key: key, routerKey: routerKey),
            initialChildren: children);

  static const String name = 'WinnerInitialPage';
}

class WinnerInitialPageArgs {
  const WinnerInitialPageArgs({this.key, required this.routerKey});

  final _i33.Key? key;

  final dynamic routerKey;
}

/// generated route for [_i8.WalletInitialPage]
class WalletInitialPage extends _i32.PageRouteInfo<WalletInitialPageArgs> {
  WalletInitialPage(
      {_i33.Key? key,
      required dynamic routerKey,
      List<_i32.PageRouteInfo>? children})
      : super(name,
            path: 'wallet',
            args: WalletInitialPageArgs(key: key, routerKey: routerKey),
            initialChildren: children);

  static const String name = 'WalletInitialPage';
}

class WalletInitialPageArgs {
  const WalletInitialPageArgs({this.key, required this.routerKey});

  final _i33.Key? key;

  final dynamic routerKey;
}

/// generated route for [_i9.NumbersInitialPage]
class NumbersInitialPage extends _i32.PageRouteInfo<NumbersInitialPageArgs> {
  NumbersInitialPage(
      {_i33.Key? key,
      required dynamic routerKey,
      List<_i32.PageRouteInfo>? children})
      : super(name,
            path: 'numbers',
            args: NumbersInitialPageArgs(key: key, routerKey: routerKey),
            initialChildren: children);

  static const String name = 'NumbersInitialPage';
}

class NumbersInitialPageArgs {
  const NumbersInitialPageArgs({this.key, required this.routerKey});

  final _i33.Key? key;

  final dynamic routerKey;
}

/// generated route for [_i10.HomeScreen]
class HomeRoute extends _i32.PageRouteInfo<void> {
  const HomeRoute() : super(name, path: '');

  static const String name = 'HomeRoute';
}

/// generated route for [_i11.ProductScreen]
class ProductRoute extends _i32.PageRouteInfo<ProductRouteArgs> {
  ProductRoute({_i33.Key? key, bool withDrawer = true})
      : super(name,
            path: 'product',
            args: ProductRouteArgs(key: key, withDrawer: withDrawer));

  static const String name = 'ProductRoute';
}

class ProductRouteArgs {
  const ProductRouteArgs({this.key, this.withDrawer = true});

  final _i33.Key? key;

  final bool withDrawer;
}

/// generated route for [_i12.SelectNumberScreen]
class SelectNumberRoute extends _i32.PageRouteInfo<SelectNumberRouteArgs> {
  SelectNumberRoute({_i33.Key? key, bool withDrawer = true})
      : super(name,
            path: 'select-number',
            args: SelectNumberRouteArgs(key: key, withDrawer: withDrawer));

  static const String name = 'SelectNumberRoute';
}

class SelectNumberRouteArgs {
  const SelectNumberRouteArgs({this.key, this.withDrawer = true});

  final _i33.Key? key;

  final bool withDrawer;
}

/// generated route for [_i13.ClickBuyScreen]
class ClickBuyRoute extends _i32.PageRouteInfo<void> {
  const ClickBuyRoute() : super(name, path: 'click-buy');

  static const String name = 'ClickBuyRoute';
}

/// generated route for [_i14.ProfileScreen]
class ProfileRoute extends _i32.PageRouteInfo<void> {
  const ProfileRoute() : super(name, path: 'profile');

  static const String name = 'ProfileRoute';
}

/// generated route for [_i15.PrivacyPolicyScreen]
class PrivacyPolicyRoute extends _i32.PageRouteInfo<void> {
  const PrivacyPolicyRoute() : super(name, path: 'privacy-policy');

  static const String name = 'PrivacyPolicyRoute';
}

/// generated route for [_i16.GetHelpScreen]
class GetHelpRoute extends _i32.PageRouteInfo<void> {
  const GetHelpRoute() : super(name, path: 'get-help');

  static const String name = 'GetHelpRoute';
}

/// generated route for [_i17.NotificationScreen]
class NotificationRoute extends _i32.PageRouteInfo<void> {
  const NotificationRoute() : super(name, path: 'notification');

  static const String name = 'NotificationRoute';
}

/// generated route for [_i18.HowItWorksScreen]
class HowItWorksRoute extends _i32.PageRouteInfo<void> {
  const HowItWorksRoute() : super(name, path: 'how-it-works');

  static const String name = 'HowItWorksRoute';
}

/// generated route for [_i19.ResultsScreen]
class ResultsRoute extends _i32.PageRouteInfo<void> {
  const ResultsRoute() : super(name, path: 'results-screen');

  static const String name = 'ResultsRoute';
}

/// generated route for [_i20.MapScreen]
class MapRoute extends _i32.PageRouteInfo<void> {
  const MapRoute() : super(name, path: '');

  static const String name = 'MapRoute';
}

/// generated route for [_i21.WinnerScreen]
class WinnerRoute extends _i32.PageRouteInfo<void> {
  const WinnerRoute() : super(name, path: '');

  static const String name = 'WinnerRoute';
}

/// generated route for [_i22.WalletScreen]
class WalletRoute extends _i32.PageRouteInfo<void> {
  const WalletRoute() : super(name, path: '');

  static const String name = 'WalletRoute';
}

/// generated route for [_i23.NumbersScreen]
class NumbersRoute extends _i32.PageRouteInfo<NumbersRouteArgs> {
  NumbersRoute({_i33.Key? key, bool withDrawer = true})
      : super(name,
            path: '', args: NumbersRouteArgs(key: key, withDrawer: withDrawer));

  static const String name = 'NumbersRoute';
}

class NumbersRouteArgs {
  const NumbersRouteArgs({this.key, this.withDrawer = true});

  final _i33.Key? key;

  final bool withDrawer;
}

/// generated route for [_i24.EmployeeHomeInitialPage]
class EmployeeHomeInitialPage
    extends _i32.PageRouteInfo<EmployeeHomeInitialPageArgs> {
  EmployeeHomeInitialPage(
      {_i33.Key? key,
      required dynamic routerKey,
      List<_i32.PageRouteInfo>? children})
      : super(name,
            path: 'employee-home',
            args: EmployeeHomeInitialPageArgs(key: key, routerKey: routerKey),
            initialChildren: children);

  static const String name = 'EmployeeHomeInitialPage';
}

class EmployeeHomeInitialPageArgs {
  const EmployeeHomeInitialPageArgs({this.key, required this.routerKey});

  final _i33.Key? key;

  final dynamic routerKey;
}

/// generated route for [_i25.InvoicesInitialPage]
class InvoicesInitialPage extends _i32.PageRouteInfo<InvoicesInitialPageArgs> {
  InvoicesInitialPage(
      {_i33.Key? key,
      required dynamic routerKey,
      List<_i32.PageRouteInfo>? children})
      : super(name,
            path: 'invoices',
            args: InvoicesInitialPageArgs(key: key, routerKey: routerKey),
            initialChildren: children);

  static const String name = 'InvoicesInitialPage';
}

class InvoicesInitialPageArgs {
  const InvoicesInitialPageArgs({this.key, required this.routerKey});

  final _i33.Key? key;

  final dynamic routerKey;
}

/// generated route for [_i26.ProfileInitialPage]
class ProfileInitialPage extends _i32.PageRouteInfo<ProfileInitialPageArgs> {
  ProfileInitialPage(
      {_i33.Key? key,
      required dynamic routerKey,
      List<_i32.PageRouteInfo>? children})
      : super(name,
            path: 'employee-profile',
            args: ProfileInitialPageArgs(key: key, routerKey: routerKey),
            initialChildren: children);

  static const String name = 'ProfileInitialPage';
}

class ProfileInitialPageArgs {
  const ProfileInitialPageArgs({this.key, required this.routerKey});

  final _i33.Key? key;

  final dynamic routerKey;
}

/// generated route for [_i27.EmployeeHomeScreen]
class EmployeeHomeRoute extends _i32.PageRouteInfo<void> {
  const EmployeeHomeRoute() : super(name, path: '');

  static const String name = 'EmployeeHomeRoute';
}

/// generated route for [_i23.NumbersScreen]
class EmployeeNumbersRoute
    extends _i32.PageRouteInfo<EmployeeNumbersRouteArgs> {
  EmployeeNumbersRoute({_i33.Key? key, bool withDrawer = true})
      : super(name,
            path: 'numbers',
            args: EmployeeNumbersRouteArgs(key: key, withDrawer: withDrawer));

  static const String name = 'EmployeeNumbersRoute';
}

class EmployeeNumbersRouteArgs {
  const EmployeeNumbersRouteArgs({this.key, this.withDrawer = true});

  final _i33.Key? key;

  final bool withDrawer;
}

/// generated route for [_i28.ChargeScreen]
class ChargeRoute extends _i32.PageRouteInfo<void> {
  const ChargeRoute() : super(name, path: 'charge');

  static const String name = 'ChargeRoute';
}

/// generated route for [_i29.NotSubscriberScreen]
class NotSubscriberRoute extends _i32.PageRouteInfo<void> {
  const NotSubscriberRoute() : super(name, path: 'not-subscriber');

  static const String name = 'NotSubscriberRoute';
}

/// generated route for [_i30.SubscriberScreen]
class SubscriberRoute extends _i32.PageRouteInfo<void> {
  const SubscriberRoute() : super(name, path: 'subscriber');

  static const String name = 'SubscriberRoute';
}

/// generated route for [_i31.InvoicesScreen]
class InvoicesRoute extends _i32.PageRouteInfo<void> {
  const InvoicesRoute() : super(name, path: '');

  static const String name = 'InvoicesRoute';
}

/// generated route for [_i14.ProfileScreen]
class EmployeeProfileRoute extends _i32.PageRouteInfo<void> {
  const EmployeeProfileRoute() : super(name, path: '');

  static const String name = 'EmployeeProfileRoute';
}

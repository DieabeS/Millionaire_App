// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
import 'package:auto_route/auto_route.dart';
import 'package:millionaire_app/ui/screens/charge_screen/charge_screen.dart';
import 'package:millionaire_app/ui/screens/click_buy_screen.dart/click_buy_screen.dart';
import 'package:millionaire_app/ui/screens/customer_bottom_nav_bar_screen.dart';
import 'package:millionaire_app/ui/screens/drawer/how_it_works_screen.dart';
import 'package:millionaire_app/ui/screens/drawer/notification_screen.dart';
import 'package:millionaire_app/ui/screens/drawer/privacy_policy_screen.dart';
import 'package:millionaire_app/ui/screens/drawer/profile_screen.dart';
import 'package:millionaire_app/ui/screens/employee_bottom_nav_bar_screen.dart';
import 'package:millionaire_app/ui/screens/get_help_screen.dart/get_help_screen.dart';
import 'package:millionaire_app/ui/screens/home_screen/employee_home_screen.dart';
import 'package:millionaire_app/ui/screens/home_screen/home_screen.dart';
import 'package:millionaire_app/ui/screens/home_tab_pages/employee_home_initial_page.dart';
import 'package:millionaire_app/ui/screens/home_tab_pages/home_body_inital_page.dart';
import 'package:millionaire_app/ui/screens/home_tab_pages/invoices_initial_page.dart';
import 'package:millionaire_app/ui/screens/home_tab_pages/map_inital_page.dart';
import 'package:millionaire_app/ui/screens/home_tab_pages/profile_initial_page.dart';
import 'package:millionaire_app/ui/screens/home_tab_pages/wallet_initial_page.dart';
import 'package:millionaire_app/ui/screens/home_tab_pages/numbers_initial_page.dart';
import 'package:millionaire_app/ui/screens/home_tab_pages/winner_inital_page.dart';
import 'package:millionaire_app/ui/screens/invoices_screen/invoices_screen.dart';
import 'package:millionaire_app/ui/screens/login_screen/login_screen.dart';
import 'package:millionaire_app/ui/screens/map_screen/map_screen.dart';
import 'package:millionaire_app/ui/screens/notsubscriber_screen/notsubscriber_screen.dart';
import 'package:millionaire_app/ui/screens/numbers_screen/numbers_screen.dart';
import 'package:millionaire_app/ui/screens/product_screen/product_screen.dart';
import 'package:millionaire_app/ui/screens/results_screen/results_screen.dart';
import 'package:millionaire_app/ui/screens/select_number_screen/select_number_screen.dart';
import 'package:millionaire_app/ui/screens/settings_screen/wallet_screen/wallet_screen.dart';
import 'package:millionaire_app/ui/screens/sign_up_screen.dart/sign_up_screen.dart';
import 'package:millionaire_app/ui/screens/subscriber_screen/subscriber_screen.dart';
import 'package:millionaire_app/ui/screens/winner_screen/winner_screen.dart';

@CupertinoAutoRouter(replaceInRouteName: 'Screen,Route', routes: <AutoRoute>[
  // AutoRoute(path: '/main', page: BottomNavBarScreen, initial: true),
  AutoRoute(
    path: 'login',
    initial: true,
    page: LogInScreen,
  ),
  AutoRoute(
    path: 'sign-up',
    page: SignUpScreen,
  ),

  AutoRoute(
    path: '/main',
    // initial: true,
    page: CustomerBottomNavBarScreen,
    children: [
      AutoRoute(path: 'home', page: HomeInitialPage, maintainState: true, children: [
        AutoRoute(
          path: '',
          page: HomeScreen,
        ),
        AutoRoute(
          path: 'product',
          page: ProductScreen,
        ),
        AutoRoute(
          path: 'select-number',
          page: SelectNumberScreen,
        ),
        AutoRoute(
          path: 'click-buy',
          page: ClickBuyScreen,
        ),
        AutoRoute(
          path: 'profile',
          page: ProfileScreen,
        ),
        AutoRoute(
          path: 'privacy-policy',
          page: PrivacyPolicyScreen,
        ),
        AutoRoute(
          path: 'get-help',
          page: GetHelpScreen,
        ),
            AutoRoute(
          path: 'notification',
          page: NotificationScreen,
        ),
        AutoRoute(
          path: 'how-it-works',
          page: HowItWorksScreen,
        ),
        AutoRoute(
          path: 'results-screen',
          page: ResultsScreen,
        ),
        RedirectRoute(path: '*', redirectTo: '')
      ]),
      AutoRoute(path: 'map', page: MapInitialPage, maintainState: true, children: [
        AutoRoute(
          path: '',
          page: MapScreen,
        ),
        RedirectRoute(path: '*', redirectTo: '')
      ]),
      AutoRoute(path: 'winner', page: WinnerInitialPage, maintainState: true, children: [
        AutoRoute(
          path: '',
          page: WinnerScreen,
        ),
        AutoRoute(
          path: 'profile',
          page: ProfileScreen,
        ),
        AutoRoute(
          path: 'privacy-policy',
          page: PrivacyPolicyScreen,
        ),
        AutoRoute(
          path: 'get-help',
          page: GetHelpScreen,
        ),
              AutoRoute(
          path: 'notification',
          page: NotificationScreen,
        ),
        AutoRoute(
          path: 'how-it-works',
          page: HowItWorksScreen,
        ),
        AutoRoute(
          path: 'results-screen',
          page: ResultsScreen,
        ),
        RedirectRoute(path: '*', redirectTo: '')
      ]),
      AutoRoute(path: 'wallet', page: WalletInitialPage, maintainState: true, children: [
        AutoRoute(
          path: '',
          page: WalletScreen,
        ),
        AutoRoute(
          path: 'profile',
          page: ProfileScreen,
        ),
        AutoRoute(
          path: 'privacy-policy',
          page: PrivacyPolicyScreen,
        ),
        AutoRoute(
          path: 'get-help',
          page: GetHelpScreen,
        ),
              AutoRoute(
          path: 'notification',
          page: NotificationScreen,
        ),
        AutoRoute(
          path: 'how-it-works',
          page: HowItWorksScreen,
        ),
        AutoRoute(
          path: 'results-screen',
          page: ResultsScreen,
        ),
        RedirectRoute(path: '*', redirectTo: '')
      ]),
      AutoRoute(path: 'numbers', page: NumbersInitialPage, maintainState: true, children: [
        AutoRoute(
          path: '',
          page: NumbersScreen,
        ),
        AutoRoute(
          path: 'profile',
          page: ProfileScreen,
        ),
        AutoRoute(
          path: 'privacy-policy',
          page: PrivacyPolicyScreen,
        ),
        AutoRoute(
          path: 'get-help',
          page: GetHelpScreen,
        ),
        AutoRoute(
          path: 'results-screen',
          page: ResultsScreen,
        ),
              AutoRoute(
          path: 'notification',
          page: NotificationScreen,
        ),
        AutoRoute(
          path: 'how-it-works',
          page: HowItWorksScreen,
        ),
      
        RedirectRoute(path: '*', redirectTo: '')
      ]),
    ],
  ),
  AutoRoute(path: '/employee-main', page: EmployeeBottomNavBarScreen, children: [
    AutoRoute(path: 'employee-home', page: EmployeeHomeInitialPage, maintainState: true, children: [
      AutoRoute(
        path: '',
        page: EmployeeHomeScreen,
      ),
      AutoRoute(
        path: 'product',
        // name:'Emplo'
        page: ProductScreen,
      ),
      AutoRoute(
        path: 'select-number',
        page: SelectNumberScreen,
      ),
      AutoRoute(
        path: 'numbers',
        name: "EmployeeNumbersRoute",
        page: NumbersScreen,
      ),
      AutoRoute(
        path: 'charge',
        page: ChargeScreen,
      ),
        AutoRoute(
        path: 'not-subscriber',
        page: NotSubscriberScreen,
      ),
      AutoRoute(
        path: 'subscriber',
        page: SubscriberScreen,
      ),
      RedirectRoute(path: '*', redirectTo: '')
    ]),
    AutoRoute(path: 'invoices', page: InvoicesInitialPage, maintainState: true, children: [
      AutoRoute(
        path: '',
        page: InvoicesScreen,
      ),
      RedirectRoute(path: '*', redirectTo: '')
    ]),
    AutoRoute(
        path: 'employee-profile',
        page: ProfileInitialPage,
        maintainState: true,
        children: [
      AutoRoute(
        path: '',
        name: 'EmployeeProfileRoute',
        page: ProfileScreen,
      ),
      RedirectRoute(path: '*', redirectTo: '')
    ]),
  ])
])
class $AppRouter {}

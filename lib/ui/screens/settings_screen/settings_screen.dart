import 'package:auto_route/src/router/auto_router_x.dart';
import "package:flutter/material.dart";
import 'package:millionaire_app/managers/resource_manager.dart';
import 'package:millionaire_app/route/auto_route.gr.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../constants.dart';
import 'components/settings_group.dart';
import 'components/social_card.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  settingsGradientStart.withOpacity(0.34),
                  settingsGradientEnd.withOpacity(0.34)
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 29),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Image.asset(
                          ResourceManager.getResource(name: "mini_logo.png")),
                      const SizedBox(
                        height: 33,
                      ),
                      Text(
                        "Account Setting".tr(),
                        style: const TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SettingsGroup(
                        icons: _accountIcons,
                        options: _accountOptions,
                        functionsList: _accountOptionsActions,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Support".tr(),
                        style: const TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SettingsGroup(
                          icons: _supportIcons,
                          options: _supportOptions,
                          functionsList: _supportOptionsActions),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "General".tr(),
                        style: const TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SettingsGroup(
                        icons: _generalIcons,
                        options: _generalOptions,
                        functionsList: _generaltOptionsActions,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SocialCard(
                            icon: ResourceManager.getResource(
                                name: "facebook.png"),
                            onSocialCardPressed: () {},
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SocialCard(
                            icon: ResourceManager.getResource(
                                name: "twitter.png"),
                            onSocialCardPressed: () {},
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SocialCard(
                            icon: ResourceManager.getResource(
                                name: "instagram.png"),
                            onSocialCardPressed: () {},
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  final List<String> _accountOptions = [
    'Profile',
    'Notification',
    'Change password',
    'Old purchase'
  ];
  final List<String> _accountIcons = [
    ResourceManager.getResource(name: 'profile.png'),
    ResourceManager.getResource(name: 'notification.png'),
    ResourceManager.getResource(name: 'change_password.png'),
    ResourceManager.getResource(name: 'old_purchases.png'),
  ];

  final List<String> _supportOptions = [
    'How it works?',
    'Get Help/ Send Feedback',
    'Privacy Policy',
  ];
  final List<String> _supportIcons = [
    ResourceManager.getResource(name: 'question.png'),
    ResourceManager.getResource(name: 'support.png'),
    ResourceManager.getResource(name: 'privacy_policy.png'),
  ];
  final List<String> _generalOptions = [
    'Change Language',
    'Log out',
    "Register"
  ];
  final List<String> _generalIcons = [
    ResourceManager.getResource(name: 'translate.png'),
    ResourceManager.getResource(name: 'log_out.png'),
    ResourceManager.getResource(name: 'register.png'),
  ];

  List<Function()> get _accountOptionsActions {
    List<Function()> _accountOptionsActions = [];

    for (String item in _accountOptions) {
      switch (item) {
        case 'Profile':
          _accountOptionsActions.add(() => context.router.push(ProfileRoute()));
          break;
        case 'Notification':
          _accountOptionsActions.add(() => context.router.push(const NotificationRoute()));

          break;
        case 'Change password':
          _accountOptionsActions.add(() => print("password"));
          break;
        case 'Old purchase':
          _accountOptionsActions.add(() => context.router.push(const ResultsRoute()));

          break;
      }
    }

    return _accountOptionsActions;
  }

  List<Function()> get _supportOptionsActions {
    List<Function()> _supportOptionsActions = [];

    for (String item in _supportOptions) {
      switch (item) {
        case 'How it works?':
          _supportOptionsActions.add(() => context.router.push(const HowItWorksRoute()));

          break;
        case 'Get Help/ Send Feedback':
          _supportOptionsActions.add(() => context.router.push(GetHelpRoute()));

          break;
        case 'Privacy Policy':
          _supportOptionsActions
              .add(() => context.router.push(PrivacyPolicyRoute()));

          break;
      }
    }

    return _supportOptionsActions;
  }

  List<Function()> get _generaltOptionsActions {
    List<Function()> _generaltOptionsActions = [];

    for (String item in _generalOptions) {
      switch (item) {
        case 'Change Language':
          _generaltOptionsActions.add(() => print("change"));

          break;
        case 'Log out':
          _generaltOptionsActions.add(() => print("log out"));

          break;
        case 'Register':
          _generaltOptionsActions.add(() => print("register"));

          break;
      }
    }

    return _generaltOptionsActions;
  }
}

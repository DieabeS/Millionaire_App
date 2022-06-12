import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:millionaire_app/main.dart';
import 'package:millionaire_app/managers/resource_manager.dart';
import 'package:millionaire_app/ui/screens/drawer/settings_drawer.dart';
import 'package:millionaire_app/ui/widgets/bouncing_animated_widget.dart';
import 'package:millionaire_app/ui/widgets/custom_progress_indicator.dart';
import 'package:millionaire_app/ui/widgets/with_draw_or_deposite_card.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../constants.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen>
    with TickerProviderStateMixin {
  bool dataIsEmpty = false;

  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);
    double screenWidth = MediaQuery.of(context).size.width;

    double inputWidth = (screenWidth > 400) ? 400 : (screenWidth * 75 / 100);

    return Container(
        color: accentColor,
        child: SafeArea(
            child: Scaffold(
                key: scaffoldKey,
                drawer: const SettingsDrawer(),
                body: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: buildBackGroundGradient(),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 28),
                          child: BounceAnimatedWidget(
                              onTap: () {
                                scaffoldKey.currentState?.openDrawer();
                                Scaffold.of(context).openDrawer();
                              },
                              child: Image.asset(ResourceManager.getResource(
                                  name: "mini_logo.png"))),
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        const Center(
                          child: CustomProgressIndicator(
                            backgroundColor: scaffoldBackgroundColor,
                          ),
                        ),
                        const SizedBox(
                          height: 45,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: (screenWidth - inputWidth) / 2),
                          child: Row(
                            children: [
                              Image.asset(ResourceManager.getResource(
                                  name: 'price_ticket.png')),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                'Amount in wallet'.tr(),
                                style: const TextStyle(fontSize: 20),
                              ),
                              const SizedBox(width: 85),
                              Column(
                                children: [
                                  const Text(
                                    '3456IQD',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  const SizedBox(height: 12),
                                  Container(
                                    width: 95,
                                    height: 3,
                                    color: Colors.yellow,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 95),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: (screenWidth - inputWidth) / 2),
                          child: TabBar(
                            labelPadding: const EdgeInsets.only(bottom: 20),
                            labelStyle: const TextStyle(fontSize: 20),
                            controller: tabController,
                            unselectedLabelColor: mainText,
                            labelColor: mainText,
                            indicatorColor: Colors.red,
                            indicatorPadding:
                                const EdgeInsets.symmetric(horizontal: 40),
                            tabs: [
                              Text("Withdrawals".tr()),
                              Text("Deposits".tr()),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: (screenWidth - inputWidth) / 2),
                          child: SizedBox(
                            height: 400,
                            child: TabBarView(
                              controller: tabController,
                              children: [
                                if (dataIsEmpty)
                                  Center(
                                    child: Text(
                                      "There is no withdrawals to show".tr(),
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: lightTextColor,
                                      ),
                                    ),
                                  ),
                                if (!dataIsEmpty)
                                  ListView.builder(
                                      itemCount: 5,
                                      itemBuilder: (context, index) {
                                        return const Padding(
                                          padding: EdgeInsets.only(
                                              top: 20, left: 20, right: 20),
                                          child: WithDrawOrDepositeCard(),
                                        );
                                      }),
                                if (!dataIsEmpty)
                                  Center(
                                    child: Text(
                                      "There is no deposits to show".tr(),
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: lightTextColor,
                                      ),
                                    ),
                                  ),
                                if (dataIsEmpty)
                                  ListView.builder(
                                      itemCount: 10,
                                      itemBuilder: (context, index) {
                                        return const Padding(
                                          padding: EdgeInsets.only(
                                              top: 20, left: 20, right: 20),
                                          child: WithDrawOrDepositeCard(),
                                        );
                                      }),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ))));
  }
}

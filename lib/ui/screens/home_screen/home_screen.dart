import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter/material.dart';
import 'package:millionaire_app/constants.dart';
import 'package:millionaire_app/managers/resource_manager.dart';
import 'package:millionaire_app/route/auto_route.gr.dart';
import 'package:millionaire_app/ui/screens/drawer/settings_drawer.dart';
import 'package:millionaire_app/ui/widgets/bouncing_animated_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'components/grand_prize_card.dart';
import 'components/home_action_container.dart';
import 'components/home_appbar_page.dart';
import 'components/home_card_widget.dart';
import 'components/winner_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 0;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double inputWidth = (screenWidth > 400) ? 400 : (screenWidth * 75 / 100);
    return SafeArea(
      child: Scaffold(
        backgroundColor: scaffoldBackgroundColor,
        key: scaffoldKey,
        drawer: const SettingsDrawer(),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 370,
              actions: [
                BounceAnimatedWidget(
                    onTap: () {
                      context.router.push(const ProfileRoute());
                    },
                    child: Container(
                      margin: const EdgeInsetsDirectional.only(top: 16, end: 8),
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: Image.asset(
                          ResourceManager.getResource(name: 'profile.png')),
                    ))
              ],
              elevation: 0,
              leading: BounceAnimatedWidget(
                onTap: () {
                  scaffoldKey.currentState?.openDrawer();
                },
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(top: 16, start: 8),
                  child: Image.asset(
                      ResourceManager.getResource(name: 'mini_logo.png')),
                ),
              ),
              backgroundColor: Colors.transparent,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    PageView(
                      onPageChanged: (value) {
                        setState(() {
                          currentPage = value;
                        });
                      },
                      children: [
                        HomeAppBarPage(
                          image: ResourceManager.getResource(
                              name: 'home_image.png'),
                          widgets: [
                            Text(
                              "Charitable organization".tr(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 20),
                            ),
                            const SizedBox(height: 18),
                            Text(
                              "Charitable organization".tr(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 20),
                            ),
                          ],
                        ),
                        HomeAppBarPage(
                          image: ResourceManager.getResource(
                              name: 'home_image2.png'),
                          widgets: [
                            Text(
                              "Charitable organization".tr(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 20),
                            ),
                            const SizedBox(height: 18),
                            Text(
                              "Charitable organization".tr(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 20),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 13, bottom: 40),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Row(
                            children: List.generate(
                          2,
                          (index) => buildDot(index: index),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: (screenWidth - inputWidth) / 2, vertical: 20),
                child: const HomeCardWidget(),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: (screenWidth - inputWidth) / 2, vertical: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Latest Draw Results'.tr(),
                        style: const TextStyle(fontSize: 20, color: mainText),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                      width: 16,
                      child: Image.asset(
                          ResourceManager.getResource(name: 'calendar.png')),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      '3/6/2022',
                      style: TextStyle(color: mainText, fontSize: 16),
                    )
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
                child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: (screenWidth - inputWidth) / 2, vertical: 20),
              child: const GrandPrizeCard(),
            )),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: (screenWidth - inputWidth) / 2, vertical: 20),
                child: Row(
                  children: [
                    const Icon(
                      Icons.star,
                      size: 25,
                      color: iconsColor,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                        'All winners'.tr(),
                        style: const TextStyle(fontSize: 20, color: mainText),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                      width: 16,
                      child: Image.asset(
                          ResourceManager.getResource(name: 'calendar.png')),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      '3/6/2022',
                      style: TextStyle(color: mainText, fontSize: 16),
                    )
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
                child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: (screenWidth - inputWidth) / 2, vertical: 20),
              child: BounceAnimatedWidget(
                  onTap: () {
                    navBarGlobalKey.currentState!.currentTabsRouter!
                        .setActiveIndex(2);
                  },
                  child: const WinnersCardWidget()),
            )),
            SliverToBoxAdapter(
                child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: (screenWidth - inputWidth) / 2, vertical: 20),
              child: Row(
                children: [
                  Image.asset(
                    ResourceManager.getResource(name: 'question_mark.png'),
                    height: 20,
                    width: 20,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      'How To Play'.tr(),
                      style: const TextStyle(fontSize: 20, color: mainText),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                    width: 16,
                    child: Image.asset(
                        ResourceManager.getResource(name: 'calendar.png')),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    '3/6/2022',
                    style: TextStyle(color: mainText, fontSize: 16),
                  )
                ],
              ),
            )),
            SliverToBoxAdapter(
                child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: (screenWidth - inputWidth) / 2, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HomeActionContainer(
                      onCardClicked: () {},
                      image: ResourceManager.getResource(
                          name: 'create_account.png'),
                      text: 'Create\naccount'.tr()),
                  const SizedBox(width: 10),
                  HomeActionContainer(
                      onCardClicked: () {},
                      image: ResourceManager.getResource(
                          name: 'selection_item.png'),
                      text: 'selection\nitem'.tr()),
                  const SizedBox(width: 10),
                  HomeActionContainer(
                      onCardClicked: () {
                        context.router.push(const ClickBuyRoute());
                      },
                      image: ResourceManager.getResource(name: 'click_buy.png'),
                      text: 'Click\nbuy'.tr()),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: (8)),
      height: (6),
      width: currentPage == index ? (27) : (11),
      decoration: BoxDecoration(
        color: currentPage == index
            ? const Color(0xFF707070)
            : const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular((3)),
      ),
    );
  }
}

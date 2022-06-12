import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter/material.dart';
import 'package:millionaire_app/helpers/dialog_helper.dart';
import 'package:millionaire_app/managers/resource_manager.dart';
import 'package:millionaire_app/route/auto_route.gr.dart';
import 'package:millionaire_app/ui/popups/login_popup.dart';
import 'package:millionaire_app/ui/screens/drawer/settings_drawer.dart';
import 'package:millionaire_app/ui/widgets/bouncing_animated_widget.dart';
import 'package:millionaire_app/ui/widgets/custom_progress_indicator.dart';
import 'package:millionaire_app/ui/widgets/default_button.dart';

import '../../../constants.dart';
import 'package:easy_localization/easy_localization.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key, this.withDrawer = true}) : super(key: key);
  final bool withDrawer;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int count = 1;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double inputWidth = (screenWidth > 400) ? 400 : (screenWidth * 75 / 100);
    return Container(
      color: accentColor,
      child: SafeArea(
        child: Scaffold(
          drawer: widget.withDrawer ? const SettingsDrawer() : null,
          key: scaffoldKey,
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
                  if (widget.withDrawer)
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
                    height: 79,
                  ),
                  BounceAnimatedWidget(
                    onTap: () {
                      DialogHelper.showAnimatedDialog(
                          context, LoginPopup(onConfirmClicked: () {}));
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: (screenWidth - inputWidth) / 2),
                      child: Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.topCenter,
                        children: [
                          Container(
                            height: 370,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(69),
                              color: Colors.white,
                            ),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Image.asset(
                                ResourceManager.getResource(
                                    name: 'product.png'),
                              ),
                            ),
                          ),
                          const Positioned(
                              top: -42,
                              child: CustomProgressIndicator(
                                  withBorder: true,
                                  fillColor: scaffoldBackgroundColor,
                                  backgroundColor: Colors.white))
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: (screenWidth - inputWidth) / 2),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: Container(
                        color: Colors.white,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                'Name of Product'.tr(),
                                style: const TextStyle(
                                    color: mainText, fontSize: 20),
                              ),
                              const SizedBox(
                                height: 26,
                              ),
                              const Text(
                                'Lorem ipsum dolor sit amet consectetur \nNesciunt aut accusamus numquam et? \nAccusamus incidunt',
                                style: TextStyle(color: mainText, fontSize: 20),
                              ),
                              const SizedBox(
                                height: 29,
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    ResourceManager.getResource(
                                        name: 'price.png'),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  const Text(
                                    '14.00 IQD',
                                    style: TextStyle(
                                        color: Color(0xFFFE7B7B), fontSize: 18),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 26,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 19,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            count--;
                          });
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  const Color(0xFF8BE2F7).withOpacity(0.75),
                                  const Color(0xFFB4F5F5)
                                ]),
                              ),
                              padding: const EdgeInsets.all(14),
                              child: const Icon(Icons.remove)),
                        ),
                      ),
                      const SizedBox(width: 11),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(23),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 35, vertical: 27),
                          color: Colors.white,
                          child: Text(
                            count.toString(),
                            style: const TextStyle(
                                fontSize: 29, color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(width: 11),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            count++;
                          });
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  const Color(0xFF8BE2F7).withOpacity(0.75),
                                  const Color(0xFFB4F5F5)
                                ]),
                              ),
                              padding: const EdgeInsets.all(14),
                              child: const Icon(Icons.add)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: (screenWidth - inputWidth) / 2),
                    child: Row(
                      children: [
                        Image.asset(ResourceManager.getResource(
                          name: 'crown.png',
                        )),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            'Number of draws'.tr(),
                            style:
                                const TextStyle(fontSize: 20, color: mainText),
                          ),
                        ),
                        const Text(
                          '3/6/2022',
                          style: TextStyle(color: mainText, fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: (screenWidth - inputWidth) / 2),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(23),
                      child: Container(
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Row(
                          children: [
                            Image.asset(
                              ResourceManager.getResource(name: 'donate.png'),
                            ),
                            Expanded(
                              child: Text(
                                'Donating to'.tr(),
                                style: const TextStyle(
                                    fontSize: 20, color: mainText),
                              ),
                            ),
                            const Text(
                              'almahaba',
                              style: TextStyle(fontSize: 20, color: mainText),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: (screenWidth - inputWidth) / 2),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(23),
                      child: Container(
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Row(
                          children: [
                            Image.asset(
                              ResourceManager.getResource(
                                  name: 'total_price.png'),
                            ),
                            Expanded(
                              child: Text(
                                'Total price'.tr(),
                                style: const TextStyle(
                                    fontSize: 20, color: mainText),
                              ),
                            ),
                            const Text(
                              '200 IQD',
                              style: TextStyle(fontSize: 20, color: mainText),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 60),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: (screenWidth - inputWidth) / 2),
                    child: DefaultButton(
                        text: 'Purchase'.tr(),
                        onButtonPressed: () {
                          context.router.push(
                              SelectNumberRoute(withDrawer: widget.withDrawer));
                        }),
                  ),
                  const SizedBox(height: 46),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

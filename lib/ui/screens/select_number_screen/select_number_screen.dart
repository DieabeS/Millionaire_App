import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter/material.dart';
import 'package:millionaire_app/managers/resource_manager.dart';
import 'package:millionaire_app/route/auto_route.gr.dart';
import 'package:millionaire_app/ui/screens/drawer/settings_drawer.dart';
import 'package:millionaire_app/ui/screens/settings_screen/settings_screen.dart';
import 'package:millionaire_app/ui/widgets/bouncing_animated_widget.dart';
import 'package:millionaire_app/ui/widgets/custom_progress_indicator.dart';
import 'package:millionaire_app/ui/widgets/default_button.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../constants.dart';

class SelectNumberScreen extends StatefulWidget {
  const SelectNumberScreen({Key? key, this.withDrawer = true})
      : super(key: key);
  final bool withDrawer;

  @override
  State<SelectNumberScreen> createState() => _SelectNumberScreenState();
}

class _SelectNumberScreenState extends State<SelectNumberScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double inputWidth = (screenWidth > 400) ? 400 : (screenWidth * 75 / 100);
    return Container(
      color: accentColor,
      child: SafeArea(
        child: Scaffold(
          key: scaffoldKey,
          drawer: widget.withDrawer ? const SettingsDrawer() : null,
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
                  const Center(
                      child: CustomProgressIndicator(
                    backgroundColor: Colors.white,
                  )),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: (screenWidth - inputWidth) / 2),
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
                            'Select the numbers'.tr(),
                            style:
                                const TextStyle(fontSize: 20, color: mainText),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: (screenWidth - inputWidth) / 2),
                    child: const NumbersContainer(
                      line: 'Line 1',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: (screenWidth - inputWidth) / 2),
                    child: DefaultButton(
                        text: 'Next'.tr(),
                        onButtonPressed: () {
                          if (navBarGlobalKey.currentState == null) {
                            context.router
                                .push(EmployeeNumbersRoute(withDrawer: false));
                          } else {
                            navBarGlobalKey.currentState!.currentTabsRouter!
                                .setActiveIndex(3);
                          }
                        }),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NumbersContainer extends StatefulWidget {
  const NumbersContainer({
    Key? key,
    required this.line,
  }) : super(key: key);
  final String line;

  @override
  State<NumbersContainer> createState() => _NumbersContainerState();
}

class _NumbersContainerState extends State<NumbersContainer> {
  List<bool> selectedList = List.filled(49, false);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xFFF6FAFA),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 1, color: subtitleColor)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    topLeft: Radius.circular(15)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      spreadRadius: 0,
                      blurRadius: 6,
                      offset: Offset(0, 3))
                ]),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
              child: Text(
                widget.line,
                style: const TextStyle(
                    color: accentColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            height: 350,
            width: double.infinity,
            child: GridView.count(
              physics: const BouncingScrollPhysics(),
              crossAxisCount: 7,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: List.generate(
                49,
                (index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedList[index] = true;
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                        decoration: BoxDecoration(
                          color:
                              selectedList[index] ? accentColor : Colors.white,
                        ),
                        child: Center(
                            child: Text(
                          (index + 1).toString(),
                          style: TextStyle(
                              color: selectedList[index]
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.bold),
                        ))),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BounceAnimatedWidget(
                      onTap: () {},
                      child: Image.asset(
                          ResourceManager.getResource(name: 'shuffle.png'))),
                  BounceAnimatedWidget(
                      onTap: () {
                        setState(() {
                          selectedList = List.filled(49, false);
                        });
                      },
                      child: Image.asset(
                          ResourceManager.getResource(name: 'close.png')))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:millionaire_app/helpers/local_provider.dart';
import 'package:millionaire_app/managers/resource_manager.dart';
import 'package:millionaire_app/ui/screens/drawer/settings_drawer.dart';
import 'package:millionaire_app/ui/screens/home_screen/components/grand_prize_card.dart';
import 'package:millionaire_app/ui/widgets/bouncing_animated_widget.dart';
import 'package:millionaire_app/ui/widgets/custom_progress_indicator.dart';
import 'package:millionaire_app/ui/widgets/default_button.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../constants.dart';

class WinnerScreen extends StatefulWidget {
  const WinnerScreen({Key? key}) : super(key: key);

  @override
  State<WinnerScreen> createState() => _WinnerScreenState();
}

class _WinnerScreenState extends State<WinnerScreen> {
  int currentPage = 0;
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
                    padding: const EdgeInsets.symmetric(horizontal: 29),
                    child: BounceAnimatedWidget(
                        onTap: () {
                          scaffoldKey.currentState?.openDrawer();
                          Scaffold.of(context).openDrawer();
                        },
                        child: Image.asset(ResourceManager.getResource(
                            name: "mini_logo.png"))),
                  ),
                  const SizedBox(
                    height: 19,
                  ),
                  const Center(
                    child: CustomProgressIndicator(
                      backgroundColor: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: (screenWidth - inputWidth) / 2,
                    ),
                    child: Center(
                        child: DefaultButton(
                            text: 'buy_tickets_now'.tr(),
                            onButtonPressed: () {})),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: (screenWidth - inputWidth) / 2,
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: SizedBox(
                              height: 30,
                              width: 30,
                              child: Image.asset(ResourceManager.getResource(
                                  name: 'filter.png'))),
                        ),
                        const SizedBox(
                          width: 28,
                        ),
                        Expanded(
                          child: Text(
                            'Filter'.tr(),
                            style:
                                const TextStyle(color: mainText, fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                          width: 16,
                          child: Image.asset(ResourceManager.getResource(
                              name: 'calendar.png')),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          '3/6/2022',
                          style: TextStyle(color: mainText, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 29),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: (screenWidth - inputWidth) / 2,
                    ),
                    child: GrandPrizeCard(),
                  ),
                  const SizedBox(height: 50),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: (screenWidth - inputWidth) / 2,
                    ),
                    child: SizedBox(
                        height: 230,
                        child: Stack(
                          children: [
                            PageView.builder(
                                onPageChanged: (index) {
                                  setState(() {
                                    currentPage = index;
                                  });
                                },
                                itemCount: 2,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Stack(
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(34),
                                            image: DecorationImage(
                                              image: AssetImage(
                                                ResourceManager.getResource(
                                                    name:
                                                        'winner_card_image.png'),
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(34),
                                              color: Colors.white,
                                              gradient: LinearGradient(
                                                  begin: FractionalOffset
                                                      .topCenter,
                                                  end: FractionalOffset
                                                      .bottomCenter,
                                                  colors: [
                                                    const Color(0xFF6FD3D5)
                                                        .withOpacity(0.57),
                                                    const Color(0xFFF6F6F6)
                                                        .withOpacity(0.57),
                                                  ],
                                                  stops: const [
                                                    0.0,
                                                    1.0
                                                  ])),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .only(start: 25, bottom: 14),
                                            child: Align(
                                                alignment: LocaleProvider
                                                            .currentLocal !=
                                                        'ar'
                                                    ? Alignment.bottomLeft
                                                    : Alignment.bottomRight,
                                                child: Image.asset(
                                                    ResourceManager.getResource(
                                                        name: 'youtube.png'))),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  end: 25, bottom: 20),
                              child: Align(
                                alignment: LocaleProvider.currentLocal != 'ar'
                                    ? Alignment.bottomRight
                                    : Alignment.bottomLeft,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: List.generate(
                                      2,
                                      (index) => buildDot(index: index),
                                    )),
                              ),
                            ),
                          ],
                        )),
                  ),
                  const SizedBox(height: 55),
                ],
              ),
            ),
          ),
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

import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter/material.dart';
import 'package:millionaire_app/managers/resource_manager.dart';
import 'package:millionaire_app/route/auto_route.gr.dart';
import 'package:millionaire_app/ui/popups/payment_method_employee_popup.dart';
import 'package:millionaire_app/ui/popups/payment_method_popup.dart';
import 'package:millionaire_app/ui/screens/drawer/settings_drawer.dart';
import 'package:millionaire_app/ui/widgets/bouncing_animated_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:millionaire_app/ui/widgets/default_button.dart';
import 'package:millionaire_app/ui/widgets/progress_indicator_container_widget.dart';
import 'package:millionaire_app/ui/widgets/ticket_widget.dart';
import '../../../constants.dart';

class NumbersScreen extends StatefulWidget {
  const NumbersScreen({Key? key, this.withDrawer = true}) : super(key: key);
  final bool withDrawer;

  @override
  State<NumbersScreen> createState() => _NumbersScreenState();
}

class _NumbersScreenState extends State<NumbersScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool numberExists = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

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
                  ProgressIndicatorContainer(
                    screenWidth: screenWidth,
                    inputWidth: inputWidth,
                    children: [
                      const SizedBox(height: 40),
                      Row(
                        children: [
                          Image.asset(
                            ResourceManager.getResource(
                                name: 'grand_prize.png'),
                            height: 130,
                            width: 130,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Grand prize'.tr(),
                                style: const TextStyle(
                                    fontSize: 20, color: mainText),
                              ),
                              const SizedBox(height: 10),
                              RichText(
                                text: const TextSpan(
                                    text: '300,000',
                                    style: TextStyle(
                                        fontSize: 30, color: prizeTextColor),
                                    children: [
                                      TextSpan(
                                          text: ' IQD',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: mainText,
                                          )),
                                    ]),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Raffle Prize 300,000',
                                style: TextStyle(
                                    fontSize: 18, color: subtitleColor),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 39),
                      Divider(
                        thickness: 1,
                        color: Colors.grey[400],
                      ),
                      if (!numberExists)
                        SizedBox(
                          height: screenHeight * 0.14,
                        ),
                      if (!numberExists)
                        Text('You didn\'t add any numbers yet'.tr(),
                            style: const TextStyle(
                                color: subtitleColor, fontSize: 20)),
                      if (!numberExists)
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              numberExists = true;
                            });
                          },
                          child: Text('Choose Now!'.tr(),
                              style: const TextStyle(
                                  color: subtitleColor,
                                  fontSize: 20,
                                  decoration: TextDecoration.underline)),
                        ),
                      if (!numberExists)
                        SizedBox(
                          height: screenHeight * 0.14,
                        ),
                      if (numberExists)
                        SizedBox(
                          height: 300,
                          child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return const TicketWidget(
                                  image: 'ticket.png',
                                );
                              }),
                        ),
                      const SizedBox(height: 39),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: (screenWidth - inputWidth) / 2),
                    child: Row(
                      children: [
                        Image.asset(
                          ResourceManager.getResource(name: 'price.png'),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            'Total Price to Purchase'.tr(),
                            style:
                                const TextStyle(fontSize: 20, color: mainText),
                          ),
                        ),
                        const Text(
                          '332',
                          style:
                              TextStyle(color: Color(0xFFFE8383), fontSize: 20),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'IQD',
                          style: TextStyle(color: subtitleColor, fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: (screenWidth - inputWidth) / 2 + 20),
                    child: DefaultButton(
                        text: 'Purchase'.tr(),
                        onButtonPressed: () {
                          showModalBottomSheet(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(60))),
                            isScrollControlled: true,
                            backgroundColor: Colors.white,
                            context: context,
                            builder: (builder) {
                              if (widget.withDrawer) {
                                return PaymentMethodPopUp(
                                    onConfirmClicked: () {});
                              } else {
                                return PaymentMethodEmployeePopUp(
                                    onConfirmClicked: () {});
                              }
                            },
                          );
                        }),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Multiple rounded curve clipper to use with [ClipPath]
class MultipleRoundedCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width, 0);
    var curYPos = 0.0;
    var curXPos = size.width;
    var increment = size.height / 8;
    path.fillType = PathFillType.nonZero;
    while (curYPos < size.height) {
      curYPos += increment;
      path.arcToPoint(Offset(curXPos, curYPos),
          radius: const Radius.circular(5), clockwise: false);
    }
    path.lineTo(0, size.height);
    // while (curYPos > 0) {
    //   curYPos -= increment;
    //   path.arcToPoint(Offset(curXPos, curYPos), radius: const Radius.circular(5), clockwise: false);
    // }

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

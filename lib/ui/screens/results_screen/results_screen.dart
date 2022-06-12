import 'package:flutter/material.dart';
import 'package:millionaire_app/managers/resource_manager.dart';
import 'package:millionaire_app/ui/screens/drawer/settings_drawer.dart';
import 'package:millionaire_app/ui/screens/home_screen/components/number_field.dart';
import 'package:millionaire_app/ui/screens/select_number_screen/select_number_screen.dart';
import 'package:millionaire_app/ui/widgets/bouncing_animated_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:millionaire_app/ui/widgets/default_button.dart';
import 'package:millionaire_app/ui/widgets/progress_indicator_container_widget.dart';
import 'package:millionaire_app/ui/widgets/ticket_widget.dart';
import '../../../constants.dart';

class ResultsScreen extends StatefulWidget {
  const ResultsScreen({Key? key}) : super(key: key);

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool noDrawResult = false;
  bool noTickets = false;
  bool showTickets = false;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double inputWidth = (screenWidth > 400) ? 400 : (screenWidth * 75 / 100);
    return Container(
      color: accentColor,
      child: SafeArea(
        child: Scaffold(
          drawer: const SettingsDrawer(),
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
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: Image.asset(
                                      ResourceManager.getResource(
                                          name: 'filter.png'))),
                            ),
                            const SizedBox(
                              width: 28,
                            ),
                            Expanded(
                              child: Text(
                                'Filter'.tr(),
                                style: const TextStyle(
                                    color: mainText, fontSize: 20),
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
                        const SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                    color: prizeTextColor,
                                    blurRadius: 5,
                                    offset: Offset(0, 2))
                              ],
                              borderRadius: BorderRadius.circular(15),
                              border:
                                  Border.all(width: 2, color: prizeTextColor)),
                          child: Row(
                            children: [
                              Image.asset(
                                ResourceManager.getResource(
                                    name: 'grand_prize.png'),
                                height: 100,
                                width: 100,
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                        text: 'grand_prize'.tr(),
                                        style: const TextStyle(
                                            fontSize: 16, color: mainText),
                                        children: const [
                                          TextSpan(
                                              text: ' 300,000',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: prizeTextColor,
                                                  fontWeight: FontWeight.bold)),
                                          TextSpan(
                                              text: ' IQD',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: mainText,
                                              )),
                                        ]),
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: List.generate(
                                        5,
                                        (index) => Row(
                                              children: [
                                                const NumberField(
                                                  padding: EdgeInsets.all(6),
                                                  radius: 14,
                                                  withShadow: true,
                                                  number: '22',
                                                ),
                                                if (index != 5)
                                                  const SizedBox(
                                                    width: 7,
                                                  )
                                              ],
                                            )),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                    color: accentColor,
                                    blurRadius: 5,
                                    offset: Offset(0, 2))
                              ],
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(width: 2, color: accentColor)),
                          child: Row(
                            children: [
                              Image.asset(
                                ResourceManager.getResource(name: 'mic.png'),
                                height: 110,
                                width: 110,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                        text: 'Ruffle Draw'.tr(),
                                        style: const TextStyle(
                                            fontSize: 16, color: mainText),
                                        children: const [
                                          TextSpan(
                                              text: ' 300,000',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: prizeTextColor,
                                                  fontWeight: FontWeight.bold)),
                                          TextSpan(
                                              text: ' IQD',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: mainText,
                                              )),
                                        ]),
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: List.generate(
                                        3,
                                        (index) => Row(
                                              children: [
                                                const NumberField(
                                                  padding: EdgeInsets.all(6),
                                                  radius: 14,
                                                  withShadow: false,
                                                  number: '5555',
                                                ),
                                                if (index != 3)
                                                  const SizedBox(
                                                    width: 10,
                                                  )
                                              ],
                                            )),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'My Tickets'.tr(),
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: subtitleColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        if (noTickets)
                          SizedBox(
                            height: screenHeight * 0.14,
                          ),
                        if (noTickets)
                          Text('You don\'t own any tickets yet'.tr(),
                              style: const TextStyle(
                                  color: subtitleColor, fontSize: 20)),
                        if (noTickets)
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                noTickets = false;
                                noDrawResult = true;
                              });
                            },
                            child: Text('Purchase Now!'.tr(),
                                style: const TextStyle(
                                    color: subtitleColor,
                                    fontSize: 20,
                                    decoration: TextDecoration.underline)),
                          ),
                        if (noTickets)
                          SizedBox(
                            height: screenHeight * 0.14,
                          ),
                        if (noDrawResult)
                          SizedBox(
                            height: screenHeight * 0.10,
                          ),
                        if (noDrawResult)
                          Text(
                              'The date you selected doesn\'t have any draw result until now'
                                  .tr(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: subtitleColor, fontSize: 20)),
                        if (noDrawResult)
                          SizedBox(
                            height: screenHeight * 0.10,
                          ),
                        if (!showTickets)
                          SizedBox(
                            height: 300,
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                if (index == 0) {
                                  return const TicketWidget(
                                    image: 'ticket.png',
                                    withBanner: true,
                                    withShadow: true,
                                  );
                                } else if (index == 1) {
                                  return const TicketWidget(
                                    image: 'red_ticket.png',
                                    withBanner: true,
                                    withShadow: true,
                                  );
                                } else if (index == 2) {
                                  return const TicketWidget(
                                    image: 'blue_ticket.png',
                                    withBanner: true,
                                  );
                                } else {
                                  return const TicketWidget(
                                    image: 'yellow_ticket.png',
                                    withBanner: true,
                                    withShadow: true,
                                  );
                                }
                              },
                              itemCount: 4,
                            ),
                          ),
                        const SizedBox(height: 50),
                      ]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

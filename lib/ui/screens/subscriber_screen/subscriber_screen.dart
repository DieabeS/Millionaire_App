import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter/material.dart';
import 'package:millionaire_app/constants.dart';
import 'package:millionaire_app/managers/resource_manager.dart';
import 'package:millionaire_app/route/auto_route.gr.dart';
import 'package:millionaire_app/ui/popups/charge_popup.dart';
import 'package:millionaire_app/ui/screens/drawer/profile_screen.dart';
import 'package:millionaire_app/ui/screens/home_screen/components/home_action_container.dart';
import 'package:easy_localization/easy_localization.dart';

class SubscriberScreen extends StatefulWidget {
  const SubscriberScreen({Key? key}) : super(key: key);

  @override
  State<SubscriberScreen> createState() => _SubscriberScreenState();
}

class _SubscriberScreenState extends State<SubscriberScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double inputWidth = (screenWidth > 400) ? 400 : (screenWidth * 75 / 100);
    return Container(
      color: accentColor,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: buildBackGroundGradient(),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: (screenWidth - inputWidth) / 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 125),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(23),
                        child: Container(
                          width: double.infinity,
                          color: Colors.white,
                          child: Image.asset(ResourceManager.getResource(name: 'cv.png')),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Doaa Alayoubie',
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        '432-223-2323-34',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Container(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
                              SizedBox(
                                height: 20,
                              ),
                              ProfileInfo(info: 'user_name', value: 'Doaa Alayoubie'),
                              SizedBox(
                                height: 20,
                              ),
                              ProfileInfo(info: 'Phone', value: '4382-234-23'),
                              SizedBox(
                                height: 20,
                              ),
                              ProfileInfo(info: 'Email', value: 'doaa@gmail.com'),
                              SizedBox(
                                height: 20,
                              ),
                            ]),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          HomeActionContainer(
                              width: 155,
                              onCardClicked: () {
                                context.router.push(ProductRoute(withDrawer: false));
                              },
                              image: ResourceManager.getResource(name: 'Purchase .png'),
                              text: 'Purchase'.tr()),
                          HomeActionContainer(
                              width: 155,
                              onCardClicked: () {
                                showModalBottomSheet(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(top: Radius.circular(60))),
                                  isScrollControlled: true,
                                  backgroundColor: Colors.white,
                                  context: context,
                                  builder: (builder) {
                                    return ChargePopup(onConfirmClicked: () {});
                                  },
                                );
                              },
                              image: ResourceManager.getResource(name: 'click_buy.png'),
                              text: ' charge'.tr()),
                        ],
                      ),
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
}

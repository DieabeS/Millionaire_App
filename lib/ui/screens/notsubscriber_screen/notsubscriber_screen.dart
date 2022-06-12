import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter/material.dart';
import 'package:millionaire_app/constants.dart';
import 'package:millionaire_app/helpers/input_decoration.dart';
import 'package:millionaire_app/managers/resource_manager.dart';
import 'package:millionaire_app/route/auto_route.gr.dart';
import 'package:millionaire_app/ui/popups/charge_popup.dart';
import 'package:millionaire_app/ui/screens/home_screen/components/home_action_container.dart';
import 'package:easy_localization/easy_localization.dart';

class NotSubscriberScreen extends StatefulWidget {
  const NotSubscriberScreen({Key? key}) : super(key: key);

  @override
  State<NotSubscriberScreen> createState() => _NotSubscriberScreenState();
}

class _NotSubscriberScreenState extends State<NotSubscriberScreen> {
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
                  padding: EdgeInsets.symmetric(
                      horizontal: (screenWidth - inputWidth) / 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 125),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(23),
                        child: Container(
                          width: double.infinity,
                          color: Colors.white,
                          child: Image.asset(
                              ResourceManager.getResource(name: 'cv.png')),
                        ),
                      ),
                      const SizedBox(height: 35),
                      const Text(
                        '432-223-2323-34',
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 25),
                      TextFormField(
                        // controller: userNameController,
                        decoration: loginInputDecorationWithSpecificProperties(
                            hint: "User Name".tr()),
                      ),
                      const SizedBox(height: 35),
                      TextFormField(
                        // controller: userNameController,
                        decoration: loginInputDecorationWithSpecificProperties(
                            hint: "Mobile".tr()),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          HomeActionContainer(
                              width: 155,
                              onCardClicked: () {
                                context.router
                                    .push(ProductRoute(withDrawer: false));
                              },
                              image: ResourceManager.getResource(
                                  name: 'Purchase .png'),
                              text: 'Purchase'.tr()),
                          HomeActionContainer(
                              width: 155,
                              onCardClicked: () {
                                showModalBottomSheet(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(60))),
                                  isScrollControlled: true,
                                  backgroundColor: Colors.white,
                                  context: context,
                                  builder: (builder) {
                                    return ChargePopup(onConfirmClicked: () {});
                                  },
                                );
                              },
                              image: ResourceManager.getResource(
                                  name: 'click_buy.png'),
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

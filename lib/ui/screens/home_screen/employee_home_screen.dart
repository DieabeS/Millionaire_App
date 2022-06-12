import 'package:auto_route/src/router/auto_router_x.dart';
import "package:flutter/material.dart";
import 'package:millionaire_app/managers/resource_manager.dart';
import 'package:millionaire_app/route/auto_route.gr.dart';
import 'package:millionaire_app/ui/popups/id_user_popup.dart';
import 'package:millionaire_app/ui/widgets/default_button.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../constants.dart';

class EmployeeHomeScreen extends StatefulWidget {
  const EmployeeHomeScreen({Key? key}) : super(key: key);

  @override
  State<EmployeeHomeScreen> createState() => _EmployeeHomeScreenState();
}

class _EmployeeHomeScreenState extends State<EmployeeHomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double inputWidth = (screenWidth > 400) ? 400 : (screenWidth * 75 / 100);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              accentColor.withOpacity(0.7),
              scaffoldBackgroundColor,
              scaffoldBackgroundColor,
            ], begin: Alignment.topLeft, end: Alignment.bottomCenter),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Image.asset(ResourceManager.getResource(
                        name: 'employee_background.png'))),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: screenWidth * 0.5,
                            child: DefaultButton(
                              onButtonPressed: () {
                                showModalBottomSheet(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(60))),
                                  isScrollControlled: true,
                                  backgroundColor: Colors.white,
                                  context: context,
                                  builder: (builder) {
                                    return IdUserPopUp(onConfirmClicked: () {});
                                  },
                                );
                              },
                              text: 'Subscriber'.tr(),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: screenWidth * 0.5,
                            child: DefaultButton(
                              onButtonPressed: () {
                                context.router.push(const NotSubscriberRoute());
                              },
                              text: 'NotSubscriber'.tr(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: Image.asset(
                            ResourceManager.getResource(name: 'employee.png'))),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter/material.dart';
import 'package:millionaire_app/managers/resource_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:millionaire_app/ui/widgets/default_button.dart';
import '../../../../constants.dart';
import 'number_field.dart';

class GrandPrizeCard extends StatelessWidget {
  const GrandPrizeCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  const Icon(Icons.star, color: progressIndicatorColor),
                  const SizedBox(width: 10),
                  Text(
                    'Grand Drow Results'.tr(),
                    style: const TextStyle(fontSize: 16, color: mainText),
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset(
                    ResourceManager.getResource(name: 'grand_prize.png'),
                    height: 130,
                    width: 130,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'grand_prize'.tr(),
                        style: const TextStyle(fontSize: 20, color: mainText),
                      ),
                      const SizedBox(height: 10),
                      RichText(
                        text: const TextSpan(
                            text: '1,000,000',
                            style:
                                TextStyle(fontSize: 30, color: prizeTextColor),
                            children: [
                              TextSpan(
                                  text: ' IQD',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: mainText,
                                  )),
                            ]),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    5,
                    (index) => Row(
                      children: [
                        const NumberField(
                          radius: 18,
                          withShadow: true,
                          number: '32',
                        ),
                        if (index != 5)
                          const SizedBox(
                            width: 10,
                          )
                      ],
                    ),
                  )),
              const SizedBox(
                height: 35,
              ),
              Row(
                children: [
                  Image.asset(ResourceManager.getResource(name: 'crown.png')),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Ruffle Drow Results'.tr(),
                  )
                ],
              ),
              Row(
                children: [
                  Image.asset(ResourceManager.getResource(name: 'mic.png')),
                  const SizedBox(
                    width: 10,
                  ),
                  RichText(
                    text: const TextSpan(
                        text: '300,000',
                        style: TextStyle(fontSize: 30, color: prizeTextColor),
                        children: [
                          TextSpan(
                              text: ' IQD',
                              style: TextStyle(
                                fontSize: 20,
                                color: mainText,
                              )),
                        ]),
                  )
                ],
              ),
              Container(
                height: 50,
                width: 375,
                decoration: BoxDecoration(
                    color: const Color(0xFF9FEDEE),
                    borderRadius: BorderRadius.circular(18)),
                child: Center(
                    child: Text(
                  'Winner Ruffle IDs'.tr(),
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                )),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '12345',
                    style: TextStyle(color: mainText, fontSize: 16),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 2,
                    height: 14,
                    color: Colors.yellow,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    '12345',
                    style: TextStyle(color: mainText, fontSize: 16),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 2,
                    height: 14,
                    color: Colors.yellow,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    '12345',
                    style: TextStyle(color: mainText, fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Center(
                  child: DefaultButton(
                    onButtonPressed: () {
                      navBarGlobalKey.currentState!.currentTabsRouter!
                          .setActiveIndex(2);
                      // showModalBottomSheet(
                      //   shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.vertical(
                      //           top: Radius.circular(60))),
                      //   isScrollControlled: true,
                      //   backgroundColor: Colors.white,
                      //   context: context,
                      //   builder: (builder) {
                      //     return FilterCityPopUp(onConfirmClicked: () {});
                      //   },
                      // );
                      // DialogHelper.showAnimatedDialog(
                      //     context, PinCodePopUp(onConfirmClicked: () {}));
                    },
                    text: 'Learn more'.tr(),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter/material.dart';
import 'package:millionaire_app/managers/resource_manager.dart';
import 'package:millionaire_app/route/auto_route.gr.dart';
import 'package:millionaire_app/ui/widgets/custom_progress_indicator.dart';
import 'package:millionaire_app/ui/widgets/default_button.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../constants.dart';

class HomeCardWidget extends StatelessWidget {
  const HomeCardWidget({
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 23,
              ),
              const Center(
                child: CustomProgressIndicator(
                  backgroundColor: scaffoldBackgroundColor,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text('Rewards'.tr(),
                  style: const TextStyle(fontSize: 20, color: mainText)),
              ...List.generate(
                  3,
                  (index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Row(
                          children: [
                            Image.asset(
                                ResourceManager.getResource(name: 'gift.png'),
                                height: 21,
                                width: 21),
                            const SizedBox(width: 13),
                            Expanded(
                                child: Text(
                              'Match 5 Numbers'.tr(),
                              style: const TextStyle(
                                  fontSize: 16, color: mainText),
                            )),
                            const Text('IQD',
                                style:
                                    TextStyle(fontSize: 20, color: mainText)),
                            const SizedBox(width: 10),
                            Text(300.toString(),
                                style: const TextStyle(
                                    fontSize: 25, color: Color(0xff70D6F1)))
                          ],
                        ),
                      )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Center(
                  child: DefaultButton(
                    onButtonPressed: () {
                      context.router.push(ProductRoute());
                    },
                    text: 'Buy Now'.tr(),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}

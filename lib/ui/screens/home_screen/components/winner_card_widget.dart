import 'package:flutter/material.dart';
import 'package:millionaire_app/helpers/local_provider.dart';
import 'package:millionaire_app/managers/resource_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../constants.dart';

class WinnersCardWidget extends StatelessWidget {
  const WinnersCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Expanded(child: SizedBox()),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '300 Winners'.tr(),
                          style: const TextStyle(fontSize: 35, color: mainText),
                        ),
                        Text(
                          'Congratulations'.tr(),
                          style: const TextStyle(
                              fontSize: 16, color: Color(0xFF262626)),
                        ),
                        Text(
                          'tap here'.tr(),
                          style: const TextStyle(
                              fontSize: 16, color: Color(0xFF262626)),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        LocaleProvider.currentLocal != 'ar'
            ? Positioned(
                left: 0,
                top: -30,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    padding: const EdgeInsetsDirectional.only(end: 30),
                    child: Image.asset(
                      ResourceManager.getResource(name: 'winners.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
            : Positioned(
                right: 0,
                top: -30,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: const EdgeInsetsDirectional.only(end: 30),
                    child: Image.asset(
                      ResourceManager.getResource(name: 'winners.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
      ],
    );
  }
}

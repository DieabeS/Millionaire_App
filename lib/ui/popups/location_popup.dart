import 'package:flutter/material.dart';
import 'package:millionaire_app/constants.dart';
import 'package:millionaire_app/managers/resource_manager.dart';
import 'package:millionaire_app/ui/widgets/default_button.dart';
import 'package:easy_localization/easy_localization.dart';

class LocationPopUp extends StatefulWidget {
  final Function() onConfirmClicked;

  const LocationPopUp({Key? key, required this.onConfirmClicked})
      : super(key: key);

  @override
  State<LocationPopUp> createState() => _LocationPopUpState();
}

class _LocationPopUpState extends State<LocationPopUp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(60)),
        gradient: LinearGradient(
            colors: [popups.withOpacity(1), popups.withOpacity(1)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 35,
            ),
            Center(
              child: Container(
                width: 82,
                height: 2,
                color: accentColor,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                SizedBox(
                  height: 60,
                  width: 60,
                  child: Image.asset(
                      ResourceManager.getResource(name: 'home_location.png')),
                ),
                 Expanded(
                  child: Text(
                    'Position name'.tr(),
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                const Text(
                  'Dresden',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              height: 2,
              color: scaffoldBackgroundColor,
            ),
            Row(
              children: [
                Container(
                    height: 60,
                    width: 60,
                    child: Image.asset(
                        ResourceManager.getResource(name: 'place.png'))),
                 Expanded(
                  child: Text(
                    'Location'.tr(),
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                const Text(
                  'Germany',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              height: 2,
              color: scaffoldBackgroundColor,
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                SizedBox(
                  height: 60,
                  width: 60,
                  child: Image.asset(
                      ResourceManager.getResource(name: 'information.png')),
                ),
                 Text(
                  "Info".tr(),
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsetsDirectional.only(start: 20),
              child: Text(
                "Dresden is the capital city of the German state of Saxony and its second most populous city, after Leipzig. ",
                style: TextStyle(fontSize: 13),
              ),
            ),
            const SizedBox(
              height: 140,
            ),
          ],
        ),
      ),
    );
  }
}

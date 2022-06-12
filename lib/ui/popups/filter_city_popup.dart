import 'package:flutter/material.dart';
import 'package:millionaire_app/constants.dart';
import 'package:millionaire_app/managers/resource_manager.dart';
import 'package:millionaire_app/ui/widgets/default_button.dart';
import 'package:easy_localization/easy_localization.dart';

class FilterCityPopUp extends StatefulWidget {
  final Function() onConfirmClicked;

  const FilterCityPopUp({Key? key, required this.onConfirmClicked})
      : super(key: key);

  @override
  State<FilterCityPopUp> createState() => _FilterCityPopUpState();
}

class _FilterCityPopUpState extends State<FilterCityPopUp> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double inputWidth = (screenWidth > 400) ? 400 : (screenWidth * 75 / 100);
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(60)),
        gradient: LinearGradient(
            colors: [popups.withOpacity(1), popups.withOpacity(1)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: (screenWidth - inputWidth) / 2),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            Center(
              child: Container(
                width: 82,
                height: 2,
                color: accentColor,
              ),
            ),
            const SizedBox(
              height: 95,
            ),
            TextFormField(
              decoration: loginInputDecorationWithSpecificProperties(
                hint: "City".tr(),
                image: ResourceManager.getResource(name: 'city.png'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
                decoration: loginInputDecorationWithSpecificProperties(
                    hint: "Zone".tr(),
                    image: ResourceManager.getResource(name: 'place.png'))),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 65),
              child: AbsorbPointer(
                absorbing: false,
                child: Opacity(
                  opacity: 1,
                  child: DefaultButton(
                    onButtonPressed: () {},
                    text: 'Filter'.tr(),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 55,
            ),
          ],
        ),
      ),
    );
  }

  loginInputDecorationWithSpecificProperties(
      {IconData? icon,
      String? hint,
      Function()? onIconPressed,
      String? image}) {
    return InputDecoration(
        fillColor: Colors.white,
        filled: true,
        suffixIcon: icon != null
            ? GestureDetector(onTap: onIconPressed, child: Icon(icon))
            : image != null
                ? GestureDetector(
                    onTap: onIconPressed, child: Image.asset(image))
                : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(
            width: 0.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(
            width: 0.5,
          ),
        ),
        border: const OutlineInputBorder(),
        hintText: hint,
        hintStyle: const TextStyle(color: subtitleColor));
  }
}

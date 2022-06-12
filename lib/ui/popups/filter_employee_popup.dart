import 'package:flutter/material.dart';
import 'package:millionaire_app/constants.dart';
import 'package:millionaire_app/helpers/input_decoration.dart';
import 'package:millionaire_app/managers/resource_manager.dart';
import 'package:millionaire_app/ui/widgets/default_button.dart';
import 'package:easy_localization/easy_localization.dart';

class FilterEmployeePopUp extends StatefulWidget {
  final Function() onConfirmClicked;

  const FilterEmployeePopUp({Key? key, required this.onConfirmClicked})
      : super(key: key);

  @override
  State<FilterEmployeePopUp> createState() => _FilterEmployeePopUpState();
}

class _FilterEmployeePopUpState extends State<FilterEmployeePopUp> {
  bool isChecked = false;
  bool isChecked1 = false;
  bool isChecked2 = false;

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
              height: 25,
            ),
            Center(
              child: Container(
                width: 82,
                height: 2,
                color: accentColor,
              ),
            ),
            const SizedBox(
              height: 85,
            ),
            Row(
              children: [
                Container(
                    height: 30,
                    width: 30,
                    child: Image.asset(
                        ResourceManager.getResource(name: 'filter.png'))),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "Filter".tr(),
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Date'.tr(),
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 15,
            ),
            Center(
              child: TextFormField(
                decoration:
                    loginInputDecorationWithSpecificProperties(hint: ""),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                width: 388,
                height: 2,
                color: accentColor,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Show'.tr(),
              style: const TextStyle(fontSize: 20),
            ),
            Row(
              children: [
                Checkbox(
                    activeColor: accentColor,
                    fillColor: MaterialStateColor.resolveWith(
                        (states) => Colors.white),
                    value: isChecked,
                    checkColor: accentColor,
                    onChanged: (bool? value) {
                      setState(
                        () {
                          isChecked = value!;
                        },
                      );
                    }),
                Text(
                  'Unpaid invoices'.tr(),
                  style: const TextStyle(fontSize: 16),
                ),
                Checkbox(
                    activeColor: accentColor,
                    fillColor: MaterialStateColor.resolveWith(
                        (states) => Colors.white),
                    checkColor: accentColor,
                    value: isChecked1,
                    onChanged: (bool? value) {
                      setState(
                        () {
                          isChecked1 = value!;
                        },
                      );
                    }),
                Text(
                  'Paid invoices'.tr(),
                  style: const TextStyle(fontSize: 16),
                ),
                Checkbox(
                    fillColor: MaterialStateColor.resolveWith(
                        (states) => Colors.white),
                    checkColor: accentColor,
                    activeColor: accentColor,
                    value: isChecked2,
                    onChanged: (bool? value) {
                      setState(
                        () {
                          isChecked2 = value!;
                        },
                      );
                    }),
                Text(
                  'All'.tr(),
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(
              height: 65,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 65),
              child: DefaultButton(
                onButtonPressed: () {
                  Navigator.of(context).pop();
                  // context.router.push();
                },
                text: 'Apply'.tr(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

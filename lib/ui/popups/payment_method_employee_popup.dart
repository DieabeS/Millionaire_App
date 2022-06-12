import 'package:flutter/material.dart';
import 'package:millionaire_app/constants.dart';
import 'package:millionaire_app/helpers/input_decoration.dart';
import 'package:millionaire_app/managers/resource_manager.dart';
import 'package:millionaire_app/ui/widgets/default_button.dart';
import 'package:easy_localization/easy_localization.dart';
class PaymentMethodEmployeePopUp extends StatefulWidget {
  final Function() onConfirmClicked;

  const PaymentMethodEmployeePopUp({Key? key, required this.onConfirmClicked})
      : super(key: key);

  @override
  State<PaymentMethodEmployeePopUp> createState() =>
      _PaymentMethodEmployeePopUpState();
}

class _PaymentMethodEmployeePopUpState
    extends State<PaymentMethodEmployeePopUp> {
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
            padding: EdgeInsets.symmetric(
                horizontal: (screenWidth - inputWidth) / 2),
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
                  height: 50,
                ),
                Text(
                  'Check out'.tr(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: mainText,
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Subtotal'.tr(),
                        style: const TextStyle(color: mainText, fontSize: 20),
                      ),
                    ),
                   const Text(
                      '192.00 IQD',
                      style: TextStyle(fontSize: 22, color: mainText),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total'.tr(),
                      style: const TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      '6,192.00IQD',
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 55,
                ),
                TextFormField(
                  decoration: loginInputDecorationWithSpecificProperties(
                    hint: "Cash payment".tr(),
                    image: ResourceManager.getResource(name: 'money.png'),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 65),
                  child: DefaultButton(
                    onButtonPressed: () {
                      // context.router.push();
                    },
                    text: 'Done'.tr(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            )));
  }
}

import 'package:flutter/material.dart';
import 'package:millionaire_app/constants.dart';
import 'package:millionaire_app/helpers/input_decoration.dart';
import 'package:millionaire_app/ui/widgets/default_button.dart';
import 'package:easy_localization/easy_localization.dart';

class CardNumberPopup extends StatefulWidget {
  final Function() onConfirmClicked;

  const CardNumberPopup({Key? key, required this.onConfirmClicked})
      : super(key: key);

  @override
  State<CardNumberPopup> createState() => _CardNumberPopupState();
}

class _CardNumberPopupState extends State<CardNumberPopup> {
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
              height: 60,
            ),
            Text(
              'Payment method'.tr(),
              style: const TextStyle(color: Colors.black, fontSize: 20),
            ),
            const SizedBox(
              height: 50,
            ),
            TextFormField(
              // controller: cardController,
              decoration: loginInputDecorationWithSpecificProperties(
                  hint: "Card Number".tr()),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
                //controller : CardholderController,
                decoration: loginInputDecorationWithSpecificProperties(
                    hint: "Cardholder Name".tr())),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
                //controller : CvvController,
                decoration:
                    loginInputDecorationWithSpecificProperties(hint: "CVV")),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 65),
              child: AbsorbPointer(
                absorbing: false,
                child: Opacity(
                  opacity: 1,
                  child: DefaultButton(
                    onButtonPressed: () {
                      Navigator.of(context).pop();
                      widget.onConfirmClicked();
                    },
                    text: 'Next'.tr(),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}

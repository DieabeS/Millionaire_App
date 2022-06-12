import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter/material.dart';
import 'package:millionaire_app/constants.dart';
import 'package:millionaire_app/helpers/input_decoration.dart';
import 'package:millionaire_app/managers/resource_manager.dart';
import 'package:millionaire_app/route/auto_route.gr.dart';
import 'package:millionaire_app/ui/widgets/default_button.dart';
import 'package:easy_localization/easy_localization.dart';

class ChargePopup extends StatefulWidget {
  final Function() onConfirmClicked;

  const ChargePopup({Key? key, required this.onConfirmClicked})
      : super(key: key);

  @override
  State<ChargePopup> createState() => _ChargePopupState();
}

class _ChargePopupState extends State<ChargePopup> {
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
              height: 35,
            ),
            Center(
              child: Image.asset(ResourceManager.getResource(name: 'like.png')),
            ),
            const SizedBox(height: 50),
            Center(
              child: TextFormField(
                // controller: userNameController,
                decoration: loginInputDecorationWithSpecificProperties(
                    hint: "Amount".tr()),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 65),
              child: DefaultButton(
                onButtonPressed: () {
                  Navigator.of(context).pop();
                  context.router.push(const ChargeRoute());
                },
                text: 'Next'.tr(),
              ),
            ),
            const SizedBox(height: 35),
          ],
        ),
      ),
    );
  }
}

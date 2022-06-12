import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter/material.dart';
import 'package:millionaire_app/constants.dart';
import 'package:millionaire_app/helpers/input_decoration.dart';
import 'package:millionaire_app/route/auto_route.gr.dart';
import 'package:millionaire_app/ui/widgets/default_button.dart';
import 'package:easy_localization/easy_localization.dart';

class IdUserPopUp extends StatefulWidget {
  final Function() onConfirmClicked;

  const IdUserPopUp({Key? key, required this.onConfirmClicked})
      : super(key: key);

  @override
  State<IdUserPopUp> createState() => _IdUserPopUpState();
}

class _IdUserPopUpState extends State<IdUserPopUp> {
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
            height: 165,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Center(
              child: TextFormField(
                decoration:
                    loginInputDecorationWithSpecificProperties(hint: "ID USER"),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 115),
            child: DefaultButton(
              onButtonPressed: () {
                Navigator.of(context).pop();
                context.router.push(const SubscriberRoute());

                // context.router.push();
              },
              text: 'Next'.tr(),
            ),
          ),
          const SizedBox(height: 70),
        ],
      ),
    );
  }
}

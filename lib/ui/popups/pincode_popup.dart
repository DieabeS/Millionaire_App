import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter/material.dart';
import 'package:millionaire_app/constants.dart';
import 'package:millionaire_app/managers/resource_manager.dart';
import 'package:millionaire_app/route/auto_route.gr.dart';
import 'package:millionaire_app/ui/popups/round_popup.dart';
import 'package:millionaire_app/ui/widgets/bouncing_animated_widget.dart';
import 'package:millionaire_app/ui/widgets/counter_text.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
class PinCodePopUp extends StatefulWidget {
  final Function() onConfirmClicked;

  const PinCodePopUp({Key? key, required this.onConfirmClicked})
      : super(key: key);

  @override
  State<PinCodePopUp> createState() => _PinCodePopUpState();
}

class _PinCodePopUpState extends State<PinCodePopUp> {
  final TextEditingController controller = TextEditingController();
  final _pinCodeFocusNode = FocusNode();
  late bool hasError;
  int duration = 60;
  setNewDuration(newDuration) {
    duration = newDuration;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 195),
      child: RoundPopup(
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
          Padding(
            padding: const EdgeInsets.only(top: 80, left: 50),
            child: Row(
              children: [
                Image.asset(
                    ResourceManager.getResource(name: 'Vertification.png')),
                const SizedBox(
                  width: 10,
                ),
                 Text(
                  'Vertification'.tr(),
                  style: const TextStyle(fontSize: 20, color: titleAppBarColor),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "We sent you a SMS code".tr(),
                  style: const TextStyle(fontSize: 16),
                ),
             const SizedBox(
                  height: 20,
                ),
              Text(
                  "On number".tr() + ":" + "7 (900) 000 000",
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: PinCodeTextField(
                controller: controller,
                onSubmitted: (_) {},
                focusNode: _pinCodeFocusNode,
                keyboardType: TextInputType.number,
                autoFocus: false,
                appContext: context,
                textCapitalization: TextCapitalization.characters,
                enablePinAutofill: true,
                beforeTextPaste: (past) => past != null && past.length == 4,
                length: 4,
                // errorAnimationController: errorController,
                cursorColor: Colors.transparent,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  inactiveColor: settingsGradientEnd,
                  inactiveFillColor: settingsGradientEnd,
                  activeColor: settingsGradientEnd,
                  activeFillColor: settingsGradientEnd,
                  selectedColor: settingsGradientEnd,
                  selectedFillColor: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  fieldHeight: 55,
                  fieldWidth: 50,
                ),
                enableActiveFill: true,

                onCompleted: (value) {
                        context.router
                      .pushAndPopUntil(CustomerBottomNavBarRoute(key: navBarGlobalKey), predicate: (r) => false);
                },
                onChanged: (value) {},
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text(
                'Please wait'.tr(),
                style: const TextStyle(fontSize: 20),
              ),
              CounterText(
                duration: duration,
                setNewDuration: setNewDuration,
              )
            ],
          ),
           Center(
            child: Text("Code not received?".tr(),
                style: const TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 16,
                    color: subtitleColor)),
          ),
          const SizedBox(height: 65),
          BounceAnimatedWidget(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              const Icon(Icons.arrow_back_sharp),
              const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Edit information'.tr(),
                style: const TextStyle(fontSize: 16, color: mainText),
                  )
                ]),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

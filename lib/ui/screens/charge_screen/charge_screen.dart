import 'package:flutter/material.dart';
import 'package:millionaire_app/helpers/input_decoration.dart';
import 'package:millionaire_app/managers/resource_manager.dart';
import 'package:millionaire_app/ui/popups/payment_method_employee_popup.dart';
import 'package:millionaire_app/ui/widgets/custom_progress_indicator.dart';
import 'package:millionaire_app/ui/widgets/default_button.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../constants.dart';

class ChargeScreen extends StatelessWidget {
  const ChargeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double inputWidth = (screenWidth > 400) ? 400 : (screenWidth * 75 / 100);
    return Container(
        color: accentColor,
        child: SafeArea(
            child: Scaffold(
                body: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: buildBackGroundGradient(),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: (screenWidth - inputWidth) / 2),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 75,
                              ),
                              const Center(
                                child: CustomProgressIndicator(
                                  backgroundColor: scaffoldBackgroundColor,
                                ),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: Image.asset(
                                        ResourceManager.getResource(
                                            name: 'charge_card.png')),
                                  )),
                              const SizedBox(
                                height: 35,
                              ),
                              const Text(
                                "432-223-2323-34",
                                style: TextStyle(fontSize: 20),
                              ),
                              const SizedBox(
                                height: 35,
                              ),
                              TextFormField(
                                decoration:
                                    loginInputDecorationWithSpecificProperties(
                                        hint: "Amount 10AED".tr()),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 65),
                                child: DefaultButton(
                                  onButtonPressed: () {
                                    showModalBottomSheet(
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(60))),
                                      isScrollControlled: true,
                                      backgroundColor: Colors.white,
                                      context: context,
                                      builder: (builder) {
                                        return PaymentMethodEmployeePopUp(
                                            onConfirmClicked: () {});
                                      },
                                    );
                                  },
                                  text: 'Charge'.tr(),
                                ),
                              ),
                            ]),
                      ),
                    )))));
  }
}

import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter/material.dart';
import 'package:millionaire_app/constants.dart';
import 'package:millionaire_app/managers/resource_manager.dart';
import 'package:millionaire_app/route/auto_route.gr.dart';
import 'package:millionaire_app/ui/popups/card_number_popup.dart';
import 'package:millionaire_app/ui/popups/round_popup.dart';
import 'package:millionaire_app/ui/widgets/default_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'components/payment_group.dart';

class PaymentMethodPopUp extends StatefulWidget {
  final Function() onConfirmClicked;

  const PaymentMethodPopUp({Key? key, required this.onConfirmClicked})
      : super(key: key);

  @override
  State<PaymentMethodPopUp> createState() => _PaymentMethodPopUpState();
}

class _PaymentMethodPopUpState extends State<PaymentMethodPopUp> {
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
              height: 21,
            ),
            Center(
              child: Container(
                width: 82,
                height: 2,
                color: accentColor,
              ),
            ),
            const SizedBox(
              height: 55,
            ),
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                'Check out'.tr(),
                style: const TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Subtotal'.tr(),
                      style: const TextStyle(color: mainText, fontSize: 20),
                    ),
                  ),
               const Text(
                    '192.00 IQD',
                    style: TextStyle(fontSize: 20, color: mainText),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
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
            ),
            const SizedBox(
              height: 40,
            ),
             Center(
              child: Text(
                "Payment methods".tr(),
                style: const TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 37),
              child: PaymentGroup(
                icons: _paymentIcons,
                options: _paymentOptions,
                functionsList: _paymentOptionsActions,
              ),
            ),
            const SizedBox(
              height: 25,
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
                      showModalBottomSheet(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(60))),
                        isScrollControlled: true,
                        backgroundColor: Colors.white,
                        context: context,
                        builder: (builder) {
                          return CardNumberPopup(onConfirmClicked: () {
                            navBarGlobalKey.currentState!.currentTabsRouter!.setActiveIndex(0);
                            navBarGlobalKey.currentState!.clearRoutingStack(0);
                          });
                        },
                      );
                    },
                    text: 'Next'.tr(),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }

  final List<String> _paymentOptions = [
    'VISA',
    'Wallet payment',
    'Asia transfer',
    'Zain cash',
    'Master card',
  ];
  final List<String> _paymentIcons = [
    ResourceManager.getResource(name: 'visa.png'),
    ResourceManager.getResource(name: 'wallet_payment.png'),
    ResourceManager.getResource(name: 'asia_transfer.png'),
    ResourceManager.getResource(name: 'zain_cash.png'),
    ResourceManager.getResource(name: 'master_card.png'),
  ];
  List<Function()> get _paymentOptionsActions {
    List<Function()> _paymentOptionsActions = [];

    for (String item in _paymentOptions) {
      switch (item) {
        case 'VISA':
          _paymentOptionsActions.add(() => print("VISA"));
          break;
        case 'Wallet payment':
          _paymentOptionsActions.add(() => print("wallet Payment"));
          break;
        case 'Asia transfer':
          _paymentOptionsActions.add(() => print("Asia transfer"));
          break;
        case 'Zain cash':
          _paymentOptionsActions.add(() => print("Zain cash"));
          break;
        case 'Master card':
          _paymentOptionsActions.add(() => print("Master card"));
          break;
      }
    }

    return _paymentOptionsActions;
  }
}

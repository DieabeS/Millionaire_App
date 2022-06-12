import 'package:flutter/material.dart';
import 'package:millionaire_app/ui/widgets/bouncing_animated_widget.dart';

import '../../../../constants.dart';

class PaymentItem extends StatelessWidget {
  const PaymentItem({
    Key? key,
    required this.icon,
    required this.paymentText,
    required this.optionsAction,
  }) : super(key: key);

  final String icon;
  final String paymentText;
  final Function() optionsAction;

  @override
  Widget build(BuildContext context) {
    return BounceAnimatedWidget(
      onTap: optionsAction,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          color: Colors.white,
          padding:
              const EdgeInsets.only(top: 16, bottom: 16, left: 20, right: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 36,
                width: 36,
                child: Image.asset(
                  icon,
                ),
              ),
              const SizedBox(width: 100),
              Expanded(
                child: Text(
                  paymentText,
                  style: const TextStyle(
                    color: mainText,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

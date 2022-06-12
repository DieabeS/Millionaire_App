import 'package:flutter/material.dart';
import 'package:millionaire_app/ui/popups/components/payment_item.dart';

class PaymentGroup extends StatelessWidget {
  const PaymentGroup({
    Key? key,
    required List<String> icons,
    required List<String> options,
    required List<Function()> functionsList,
  })  : _icons = icons,
        _options = options,
        _functionsList = functionsList,
        super(key: key);

  final List<String> _icons;
  final List<String> _options;
  final List<Function()> _functionsList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        _options.length,
        (index) => Column(
          children: [
            PaymentItem(
              optionsAction: _functionsList[index],
              icon: _icons[index],
              paymentText: _options[index],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

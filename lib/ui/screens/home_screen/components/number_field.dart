import 'package:flutter/material.dart';

import '../../../../constants.dart';

class NumberField extends StatelessWidget {
  const NumberField(
      {Key? key,
      required this.number,
      required this.radius,
      this.withShadow = false,
      this.padding = const EdgeInsets.all(15),
      this.fontSize = 20})
      : super(key: key);

  final String number;
  final double radius;
  final bool withShadow;
  final EdgeInsets padding;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: withShadow
              ? const [BoxShadow(offset: Offset(0, 2), blurRadius: 6, spreadRadius: 0, color: Color(0xFFFFE651))]
              : const [BoxShadow(offset: Offset(0, 2), blurRadius: 6, spreadRadius: 0, color: subtitleColor)],
          borderRadius: BorderRadius.circular(radius),
          border: withShadow ? Border.all(width: 3, color: const Color(0xFFFFE651)) : null),
      child: Center(
          child: Text(
        number,
        style: TextStyle(color: mainText, fontSize: fontSize),
      )),
    );
  }
}

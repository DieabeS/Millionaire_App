
import 'package:flutter/material.dart';

import '../../constants.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.text,
    required this.onButtonPressed,
  }) : super(key: key);

  final String text;
  final Function() onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onButtonPressed,
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      child: Ink(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [const Color(0xFF8BE2F7).withOpacity(0.75), const Color(0xFFB4F5F5)]),
            borderRadius: BorderRadius.circular(20)),
        child: Container(
          width: double.infinity,
          height: 60,
          alignment: Alignment.center,
          child: Text(
            text,
            style: const TextStyle(fontSize: 20, color: mainText),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

import '../constants.dart';

loginInputDecorationWithSpecificProperties({IconData? icon, String? hint, Function()? onIconPressed, String? image}) {
  return InputDecoration(
      fillColor: Colors.white,
      filled: true,
      suffixIcon: icon != null
          ? GestureDetector(onTap: onIconPressed, child: Icon(icon))
          : image != null
              ? GestureDetector(onTap: onIconPressed, child: Image.asset(image))
              : null,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: const BorderSide(
          width: 0.5,
          color: Colors.black54
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: const BorderSide(
          width: 0.5,
        ),
      ),
      border: const OutlineInputBorder(),
      hintText: hint,
      hintStyle: const TextStyle(color: subtitleColor));
}

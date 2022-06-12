


import 'package:flutter/material.dart';

class SocialCard extends StatelessWidget {
  const SocialCard({
    Key? key,
    required this.icon,
    required this.onSocialCardPressed,
  }) : super(key: key);
  final String icon;
  final Function() onSocialCardPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Image.asset(icon), onTap: onSocialCardPressed);
  }
}
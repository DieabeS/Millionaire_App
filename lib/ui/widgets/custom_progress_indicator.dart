import 'package:flutter/material.dart';
import 'package:millionaire_app/ui/widgets/cicular_progress_indicator.dart';

import '../../constants.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({Key? key, this.fillColor, this.withBorder = false, this.backgroundColor})
      : super(key: key);
  final Color? fillColor;
  final Color? backgroundColor;
  final bool withBorder;
  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
        radius: 100.0,
        lineWidth: 20.0,
        animation: true,
        percent: 0.65,
        center: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              '04D',
              style: TextStyle(fontSize: 26, color: titleColor),
            ),
            Text(
              '07H',
              style: TextStyle(fontSize: 22, color: Color(0xFFFE8383)),
            ),
            Text(
              '44M',
              style: TextStyle(fontSize: 17, color: titleColor),
            ),
            Text(
              '56S',
              style: TextStyle(fontSize: 17, color: titleColor),
            )
          ],
        ),
        boxBorder: withBorder ? Border.all(color: scaffoldBackgroundColor, width: 5) : null,
        fillColor: fillColor != null ? fillColor! : Colors.transparent,
        circularStrokeCap: CircularStrokeCap.round,
        progressColor: const Color(0xFFFFE651),
        backgroundColor: backgroundColor != null ? backgroundColor! : Colors.transparent);
  }
}

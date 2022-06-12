import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogHelper {
  static Future<dynamic> showAnimatedDialog(BuildContext context, dynamic page,
      {bool withBlackBackground = true,
      bool cancelOnTouchOutSide = true,
      async = false,
      bool useRootNavigator = true}) async {
    return showGeneralDialog(
        barrierColor: withBlackBackground ? Colors.black.withOpacity(0.5) : Colors.black.withOpacity(0.1),
        transitionBuilder: (context, a1, a2, widget) {
          final curvedValue = Curves.easeInOut.transform(a1.value) - 1.0;
          return Transform(
            transform: Matrix4.translationValues(0.0, curvedValue * -100, 0.0),
            child: Opacity(opacity: a1.value, child: page),
          );
        },
        transitionDuration: const Duration(milliseconds: 400),
        barrierDismissible: cancelOnTouchOutSide,
        barrierLabel: '',
        context: context,
        useRootNavigator: useRootNavigator,
        pageBuilder: (c, a1, a2) {
          return Container();
        });
  }
}

import 'package:flutter/material.dart';

mixin StatefulScreenState<T extends StatefulWidget> on State<T> {
  var controller = ScreenStateController();
  Widget screen(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        screen(context),
        ValueListenableBuilder(
          valueListenable: controller,
          builder: (BuildContext context, bool value, Widget? child) {
            if (value) {
              return Scaffold(
                backgroundColor: Colors.black.withOpacity(0.1),
              );
            } else {
              return Container();
            }
          },
        )
      ],
    );
  }

  startLoading() {
    controller.loading = true;
  }

  stopLoading() {
    controller.loading = false;
  }
}

class ScreenStateController extends ValueNotifier<bool> {
  ScreenStateController({bool value = false}) : super(value);

  bool get loading => value;
  set loading(bool l) {
    value = l;
  }
}

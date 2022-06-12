import 'package:flutter/material.dart';
import 'package:millionaire_app/ui/widgets/custom_progress_indicator.dart';

import '../../constants.dart';

class ProgressIndicatorContainer extends StatefulWidget {
  const ProgressIndicatorContainer(
      {Key? key, required this.screenWidth, required this.inputWidth, required this.children, this.height})
      : super(key: key);

  final double screenWidth;
  final double inputWidth;
  final List<Widget> children;
  final double? height;

  @override
  State<ProgressIndicatorContainer> createState() => _ProgressIndicatorContainerState();
}

class _ProgressIndicatorContainerState extends State<ProgressIndicatorContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: (widget.screenWidth - widget.inputWidth) / 2),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: widget.height,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(69),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                const SizedBox(
                  height: 150,
                ),
                ...widget.children,
              ]),
            ),
          ),
          const Positioned(
              top: -42,
              child: CustomProgressIndicator(
                  withBorder: true, fillColor: scaffoldBackgroundColor, backgroundColor: Colors.white))
        ],
      ),
    );
  }
}

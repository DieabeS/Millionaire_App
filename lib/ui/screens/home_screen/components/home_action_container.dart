import 'package:flutter/material.dart';
import 'package:millionaire_app/ui/widgets/bouncing_animated_widget.dart';

import '../../../../constants.dart';

class HomeActionContainer extends StatelessWidget {
  const HomeActionContainer({
    Key? key,
    required this.image,
    required this.text,
    required this.onCardClicked,
    this.height = 163,
    this.width = 117,
  }) : super(key: key);
  final String image;
  final String text;
  final Function onCardClicked;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return BounceAnimatedWidget(
      onTap: onCardClicked,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: width,
          height: height,
          color: Colors.white,
          child: Column(
            children: [
              Image.asset(image),
              const SizedBox(height: 10),
              Expanded(
                  child: Text(
                text,
                style: const TextStyle(color: mainText, fontSize: 20),
                textAlign: TextAlign.center,
              ))
            ],
          ),
        ),
      ),
    );
  }
}

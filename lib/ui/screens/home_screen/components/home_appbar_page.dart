
import 'package:flutter/material.dart';

class HomeAppBarPage extends StatelessWidget {
  const HomeAppBarPage({
    Key? key,
    required this.image,
    required this.widgets,
  }) : super(key: key);
  final String image;
  final List<Widget> widgets;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(68),
            ),
            image: DecorationImage(
              image: AssetImage(
                image,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 425.0,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(68),
              ),
              color: Colors.white,
              gradient: LinearGradient(begin: FractionalOffset.topCenter, end: FractionalOffset.bottomCenter, colors: [
                Colors.transparent,
                const Color(0xFFDEEEFF).withOpacity(0.9),
              ], stops: const [
                0.0,
                1.0
              ])),
          child: Padding(
            padding: const EdgeInsets.only(left: 13, bottom: 78),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: widgets,
            ),
          ),
        ),
      ],
    );
  }
}
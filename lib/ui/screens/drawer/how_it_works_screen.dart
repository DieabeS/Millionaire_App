import "package:flutter/material.dart";
import 'package:millionaire_app/constants.dart';
import 'package:easy_localization/easy_localization.dart';

class HowItWorksScreen extends StatefulWidget {
  const HowItWorksScreen({Key? key}) : super(key: key);

  @override
  State<HowItWorksScreen> createState() => _HowItWorksScreenState();
}

class _HowItWorksScreenState extends State<HowItWorksScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: accentColor,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: buildBackGroundGradient(),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 29),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Image.asset("assets/images/mini_logo.png"),
                    const SizedBox(
                      height: 60,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 40,
                        ),
                        Image.asset("assets/images/question_mark.png"),
                        const SizedBox(
                          width: 18,
                        ),
                        Text(
                          "How it works".tr(),
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

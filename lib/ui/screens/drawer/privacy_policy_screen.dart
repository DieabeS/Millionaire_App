import "package:flutter/material.dart";
import 'package:millionaire_app/constants.dart';
import 'package:easy_localization/easy_localization.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
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
                        Image.asset("assets/images/privacy_policy.png"),
                        const SizedBox(
                          width: 18,
                        ),
                        Text(
                          "Privacy Policy".tr(),
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Text('privacy_policy'.tr()),
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

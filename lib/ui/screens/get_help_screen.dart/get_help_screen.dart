import "package:flutter/material.dart";
import 'package:millionaire_app/helpers/input_decoration.dart';
import 'package:millionaire_app/managers/resource_manager.dart';
import 'package:millionaire_app/ui/widgets/default_button.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../constants.dart';

class GetHelpScreen extends StatefulWidget {
  const GetHelpScreen({Key? key}) : super(key: key);

  @override
  State<GetHelpScreen> createState() => _GetHelpScreenState();
}

class _GetHelpScreenState extends State<GetHelpScreen> {
  String? emailErrorMessage;
  late TextEditingController emailController;
  late TextEditingController subjectController;
  late TextEditingController messageController;

  @override
  void initState() {
    emailController = TextEditingController();
    subjectController = TextEditingController();
    messageController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double inputWidth = (screenWidth > 400) ? 400 : (screenWidth * 75 / 100);
    return Container(
      color: accentColor,
      child: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: buildBackGroundGradient(),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 29),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Image.asset(
                        ResourceManager.getResource(name: "mini_logo.png")),
                    const SizedBox(
                      height: 45,
                    ),
                    Row(
                      children: [
                        // const SizedBox(
                        //   width: 20,
                        // ),
                        Image.asset(
                            ResourceManager.getResource(name: "support.png")),
                        const SizedBox(
                          width: 18,
                        ),
                        Text(
                          "Get Help / Send Feedback".tr(),
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Column(
                      children: [
                        const Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum sus",
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: (screenWidth - inputWidth) / 2),
                          child: TextFormField(
                            //controller: emailController,
                            decoration:
                                loginInputDecorationWithSpecificProperties(
                                    hint: "Email".tr()),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: (screenWidth - inputWidth) / 2),
                          child: TextFormField(
                            //controller: subjectController,
                            decoration:
                                loginInputDecorationWithSpecificProperties(
                                    hint: "subject".tr()),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: (screenWidth - inputWidth) / 2),
                          child: TextField(
                            textInputAction: TextInputAction.done,
                            onChanged: (value) {
                              setState(() {});
                            },
                            //  controller: messagecontroller,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              counter: Container(),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(21),
                                borderSide: const BorderSide(
                                  width: 0.5,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(21),
                                borderSide: const BorderSide(
                                  width: 0.5,
                                ),
                              ),
                              border: const OutlineInputBorder(),
                              hintText: 'Message'.tr(),
                            ),
                            style: const TextStyle(fontSize: 16),
                            maxLines: 15,
                            maxLength: 500,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: (screenWidth - inputWidth) / 2),
                          child: AbsorbPointer(
                            absorbing: false,
                            child: Opacity(
                              opacity: 1,
                              child: DefaultButton(
                                onButtonPressed: () {},
                                text: 'Send'.tr(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
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

import 'package:auto_route/src/router/auto_router_x.dart';
import "package:flutter/material.dart";
import 'package:millionaire_app/helpers/dialog_helper.dart';
import 'package:millionaire_app/helpers/input_decoration.dart';
import 'package:millionaire_app/managers/resource_manager.dart';
import 'package:millionaire_app/route/auto_route.gr.dart';
import 'package:millionaire_app/ui/popups/pincode_popup.dart';
import 'package:millionaire_app/ui/widgets/default_button.dart';
import 'package:millionaire_app/ui/widgets/custom_drop_down_button.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../constants.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isValid = false;
  bool passwordHidden = true;
  bool confirmPasswordHidden = true;

  String? passwordErrorMessage;
  String? usernameErrorMessage;
  late TextEditingController userName1Controller;
  late TextEditingController userNameController;
  late TextEditingController lastNameController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController mobileController;
  late FocusNode focusNode;
  final _formKey = GlobalKey<FormState>();
  String? genderSelectedValue;
  String? governorateSelectedValue;

  @override
  void initState() {
    lastNameController = TextEditingController();
    userName1Controller = TextEditingController();
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    mobileController = TextEditingController();
    super.initState();
  }

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double inputWidth = (screenWidth > 400) ? 400 : (screenWidth * 75 / 100);
    return Container(
      color: accentColor,
      child: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: buildBackGroundGradient(),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: (screenWidth - inputWidth) / 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Image.asset(
                        ResourceManager.getResource(name: "mini_logo.png")),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Sign Up".tr(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Flexible(
                          flex: 2,
                          child: TextFormField(
                            controller: userNameController,
                            decoration:
                                loginInputDecorationWithSpecificProperties(
                                    hint: "User Name".tr()),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Flexible(
                          flex: 2,
                          child: TextFormField(
                            controller: lastNameController,
                            decoration:
                                loginInputDecorationWithSpecificProperties(
                                    hint: "Last Name".tr()),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        TextFormField(
                          controller: userName1Controller,
                          decoration:
                              loginInputDecorationWithSpecificProperties(
                                  hint: "User Name".tr()),
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          controller: passwordController,
                          obscureText: passwordHidden ? true : false,
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration:
                              loginInputDecorationWithSpecificProperties(
                                  hint: 'password'.tr(),
                                  onIconPressed: togglePasswordStatus,
                                  image: ResourceManager.getResource(
                                      name: passwordHidden
                                          ? 'visible_eye_icon.png'
                                          : 'hidden_eye.png')),
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          controller: confirmPasswordController,
                          obscureText: confirmPasswordHidden ? true : false,
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration:
                              loginInputDecorationWithSpecificProperties(
                                  hint: 'Confirm password'.tr(),
                                  onIconPressed: toggleConfirmPasswordStatus,
                                  image: ResourceManager.getResource(
                                      name: confirmPasswordHidden
                                          ? 'visible_eye_icon.png'
                                          : 'hidden_eye.png')),
                        ),
                        const SizedBox(height: 15),
                        CustomDropDownButton(
                            text: 'Gender'.tr(),
                            items: const ['Male', 'Female'],
                            onValueSelected: (value) {
                              setState(() {
                                genderSelectedValue = value;
                              });
                            },
                            selectedValue: genderSelectedValue),
                        const SizedBox(height: 15),
                        CustomDropDownButton(
                            text: 'Governorate'.tr(),
                            items: const ['Baghdad', 'Baghdad'],
                            onValueSelected: (value) {
                              setState(() {
                                governorateSelectedValue = value;
                              });
                            },
                            selectedValue: governorateSelectedValue),
                        const SizedBox(height: 15),
                        TextFormField(
                          controller: mobileController,
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration:
                              loginInputDecorationWithSpecificProperties(
                            hint: 'Mobile'.tr(),
                          ),
                        ),
                        const SizedBox(height: 25),
                        Row(
                          children: [
                            Checkbox(
                                activeColor: accentColor,
                                value: isChecked,
                                onChanged: (bool? value) {
                                  setState(
                                    () {
                                      isChecked = value!;
                                    },
                                  );
                                }),
                            Expanded(
                                child: Text.rich(
                              TextSpan(
                                text: 'I read & accepted the'.tr(),
                                style: const TextStyle(fontSize: 16),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'terms and conditions'.tr(),
                                      style: const TextStyle(
                                        decoration: TextDecoration.underline,
                                      )),
                                ],
                              ),
                            )),
                          ],
                        ),
                        const SizedBox(height: 8),
                        AbsorbPointer(
                          absorbing: false,
                          child: Opacity(
                            opacity: 1,
                            child: DefaultButton(
                              onButtonPressed: () {
                                DialogHelper.showAnimatedDialog(context,
                                    PinCodePopUp(onConfirmClicked: () {
                                  context.router.pushAndPopUntil(
                                      CustomerBottomNavBarRoute(
                                          key: navBarGlobalKey),
                                      predicate: (r) => false);
                                }));
                              },
                              text: 'Sign Up'.tr(),
                            ),
                          ),
                        ),
                        const SizedBox(height: 100),
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

  validatePassword() {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (passwordController.text.isEmpty) {
      setState(() {
        passwordErrorMessage = 'enter_an_password';
      });
    } else if (!regex.hasMatch(passwordController.text)) {
      setState(() {
        passwordErrorMessage = 'enter_valid_password';
      });
    }
  }

  bool sendBtnIsEnabled() {
    return userNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty;
  }

  togglePasswordStatus() {
    setState(() {
      passwordHidden = !passwordHidden;
    });
  }

  toggleConfirmPasswordStatus() {
    setState(() {
      confirmPasswordHidden = !confirmPasswordHidden;
    });
  }
}

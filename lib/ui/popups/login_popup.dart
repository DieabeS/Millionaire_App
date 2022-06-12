import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter/material.dart';
import 'package:millionaire_app/constants.dart';
import 'package:millionaire_app/helpers/input_decoration.dart';
import 'package:millionaire_app/managers/resource_manager.dart';
import 'package:millionaire_app/route/auto_route.gr.dart';
import 'package:millionaire_app/ui/popups/round_popup.dart';
import 'package:millionaire_app/ui/widgets/default_button.dart';
import 'package:easy_localization/easy_localization.dart';

class LoginPopup extends StatefulWidget {
  final Function() onConfirmClicked;

  const LoginPopup({Key? key, required this.onConfirmClicked})
      : super(key: key);

  @override
  State<LoginPopup> createState() => _LoginPopupState();
}

class _LoginPopupState extends State<LoginPopup> {
  bool passwordHidden = true;
  String? usernameErrorMessage;
  String? passwordErrorMessage;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double inputWidth = (screenWidth > 400) ? 400 : (screenWidth * 75 / 100);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: (screenWidth - inputWidth) / 2),
      child: RoundPopup(
        children: [
          const SizedBox(
            height: 40,
          ),
          Center(
            child: Container(
              width: 82,
              height: 2,
              color: accentColor,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Center(
            child: Text(
              'Please login to continue'.tr(),
              style: const TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextFormField(
              // controller: userNameController,
              decoration: loginInputDecorationWithSpecificProperties(
                  hint: "User Name".tr()),
            ),
          ),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextFormField(
              //controller: passwordController,
              obscureText: passwordHidden ? true : false,
              enableSuggestions: false,
              autocorrect: false,
              decoration: loginInputDecorationWithSpecificProperties(
                  hint: 'password'.tr(),
                  onIconPressed: togglePasswordStatus,
                  image: ResourceManager.getResource(
                      name: passwordHidden
                          ? 'hidden_eye.png'
                          : 'visible_eye_icon.png')),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Forget password?".tr(),
                    style: const TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 16,
                        color: mainText)),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 65),
            child: AbsorbPointer(
              absorbing: false,
              child: Opacity(
                opacity: 1,
                child: DefaultButton(
                  onButtonPressed: () {},
                  text: 'Login'.tr(),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Not a member?".tr(),
                  style: const TextStyle(fontSize: 16, color: mainText)),
              GestureDetector(
                  onTap: () {
                    context.router.push(const SignUpRoute());
                  },
                  child: Text("Register now".tr(),
                      style: const TextStyle(fontSize: 16, color: mainText))),
            ],
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }

  togglePasswordStatus() {
    setState(() {
      passwordHidden = !passwordHidden;
    });
  }
}

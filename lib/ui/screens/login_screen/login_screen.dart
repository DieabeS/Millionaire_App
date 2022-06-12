import 'package:auto_route/src/router/auto_router_x.dart';
import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import 'package:millionaire_app/helpers/input_decoration.dart';
import 'package:millionaire_app/managers/resource_manager.dart';
import 'package:millionaire_app/route/auto_route.gr.dart';
import 'package:millionaire_app/ui/screens/employee_bottom_nav_bar_screen.dart';
import 'package:millionaire_app/ui/widgets/bouncing_animated_widget.dart';
import 'package:millionaire_app/ui/widgets/default_button.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../constants.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool passwordHidden = true;
  String? usernameErrorMessage;
  String? passwordErrorMessage;
  late TextEditingController userNameController;
  late TextEditingController passwordController;

  @override
  void initState() {
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double inputWidth = (screenWidth > 400) ? 350 : (screenWidth * 75 / 100);
    return SafeArea(
        child: Container(
      height: 200,
      width: 20,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            ResourceManager.getResource(
              name: 'login_background.png',
            ),
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: (screenWidth - inputWidth) / 2),
            child: Column(
              children: [
                const SizedBox(
                  height: 190,
                ),
                Image.asset(
                  ResourceManager.getResource(name: "logo.png"),
                ),
                const SizedBox(height: 70),
                TextFormField(
                  controller: userNameController,
                  decoration: loginInputDecorationWithSpecificProperties(
                      hint: "User Name".tr()),
                ),
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  controller: passwordController,
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
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Forget Password?".tr(),
                        style: const TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 16,
                            color: mainText)),
                  ],
                ),
                const SizedBox(height: 40),
                AbsorbPointer(
                  absorbing: false,
                  child: Opacity(
                    opacity: 1,
                    child: DefaultButton(
                      onButtonPressed: () {
                        if (userNameController.text == 'em') {
                          context.router.pushAndPopUntil(
                              EmployeeBottomNavBarRoute(key: navBarGlobalKey),
                              predicate: (r) => false);
                        } else {
                          context.router.pushAndPopUntil(
                              CustomerBottomNavBarRoute(key: navBarGlobalKey),
                              predicate: (r) => false);
                        }
                      },
                      text: 'Login'.tr(),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
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
                            style: const TextStyle(
                                fontSize: 16, color: mainText))),
                  ],
                ),
                const SizedBox(height: 100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    BounceAnimatedWidget(
                      onTap: () {
                        context.router.pushAndPopUntil(
                            CustomerBottomNavBarRoute(key: navBarGlobalKey),
                            predicate: (r) => false);
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(32),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 25),
                          color: Colors.white,
                          child: Text(
                            "Skip".tr(),
                            style:
                                const TextStyle(fontSize: 15, color: mainText),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  togglePasswordStatus() {
    setState(() {
      passwordHidden = !passwordHidden;
    });
  }
}

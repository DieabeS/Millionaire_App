import "package:flutter/material.dart";
import 'package:millionaire_app/helpers/input_decoration.dart';
import 'package:millionaire_app/managers/resource_manager.dart';
import 'package:millionaire_app/ui/widgets/default_button.dart';
import 'package:millionaire_app/ui/widgets/custom_drop_down_button.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../constants.dart';
//import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late TextEditingController userNameController;
  bool isEdit = false;
  String? governorateSelectedValue;
  String? genderSelectedValue;

  @override
  void initState() {
    userNameController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double inputWidth = (screenWidth > 400) ? 400 : (screenWidth * 75 / 100);
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: buildBackGroundGradient(),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: navBarGlobalKey.currentState != null ? 40 : 80,
                ),
                if (navBarGlobalKey.currentState != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 29),
                    child: Image.asset(
                        ResourceManager.getResource(name: "mini_logo.png")),
                  ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: (screenWidth - inputWidth) / 2),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      // DialogHelper.showAnimatedDialog(
                                      //   context,
                                      //     OtpPopUp(onConfirmClicked: () {}));
                                      setState(() {
                                        isEdit = !isEdit;
                                      });
                                    },
                                    child: Image.asset(
                                        ResourceManager.getResource(
                                            name: 'write.png'))),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(6.0),
                                boxShadow: const [
                                  BoxShadow(color: Colors.blueAccent)
                                ],
                              ),
                              padding: const EdgeInsets.all(24.0),
                              child: IconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return SimpleDialog(
                                            title: Text("Camera/Gallery".tr()),
                                            children: <Widget>[
                                              SimpleDialogOption(
                                                onPressed: () {},
                                                child: Text(
                                                    'Pick From Gallery'.tr()),
                                              ),
                                              SimpleDialogOption(
                                                onPressed: () {},
                                                child: Text(
                                                    'Take A New Picture'.tr()),
                                              ),
                                            ]);
                                      });
                                },
                                icon: const Icon(Icons.camera_alt),
                                iconSize: 23.0,
                              ),
                            ),
                          ),
                          if (!isEdit)
                            Column(
                              children: [
                                const SizedBox(
                                  height: 30,
                                ),
                                const Text(
                                  "Doaa Alayoubie",
                                  style: TextStyle(
                                    fontSize: 27,
                                    color: titleColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 50),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      ProfileInfo(
                                          info: 'user_name',
                                          value: 'Doaa Al Ayoubie'),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      ProfileInfo(
                                          info: 'gender', value: 'Female'),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      ProfileInfo(
                                          info: 'country_of_residence',
                                          value: 'Iraq'),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      ProfileInfo(
                                          info: 'governorate',
                                          value: 'Baghdad'),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      ProfileInfo(
                                          info: 'mobile',
                                          value: '41124-212-233'),
                                      SizedBox(
                                        height: 50,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          if (isEdit)
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 50, right: 50),
                              child: Column(
                                children: [
                                  const SizedBox(height: 45),
                                  TextFormField(
                                    controller: userNameController,
                                    decoration:
                                        loginInputDecorationWithSpecificProperties(
                                            hint: "User Name".tr()),
                                  ),
                                  const SizedBox(height: 15),
                                  TextFormField(
                                    controller: userNameController,
                                    decoration:
                                        loginInputDecorationWithSpecificProperties(
                                            hint: "User Name".tr()),
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
                                      items: const ['Baghdad', 'bosra'],
                                      onValueSelected: (value) {
                                        setState(() {
                                          governorateSelectedValue = value;
                                        });
                                      },
                                      selectedValue: governorateSelectedValue),
                                  const SizedBox(height: 15),
                                  TextFormField(
                                    // controller: mobileController,
                                    enableSuggestions: false,
                                    autocorrect: false,
                                    decoration:
                                        loginInputDecorationWithSpecificProperties(
                                      hint: 'Mobile'.tr(),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 50,
                                  ),
                                  DefaultButton(
                                      text: 'Save'.tr(),
                                      onButtonPressed: () {}),
                                  const SizedBox(
                                    height: 50,
                                  ),
                                ],
                              ),
                            )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({
    Key? key,
    required this.info,
    required this.value,
  }) : super(key: key);

  final String info;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          info,
          style: const TextStyle(
            fontSize: 16,
            color: subtitleColor,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            color: subtitleColor,
          ),
        ),
      ],
    );
  }
}

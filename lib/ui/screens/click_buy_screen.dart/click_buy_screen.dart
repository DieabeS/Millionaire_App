import "package:flutter/material.dart";
import 'package:millionaire_app/managers/resource_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:millionaire_app/ui/screens/drawer/settings_drawer.dart';
import 'package:millionaire_app/ui/widgets/bouncing_animated_widget.dart';
import '../../../constants.dart';

class ClickBuyScreen extends StatefulWidget {
  const ClickBuyScreen({Key? key}) : super(key: key);

  @override
  State<ClickBuyScreen> createState() => _ClickBuyScreenState();
}

class _ClickBuyScreenState extends State<ClickBuyScreen> {
  String? emailErrorMessage;
  late TextEditingController emailController;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    emailController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        drawer: const SettingsDrawer(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Container(
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
                      height: 40,
                    ),
                    BounceAnimatedWidget(
                      onTap: () {
                        scaffoldKey.currentState?.openDrawer();
                      },
                      child: Image.asset(ResourceManager.getResource(name: "mini_logo.png")),
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    Row(
                      children: [
                        Image.asset(
                            ResourceManager.getResource(name: "clickbuy.png")),
                        const SizedBox(
                          width: 30,
                        ),
                        Text(
                          "Click Buy".tr(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 25),
                        color: Colors.white,
                        child: const Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis.",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(ResourceManager.getResource(
                                name: "visa_wallet.png")),
                            const Text(
                              "Wallet\n Some",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30),
                            ),
                          ],
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            width: 209,
                            color: Colors.white,
                            child: const Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis.",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 25),
                            color: Colors.white,
                            child: const Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis.",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
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

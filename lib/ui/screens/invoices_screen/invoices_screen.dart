import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:millionaire_app/managers/resource_manager.dart';
import 'package:millionaire_app/ui/popups/filter_employee_popup.dart';
import 'package:millionaire_app/ui/screens/drawer/settings_drawer.dart';
import 'package:millionaire_app/ui/widgets/bouncing_animated_widget.dart';
import 'package:millionaire_app/ui/widgets/custom_progress_indicator.dart';
import 'package:millionaire_app/ui/widgets/with_draw_or_deposite_card.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../constants.dart';

class InvoicesScreen extends StatefulWidget {
  const InvoicesScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<InvoicesScreen> createState() => _InvoicesScreenState();
}

class _InvoicesScreenState extends State<InvoicesScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double inputWidth = (screenWidth > 400) ? 400 : (screenWidth * 75 / 100);
    return Container(
        color: accentColor,
        child: SafeArea(
            child: Scaffold(
                body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: buildBackGroundGradient(),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 120,
                ),
                const Center(
                  child: CustomProgressIndicator(
                    backgroundColor: scaffoldBackgroundColor,
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: (screenWidth - inputWidth) / 2),
                  child: Row(
                    children: [
                      BounceAnimatedWidget(
                        onTap: () {
                          showModalBottomSheet(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(60))),
                            isScrollControlled: true,
                            backgroundColor: Colors.white,
                            context: context,
                            builder: (builder) {
                              return FilterEmployeePopUp(
                                  onConfirmClicked: () {});
                            },
                          );
                        },
                        child: SizedBox(
                          height: 30,
                          width: 30,
                          child: Image.asset(
                              ResourceManager.getResource(name: 'filter.png')),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Text(
                          "Filter".tr(),
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        width: 45,
                      ),
                      Text(
                        "Today's total sales:".tr(),
                        style: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "3456 IQD",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 450,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: (screenWidth - inputWidth) / 2),
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return const Padding(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            child: InvoiceContainer(
                              amount: '1235',
                              date: '2/6/2022',
                              invoiceID: '432-223-2323-34',
                              numberPcs: '20',
                              userId: '432-223-2323-34',
                            ),
                          );
                        }),
                  ),
                )
              ],
            ),
          ),
        ))));
  }
}

class InvoiceContainer extends StatelessWidget {
  final String userId;
  final String invoiceID;
  final String date;
  final String numberPcs;

  final String amount;

  const InvoiceContainer({
    Key? key,
    required this.amount,
    required this.userId,
    required this.invoiceID,
    required this.date,
    required this.numberPcs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(23),
        gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFE651),
              Colors.white,
            ],
            stops: [
              0.3,
              0.3,
            ]),
      ),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Invoice ID'.tr(),
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'User ID',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0XFF8B8B8B),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text("Date".tr(),
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0XFF8B8B8B),
                  )),
              const SizedBox(
                height: 10,
              ),
              Text("Number pieces".tr(),
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0XFF8B8B8B),
                  )),
              const SizedBox(
                height: 10,
              ),
              Text("Amount".tr(),
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0XFF8B8B8B),
                  )),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                invoiceID,
                style: const TextStyle(
                  fontSize: 15,
                  color: Color(0XFF8B8B8B),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                userId,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0XFF8B8B8B),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                date,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0XFF8B8B8B),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                numberPcs,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0XFF8B8B8B),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text.rich(TextSpan(children: [
                TextSpan(
                  text: amount,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.red,
                  ),
                ),
                const TextSpan(
                  text: " IQD",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ]))
            ],
          ),
        ],
      ),
    );
  }
}

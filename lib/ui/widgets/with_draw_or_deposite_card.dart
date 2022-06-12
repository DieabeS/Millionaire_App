import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class WithDrawOrDepositeCard extends StatelessWidget {
  const WithDrawOrDepositeCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'ID',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0XFF8B8B8B),
                  ),
                ),
                Text("Date".tr(),
                    style: const TextStyle(
                      fontSize: 20,
                    )),
                Text("Amount".tr(),
                    style: const TextStyle(
                      fontSize: 20,
                    )),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "432-223-2323-34",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0XFF8B8B8B),
                  ),
                ),
                Text(
                  "3/22/2022",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  "3456IQD",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

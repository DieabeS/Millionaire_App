import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter/material.dart';
import 'package:millionaire_app/helpers/local_provider.dart';
import 'package:millionaire_app/managers/resource_manager.dart';
import 'package:millionaire_app/route/auto_route.gr.dart';
import 'package:millionaire_app/ui/screens/home_screen/components/number_field.dart';

import '../../constants.dart';
import 'bouncing_animated_widget.dart';

class TicketWidget extends StatelessWidget {
  const TicketWidget({
    Key? key,
    required this.image,
    this.withBanner = false,
    this.withShadow = false,
  }) : super(key: key);

  final String image;
  final bool withBanner;
  final bool withShadow;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.asset(ResourceManager.getResource(name: image)),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (!withBanner) Expanded(child: SizedBox()),
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                              5,
                              (index) => Row(
                                    children: [
                                      NumberField(
                                        number: (index + 1).toString(),
                                        radius: 10,
                                        fontSize: 14,
                                        withShadow: withShadow && (index == 3 || index == 1) ? true : false,
                                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                      ),
                                      if (index != 5)
                                        const SizedBox(
                                          width: 4,
                                        )
                                    ],
                                  )),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Raffle ID: 2424-2151115',
                          style: TextStyle(color: subtitleColor, fontSize: 15),
                        )
                      ],
                    ),
                  ),
                  if (!withBanner)
                    Container(
                      padding: const EdgeInsetsDirectional.only(end: 20),
                      child: BounceAnimatedWidget(
                          onTap: () {
                          },
                          child: Image.asset(ResourceManager.getResource(name: 'write.png'))),
                    ),
                ],
              ),
            ),
          ),
          if (withBanner)
            LocaleProvider.currentLocal == 'ar'
                ? Positioned(
                    left: 20,
                    top: 1,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 18),
                        decoration: BoxDecoration(
                            color: Color(0xFF31CB27), borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
                        child: Image.asset(
                          ResourceManager.getResource(
                            name: 'present.png',
                          ),
                          height: 15,
                          width: 15,
                        ),
                      ),
                    ),
                  )
                : Positioned(
                    right: 20,
                    top: 1,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                        decoration: BoxDecoration(
                            color: Color(0xFF31CB27), borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
                        child: Image.asset(
                          ResourceManager.getResource(
                            name: 'present.png',
                          ),
                          height: 15,
                          width: 15,
                        ),
                      ),
                    ),
                  )
        ],
      ),
    );
  }
}

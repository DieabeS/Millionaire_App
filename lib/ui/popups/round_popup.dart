import 'package:flutter/material.dart';
import 'package:millionaire_app/constants.dart';
import 'package:millionaire_app/mixins/screen_mixins.dart';

class RoundPopup extends StatefulWidget {
  final List<Widget> children;
  final double? maxHeight;
  final Widget? singleChild;
  final bool withCloseButton;
  final bool withHorizontalPadding;

  RoundPopup(
      {this.children = const <Widget>[],
      this.withHorizontalPadding = true,
      this.maxHeight,
      this.singleChild,
      this.withCloseButton = true});

  @override
  _RoundPopupState createState() => _RoundPopupState();
}

class _RoundPopupState extends State<RoundPopup> with StatefulScreenState {
  @override
  Widget screen(BuildContext context) {
    return Center(
      child: Stack(alignment: Alignment.topCenter, children: <Widget>[
        Material(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(100)),
            child: widget.singleChild ??
                SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(100)),
                        gradient: LinearGradient(
                            colors: [
                              popups.withOpacity(1), popups.withOpacity(1)
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                      ),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: widget.children),
                    ))),
        ////////////////////////
        if (widget.withCloseButton)
          Positioned(
            right: 22,
            top: 6,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: const Align(
                alignment: Alignment.topRight,
                // child: Image.asset(
                //   'assets/images/popupCloseButton.png',
                //   width: 24,
                //   height: 24,
                // ),
              ),
            ),
          ),
      ]),
    );
  }
}

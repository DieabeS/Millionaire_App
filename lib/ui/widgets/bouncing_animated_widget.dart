import 'package:flutter/cupertino.dart';
import 'package:easy_localization/easy_localization.dart';

class BounceAnimatedWidget extends StatefulWidget {
  final Widget child;
  final Function? onTap;
  final Duration duration;
  final Curve curve;
  final withRipple;
  final Function(AnimationStatus status)? animationStatusListener;
  const BounceAnimatedWidget(
      {Key? key,
      required this.child,
      this.onTap,
      this.duration = const Duration(milliseconds: 100),
      this.curve = Curves.easeInOutQuart,
      this.withRipple = false,
      this.animationStatusListener})
      : super(key: key);
  @override
  _BounceAnimatedWidgetState createState() => _BounceAnimatedWidgetState();
}

class _BounceAnimatedWidgetState extends State<BounceAnimatedWidget>
    with SingleTickerProviderStateMixin {
  var scaled = false;
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    )
      ..addListener(() => setState(() {}))
      ..addStatusListener((status) {
        if (widget.animationStatusListener != null) {
          widget.animationStatusListener!(status);
        }
      });
    final Animation curve =
        CurvedAnimation(parent: animationController, curve: widget.curve);
    animation =
        Tween(begin: 1.0, end: 0.97).animate(curve as Animation<double>);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (details) async {
        await Future.delayed(widget.duration);
        animationController.animateBack(0);
      },
      onTapCancel: () async {
        await Future.delayed(widget.duration * 2);
        animationController.animateBack(0);
      },
      onTapDown: (details) {
        animationController.forward();
      },
      onTap: () async {
        await Future.delayed(widget.duration * 2);
        if (widget.onTap != null) {
          widget.onTap!();
        }
      },
      child: ScaleTransition(
          scale: animation, alignment: Alignment.center, child: widget.child),
    );
  }
}


import 'package:flutter/material.dart';

class CustomTransition extends StatefulWidget {
  final Widget child;
  final Offset beginOffset;
  final int duration;
  CustomTransition({this.child, @required this.beginOffset, this.duration = 300});
  @override
  _CustomTransitionState createState() => _CustomTransitionState();
}

class _CustomTransitionState extends State<CustomTransition>
    with TickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.duration),
    );
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: widget.beginOffset,
        end: Offset.zero,
      ).animate(
        _animationController,
      ),
      child: FadeTransition(
        opacity: _animationController,
        child: widget.child,
      ),
    );
  }
}

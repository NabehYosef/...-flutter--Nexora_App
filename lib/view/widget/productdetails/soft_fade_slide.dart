import 'package:flutter/material.dart';

class SoftFadeSlide
    extends StatefulWidget {
  final Widget child;
  final int index;
  final Duration duration;
  final double offsetY;

  const SoftFadeSlide({
    super.key,
    required this.child,
    this.index = 0,
    this.duration = const Duration(
      milliseconds: 450,
    ),
    this.offsetY = 16,
  });

  @override
  State<SoftFadeSlide> createState() =>
      _SoftFadeSlideState();
}

class _SoftFadeSlideState
    extends State<SoftFadeSlide>
    with
        SingleTickerProviderStateMixin {
  late final AnimationController
  _controller;
  late final Animation<double> _fade;
  late final Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    final curve = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    );
    _fade = curve;
    _slide = Tween<Offset>(
      begin: Offset(
        0,
        widget.offsetY / 80,
      ),
      end: Offset.zero,
    ).animate(curve);

    final delay = Duration(
      milliseconds:
          (widget.index.clamp(0, 8)) *
          70,
    );
    Future.delayed(delay, () {
      if (mounted)
        _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fade,
      child: SlideTransition(
        position: _slide,
        child: widget.child,
      ),
    );
  }
}

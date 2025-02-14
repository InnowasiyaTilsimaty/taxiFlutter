import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class LoadingDotsIndicator extends StatefulWidget {
  const LoadingDotsIndicator({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoadingDotsIndicatorState();
  }
}

class _LoadingDotsIndicatorState extends State<LoadingDotsIndicator>
    with TickerProviderStateMixin {
  static const _durationInMills = 1050;
  static const _delayInMills = [120, 240, 360];

  final List<AnimationController> _animationControllers = [];
  final List<Animation<double>> _scaleAnimations = [];
  final List<Animation<double>> _opacityAnimations = [];

  List<AnimationController> get animationControllers => _animationControllers;

  @override
  void initState() {
    super.initState();
    const cubic = Cubic(0.2, 0.68, 0.18, 0.08);
    for (int i = 0; i < 3; i++) {
      _animationControllers.add(
        AnimationController(
          value: _delayInMills[i] / _durationInMills,
          vsync: this,
          duration: const Duration(milliseconds: _durationInMills),
        ),
      );
      _scaleAnimations.add(
        TweenSequence([
          TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.1), weight: 45),
          TweenSequenceItem(tween: Tween(begin: 0.1, end: 1.0), weight: 35),
          TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.0), weight: 20),
        ]).animate(
          CurvedAnimation(parent: _animationControllers[i], curve: cubic),
        ),
      );

      _opacityAnimations.add(
        TweenSequence([
          TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.7), weight: 45),
          TweenSequenceItem(tween: Tween(begin: 0.7, end: 1.0), weight: 35),
          TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.0), weight: 20),
        ]).animate(
          CurvedAnimation(parent: _animationControllers[i], curve: cubic),
        ),
      );

      _animationControllers[i].repeat();
    }
  }

  @override
  Widget build(BuildContext context) {
    final widgets = List<Widget>.filled(3, Container());
    for (int i = 0; i < 3; i++) {
      widgets[i] = FadeTransition(
        opacity: _opacityAnimations[i],
        child: ScaleTransition(
          scale: _scaleAnimations[i],
          child: Container(
            width: 19,
            height: 19,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
          ),
        ),
      );
    }

    return Row(
      spacing: 8,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        widgets[2],
        widgets[1],
        widgets[0],
      ],
    );
  }

  @override
  void dispose() {
    for (final controller in _animationControllers) {
      controller.dispose();
    }
    super.dispose();
  }
}

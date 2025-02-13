import 'package:flutter/material.dart';
import '../../configs/theme/app_colors.dart';

class LoadingDotsIndicator extends StatefulWidget {
  const LoadingDotsIndicator({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoadingDotsIndicatorState();
  }
}

class _LoadingDotsIndicatorState extends State<LoadingDotsIndicator> with TickerProviderStateMixin {
  static const _durationInMills = 1200;

  final List<AnimationController> _animationControllers = [];
  final List<Animation<double>> _scaleAnimations = [];

  List<AnimationController> get animationControllers => _animationControllers;

  @override
  void initState() {
    super.initState();
    const cubic = Curves.easeInOut;

    for (int i = 0; i < 3; i++) {
      _animationControllers.add(
        AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: _durationInMills),
        ),
      );

      _scaleAnimations.add(
        Tween(begin: 1.0, end: 0.3).animate(
          CurvedAnimation(
            parent: _animationControllers[i],
            curve: cubic,
          ),
        ),
      );

      Future.delayed(Duration(milliseconds: i * 300), () {
        _animationControllers[i].repeat(reverse: true);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        spacing: 8,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          3,
          (i) => ScaleTransition(
            scale: _scaleAnimations[i],
            child: const ClipOval(
              child: SizedBox(
                width: 19,
                height: 19,
                child: ColoredBox(
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
        ),
      ),
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

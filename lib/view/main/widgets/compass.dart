import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';

import '../../../configs/components/compass_custompainter.dart';

class Compass extends StatelessWidget {
  const Compass({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return StreamBuilder(
      stream: FlutterCompass.events,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error reading heading: ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final double? direction = snapshot.data!.heading;

        // if direction is null,
        // then device does not support this sensor

        // show error message
        if (direction == null) return const SizedBox();

        return Stack(
          alignment: Alignment.center,
          children: [
            Transform.scale(
              scale: 0.3,
              child: SizedBox(
                height: 48,
                width: 48,
                child: CustomPaint(
                  size: size / 2,
                  painter: CompassCustomPainter(
                    angle: direction,
                  ),
                ),
              ),
            ),
            Text(
              buildHeadingFirstLetter(direction),
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        );
      },
    );
  }
}

String buildHeadingFirstLetter(double direction) {
  if (direction > 315 && direction < 45) {
    return 'N';
  } else if (direction > 45 && direction < 135) {
    return 'E';
  } else if (direction > 135 && direction < 225) {
    return 'S';
  } else if (direction > 225 && direction < 315) {
    return 'W';
  }

  return 'N';
}

import 'package:flutter/material.dart';
import 'package:ticketing/color_pallete.dart';

class TrackingLines extends StatelessWidget {
  final int length;
  final int currentIndex;

  TrackingLines({
    @required this.length,
    @required this.currentIndex,
  })  : assert(length != null && length > 0),
        assert(currentIndex != null && currentIndex < length);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        length,
        (index) {
          return Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
              width: currentIndex == index ? 15.0 : 10.0,
              height: 3.0,
              color: currentIndex == index ? primaryColor : Colors.grey,
            ),
          );
        },
      ),
    );
  }
}

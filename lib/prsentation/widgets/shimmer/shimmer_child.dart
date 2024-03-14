import 'package:flutter/material.dart';


class ShimmerChild extends StatelessWidget {
  const ShimmerChild({
    super.key,
    this.width,
    this.height,
    this.color = Colors.white,
    this.heightFactor,
    this.widthFactor,
    this.seperator,
    this.count = 1,
    this.radius = 4,
    this.alignment = Alignment.center,
  });

  final double? height, width;
  final double? heightFactor, widthFactor;
  final int count;
  final Widget? seperator;
  final Color color;
  final double radius;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      alignment: alignment,
      widthFactor: widthFactor,
      heightFactor: heightFactor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(
          count,
          (index) => Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(radius),
                ),
              ),
            
            ],
          ),
        ),
      ),
    );
  }
}

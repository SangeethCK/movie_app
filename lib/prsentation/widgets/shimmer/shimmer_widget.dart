import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
 const  ShimmerWidget({
    super.key,
    this.child,
    this.isLoading = true,
    this.shimmerChild,
    this.width,
    this.height,
    this.color = Colors.grey,
    this.baseColor=Colors.grey,
    this.highlightColor=Colors.grey,
    this.radius = 4,
  });

  final Widget? child;
  final Widget? shimmerChild;
  final bool isLoading;
  final double? width, height;
  final double radius;
  final Color color, baseColor, highlightColor;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: isLoading
          ? Shimmer.fromColors(
              baseColor: baseColor,
              highlightColor: highlightColor,
              child: Container(
                
                color: color,
                width: width ?? double.infinity,
                height: height ?? double.infinity,
                child: shimmerChild ?? const SizedBox.shrink(),
              ),
            )
          : child ?? const SizedBox.shrink(),
    );
  }
}

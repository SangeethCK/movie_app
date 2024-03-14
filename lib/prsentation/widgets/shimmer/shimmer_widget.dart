import 'package:flutter/material.dart';
import 'package:movie_app/prsentation/widgets/sizes.dart';
import 'package:shimmer/shimmer.dart';


class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({
    super.key,
    this.child,
    this.isLoading = true,
    this.isError = false,
    this.shimmerChild,
    this.width,
    this.height,
    this.color = Colors.white,
    this.baseColor,
    this.highlightColor,
    this.radius = 4,
  });

  final Widget? child;
  final Widget? shimmerChild;
  final bool isLoading, isError;
  final double? width, height;
  final double radius;
  final Color? color, baseColor, highlightColor;

  @override
  Widget build(BuildContext context) {
    if (isError) {
      return kNone;
    }
    if (isLoading) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Shimmer.fromColors(
          baseColor: baseColor??Colors.grey.shade200,
          highlightColor: highlightColor ?? Colors.grey.shade300,
          child: height != null
              ? Container(
                  color: color,
                  width: width ?? double.infinity,
                  height: height ?? double.infinity,
                )
              : shimmerChild ?? child ?? kNone,
        ),
      );
    } else if (!isLoading) {
      return child ?? kNone;
    } else {
      return kNone;
    }
  }
}

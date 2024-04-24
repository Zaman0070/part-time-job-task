import 'package:jorden_job_task/core/extensions/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final Duration duration;
  final Color? baseColor;
  final double width;
  final double height;
  final Color? highlightColor;
  final double border;

  const ShimmerWidget({super.key, 
    this.duration = const Duration(milliseconds: 1500),
    this.baseColor,
    this.width = double.infinity,
    this.height = double.infinity,
    this.highlightColor, this.border=8,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor??context.whiteColor.withOpacity(0.1),
      highlightColor: highlightColor??context.whiteColor.withOpacity(0.2),
      period: duration,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: context.whiteColor.withOpacity(0.3),
          borderRadius: BorderRadius.circular(border),
        ),
      ),
    );
  }
}

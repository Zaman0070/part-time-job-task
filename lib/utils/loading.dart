import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:jorden_job_task/core/extensions/color_extension.dart';


class LoadingWidget extends StatelessWidget {
  final Color? color;
  final double? size;
  const LoadingWidget({Key? key, this.color, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitThreeBounce(
        color:color?? context.buttonColor,
        size: size??20.0.h,
      ),
    );
  }
}

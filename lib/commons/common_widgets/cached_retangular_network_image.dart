import 'package:jorden_job_task/commons/common_imports/common_libs.dart';
import 'package:jorden_job_task/commons/common_shimmers/loading_images_shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_initicon/flutter_initicon.dart';

class CachedRectangularNetworkImageWidget extends StatelessWidget {
  const CachedRectangularNetworkImageWidget({
    super.key,
    required this.image,
    required this.width,
    required this.height,
    this.fit,
    this.name = 'UnKnown',
    this.borderColor = Colors.transparent,
    this.borderRadius,
  });

  final String image;
  final int width;
  final int height;
  final BoxFit? fit;
  final String name;
  final Color borderColor;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return image == ''
        ? Initicon(
            text: name,
            backgroundColor: context.whiteColor.withOpacity(0.7),
            borderRadius: BorderRadius.circular(8),
            size: height.h,
          )
        : SizedBox(
            width: width.w,
            height: height.h,
            child: CachedNetworkImage(
              imageUrl: image,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  border: Border.all(color: borderColor, width: 0.6),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(borderRadius ?? 10.r),
                  image: DecorationImage(
                      image: imageProvider, fit: fit ?? BoxFit.cover),
                ),
              ),
              placeholder: (context, url) => Center(
                  child: ShimmerWidget(
                baseColor: context.primary,
              )),
              errorWidget: (context, url, error) => Center(
                  child: SizedBox(
                      width: 20.w,
                      height: 20.h,
                      child: const Icon(Icons.error))),
            ),
          );
  }
}

import 'package:jorden_job_task/commons/common_functions/padding.dart';
import 'package:jorden_job_task/commons/common_imports/common_libs.dart';
import 'package:jorden_job_task/commons/common_widgets/cached_retangular_network_image.dart';
import 'package:jorden_job_task/models/merchant_model.dart';
import 'package:jorden_job_task/utils/constants/assets_manager.dart';

class MerchantImageWidget extends StatelessWidget {
  const MerchantImageWidget({super.key, required this.merchantModel});
  final MerchantModel merchantModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 325.h,
      child: Stack(
        children: [
          CachedRectangularNetworkImageWidget(
              borderRadius: 0,
              image: merchantModel.brandImage!,
              width: 390,
              height: 288),
          Positioned(
            bottom: 0,
            left: 20.w,
            child: CachedRectangularNetworkImageWidget(
                borderColor: context.lightGreyColor,
                image: merchantModel.logo!,
                width: 97,
                height: 97),
          ),
          Positioned(
            left: 20.h,
            top: 40.h,
            child: CircleAvatar(
              radius: 17.r,
              backgroundColor: context.bodyTextColor.withOpacity(0.6),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Image.asset(
                  AppAssets.arrowBackIcon,
                  color: context.containerColor,
                  width: 24.w,
                  height: 24.h,
                ),
              ),
            ),
          ),
          Positioned(
              right: 20.w,
              bottom: 0,
              child: Container(
                  height: 30.h,
                  width: 60.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: context.primary, width: 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppAssets.starIcon,
                          width: 12.w, height: 12.h),
                      padding4,
                      Text(
                        merchantModel.rating.toString(),
                        style: getBoldStyle(
                            color: context.primary, fontSize: MyFonts.size12),
                      )
                    ],
                  ))),
        ],
      ),
    );
  }
}

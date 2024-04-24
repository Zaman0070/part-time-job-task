import 'package:coupon_uikit/coupon_uikit.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:jorden_job_task/commons/common_functions/padding.dart';
import 'package:jorden_job_task/commons/common_imports/common_libs.dart';
import 'package:jorden_job_task/models/offer_model.dart';
import 'package:jorden_job_task/utils/constants/assets_manager.dart';

class ReuseableCouponCard extends StatelessWidget {
  const ReuseableCouponCard({super.key, required this.offerModel});
  final OfferModel offerModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CouponCard(
          width: 1.sw,
          clockwise: false,
          height: 100.h,
          curvePosition: 40.h,
          curveRadius: 20.r,
          borderRadius: 14.r,
          backgroundColor: context.lightGreyColor,
          firstChild: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              padding18,
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    constraints: BoxConstraints(minWidth: 205.w),
                    child: Text(
                      offerModel.offer!,
                      style: getMediumStyle(
                          color: context.greyColor, fontSize: MyFonts.size16),
                    ),
                  ),
                  padding12,
                ],
              ),
            ],
          ),
          secondChild: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // padding32,
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    constraints: BoxConstraints(maxWidth: 190.w),
                    child: Text(
                      'INCLUDED IN MOBILE PRODUCT . NOT YET PURCHASED',
                      overflow: TextOverflow.ellipsis,
                      style: getRegularStyle(
                          color: context.greyColor, fontSize: MyFonts.size12),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: 10.h,
          right: 20.w,
          child: Container(
            height: 21.h,
            width: 71.w,
            decoration: BoxDecoration(
                color: context.greyColor,
                borderRadius: BorderRadius.circular(100.r)),
            child: Center(
              child: Text(
                offerModel.offerType!,
                style: getRegularStyle(
                    color: context.containerColor, fontSize: MyFonts.size12),
              ),
            ),
          ),
        ),
        Positioned(
          left: 15.w,
          child: SizedBox(
            height: 100.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  AppAssets.offerIcon,
                  height: 40.h,
                  width: 40.w,
                  color: context.greyColor,
                ),
                padding16,
                DottedLine(
                  direction: Axis.vertical,
                  lineLength: 60.h,
                  lineThickness: 1.h,
                  dashLength: 2.h,
                  dashColor: context.greyColor,
                  dashRadius: 0.5.r,
                  dashGapLength: 2.h,
                  dashGapColor: Colors.transparent,
                  dashGapRadius: 0.5.r,
                ),
              ],
            ),
          ),
        ),
        Positioned(
            right: 20.w,
            bottom: 12.h,
            child:
                Image.asset(AppAssets.heart0Icon, height: 20.h, width: 20.w)),
      ],
    );
  }
}

import 'package:coupon_uikit/coupon_uikit.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:jorden_job_task/commons/common_functions/padding.dart';
import 'package:jorden_job_task/commons/common_imports/common_libs.dart';
import 'package:jorden_job_task/models/offer_model.dart';
import 'package:jorden_job_task/utils/constants/assets_manager.dart';

class FlashCouponCard extends StatelessWidget {
  const FlashCouponCard(
      {super.key, required this.offerModel, this.isLock = false});
  final OfferModel offerModel;
  final bool isLock;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CouponCard(
          width: 1.sw,
          clockwise: false,
          height: 165.h,
          curvePosition: 75.h,
          curveRadius: 20.r,
          borderRadius: 14.r,
          backgroundColor: context.lightGreyColor,
          decoration: isLock
              ? null
              : const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                      Color(0xffFD01FF),
                      Color(0xff01D9DC),
                    ])),
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
                          color: isLock
                              ? context.greyColor
                              : context.containerColor,
                          fontSize: MyFonts.size16),
                    ),
                  ),
                  padding4,
                  Text(
                    'Available from ${offerModel.availableTime}',
                    style: getRegularStyle(
                        color:
                            isLock ? context.greyColor : context.containerColor,
                        fontSize: MyFonts.size12),
                  ),
                  padding6,
                  Wrap(
                    children: List.generate(
                        offerModel.availableDays.length,
                        (index) => Padding(
                              padding: const EdgeInsets.only(right: 4.0),
                              child: CircleAvatar(
                                radius: 12.r,
                                backgroundColor: isLock
                                    ? context.greyColor
                                    : context.containerColor,
                                child: Text(
                                  offerModel.availableDays[index],
                                  style: getMediumStyle(
                                      color: isLock
                                          ? context.containerColor
                                          : context.primary,
                                      fontSize: MyFonts.size16),
                                ),
                              ),
                            )),
                  ),
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
                  padding8,
                  Text(
                    'Min. spend of ${offerModel.minimumPurchase}AED                         ',
                    style: getRegularStyle(
                        color:
                            isLock ? context.greyColor : context.containerColor,
                        fontSize: MyFonts.size12),
                  ),
                  padding4,
                  Text(
                    'Valid till ${offerModel.availableUntil}',
                    style: getRegularStyle(
                        color:
                            isLock ? context.greyColor : context.containerColor,
                        fontSize: MyFonts.size12),
                  ),
                  Text(
                    'View of terms',
                    style: getRegularUnderlineStyle(
                        color:
                            isLock ? context.greyColor : context.containerColor,
                        fontSize: MyFonts.size14),
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
                color: isLock
                    ? context.greyColor
                    : context.bodyTextColor.withOpacity(0.4),
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
            height: 165.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  AppAssets.offerIcon,
                  height: 40.h,
                  width: 40.w,
                  color: isLock ? context.greyColor : context.containerColor,
                ),
                padding8,
                DottedLine(
                  direction: Axis.vertical,
                  lineLength: 100.h,
                  lineThickness: 1.h,
                  dashLength: 2.h,
                  dashColor:
                      isLock ? context.greyColor : context.containerColor,
                  dashRadius: 0.5.r,
                  dashGapLength: 2.h,
                  dashGapColor: Colors.transparent,
                  dashGapRadius: 0.5.r,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

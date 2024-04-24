import 'package:jorden_job_task/commons/common_functions/padding.dart';
import 'package:jorden_job_task/commons/common_imports/common_libs.dart';
import 'package:jorden_job_task/features/merchant_detail/widgets/alzaraq_offers.dart';
import 'package:jorden_job_task/features/merchant_detail/widgets/amman_offers.dart';
import 'package:jorden_job_task/features/merchant_detail/widgets/irbed_offers.dart';
import 'package:jorden_job_task/models/merchant_model.dart';
import 'package:jorden_job_task/utils/constants/assets_manager.dart';

class AvailableOfferSection extends StatelessWidget {
  const AvailableOfferSection({super.key, required this.merchantModel});
  final MerchantModel merchantModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        padding12,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Available Offers',
              style: getMediumStyle(
                  color: context.bodyTextColor, fontSize: MyFonts.size18),
            ),
            Row(
              children: [
                Text(
                  'How to use offers ',
                  style: getRegularStyle(
                      color: context.lightGreyColor, fontSize: MyFonts.size14),
                ),
                Image.asset(AppAssets.questionmarkIcon,
                    color: context.lightGreyColor, height: 20.h, width: 20.w)
              ],
            ),
          ],
        ),
        AmmanOffers(merchantModel: merchantModel),
        IrbedOffers(merchantModel: merchantModel),
        AlzaraqOffer(merchantModel: merchantModel)
      ],
    );
  }
}

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:jorden_job_task/commons/common_imports/common_libs.dart';
import 'package:jorden_job_task/features/merchant_detail/widgets/available_offer_section.dart';
import 'package:jorden_job_task/models/merchant_model.dart';
import 'package:jorden_job_task/utils/constants/app_constants.dart';

class OfferWidget extends StatelessWidget {
  const OfferWidget({super.key, required this.merchantModel});
  final MerchantModel merchantModel;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Padding(
        padding: EdgeInsets.all(AppConstants.padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ButtonsTabBar(
              splashColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
              height: 40.h,
              backgroundColor: context.cardColor,
              unselectedBorderColor: context.greyColor,
              borderColor: context.cardColor,
              borderWidth: 1,
              unselectedBackgroundColor: Colors.transparent,
              unselectedLabelStyle: getBoldStyle(
                  color: context.greyColor, fontSize: MyFonts.size12),
              labelStyle: getBoldStyle(
                  color: context.primary, fontSize: MyFonts.size12),
              tabs: const [
                Tab(text: "Available Offers"),
                Tab(text: "Menu"),
                Tab(text: "About"),
              ],
            ),
            SizedBox(
              height: 1.sh,
              child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    AvailableOfferSection(
                      merchantModel: merchantModel,
                    ),
                    Container(),
                    Container(),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}

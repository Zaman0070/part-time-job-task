import 'package:jorden_job_task/commons/common_functions/padding.dart';
import 'package:jorden_job_task/commons/common_imports/common_libs.dart';
import 'package:jorden_job_task/models/merchant_model.dart';
import 'package:jorden_job_task/utils/constants/app_constants.dart';
import 'package:jorden_job_task/utils/constants/assets_manager.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class MerchantDeatilWidget extends StatelessWidget {
  const MerchantDeatilWidget({super.key, required this.merchantModel});
  final MerchantModel merchantModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppConstants.padding, vertical: 8.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    merchantModel.category!,
                    style: getBoldStyle(
                        color: context.bodyTextColor, fontSize: MyFonts.size10),
                  ),
                  Text(
                    '5k+ ratings',
                    style: getRegularStyle(
                        color: context.primary, fontSize: MyFonts.size10),
                  )
                ],
              ),
              padding6,
              Text(merchantModel.title!,
                  style: getBoldStyle(
                      color: context.bodyTextColor, fontSize: MyFonts.size24)),
              padding12,
              // also add # in front of tags
              Row(
                children: [
                  Text(merchantModel.tags!.join(' #'),
                      style: getRegularStyle(
                          color: context.bodyTextColor,
                          fontSize: MyFonts.size13)),
                  padding12,
                  CircleAvatar(
                      radius: 3.r, backgroundColor: context.bodyTextColor),
                  padding12,
                  Text(
                    'All Tags',
                    style: getRegularUnderlineStyle(
                        color: context.primary, fontSize: MyFonts.size13),
                  ),
                ],
              ),
              padding20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  socialCard(
                      icon: AppAssets.followIcon,
                      title: 'Follow',
                      onTap: () {},
                      context: context),
                  padding12,
                  socialCard(
                      icon: AppAssets.phoneIcon,
                      title: 'Call',
                      onTap: () async {
                        final call =
                            Uri.parse('tel:${merchantModel.phoneNumber}');
                        if (await canLaunchUrl(call)) {
                          launchUrl(call);
                        } else {
                          throw 'Could not launch $call';
                        }
                      },
                      context: context),
                  padding12,
                  socialCard(
                      icon: AppAssets.emailIcon,
                      title: 'Email',
                      onTap: () async {
                        final email = Uri(
                          scheme: 'mailto',
                          path: merchantModel.emailAddress!,
                          query: 'subject=Hello&body=Test',
                        );
                        if (await canLaunchUrl(email)) {
                          launchUrl(email);
                        } else {
                          throw 'Could not launch $email';
                        }
                      },
                      context: context),
                  padding12,
                  socialCard(
                      icon: AppAssets.mapIcon,
                      title: 'Direction',
                      onTap: () {
                        MapsLauncher.launchQuery(merchantModel.location!);
                      },
                      context: context),
                  socialCard(
                      icon: AppAssets.reportIcon,
                      title: 'Report',
                      onTap: () {},
                      context: context),
                  socialCard(
                      icon: AppAssets.shareIcon,
                      title: 'Share',
                      onTap: () {
                        Share.share('check out my website https://example.com');
                      },
                      context: context),
                ],
              ),
              padding28,
            ],
          ),
        ),
        Container(
          height: 8.h,
          color: MyColors.alphabets,
        ),
      ],
    );
  }

  socialCard({
    required String icon,
    required String title,
    required VoidCallback onTap,
    required BuildContext context,
  }) {
    return InkWell(
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      onTap: onTap,
      child: SizedBox(
        width: 45.w,
        child: Column(
          children: [
            Image.asset(icon, width: 24.w, height: 24.h),
            padding6,
            Text(
              title,
              style: getRegularStyle(
                  color: context.bodyTextColor, fontSize: MyFonts.size10),
            )
          ],
        ),
      ),
    );
  }
}

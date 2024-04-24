import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:jorden_job_task/commons/common_functions/padding.dart';
import 'package:jorden_job_task/commons/common_imports/apis_commons.dart';
import 'package:jorden_job_task/commons/common_imports/common_libs.dart';
import 'package:jorden_job_task/commons/common_toasts/all_toasts.dart';
import 'package:jorden_job_task/commons/common_widgets/flash_coupon_card.dart';
import 'package:jorden_job_task/commons/common_widgets/loader.dart';
import 'package:jorden_job_task/features/merchant_detail/controller/merchant_controller.dart';
import 'package:jorden_job_task/models/merchant_model.dart';
import 'package:jorden_job_task/utils/constants/assets_manager.dart';

class AmmanOffers extends ConsumerStatefulWidget {
  const AmmanOffers({super.key, required this.merchantModel});
  final MerchantModel merchantModel;

  @override
  ConsumerState<AmmanOffers> createState() => _AmmanOffersState();
}

class _AmmanOffersState extends ConsumerState<AmmanOffers> {
  bool isExpanded = true;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      shape: InputBorder.none,
      visualDensity: VisualDensity.comfortable,
      onExpansionChanged: (value) => setState(() => isExpanded = value),
      initiallyExpanded: isExpanded,
      trailing: RotatedBox(
          quarterTurns: isExpanded ? 2 : 0,
          child: Image.asset(
            AppAssets.arrowDownIcon,
            height: 24.h,
            width: 24.w,
            color: context.bodyTextColor,
          )),
      tilePadding: EdgeInsets.zero,
      title: Text(
        'Amman',
        style: getRegularStyle(
            color: context.bodyTextColor, fontSize: MyFonts.size16),
      ),
      subtitle: Row(
        children: [
          Text(
            'Unlock Offer',
            style: getRegularUnderlineStyle(
                color: context.primary, fontSize: MyFonts.size16),
          ),
          padding12,
          Image.asset(AppAssets.lockIcon,
              color: context.whiteColor, height: 20.h, width: 20.w)
        ],
      ),
      children: [
        Consumer(builder: (context, ref, child) {
          final offerStream =
              ref.watch(watchAmmanOfferProvider(widget.merchantModel));
          return offerStream.when(data: (offer) {
            return ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: offer.length,
              itemBuilder: (context, index) {
                return FlashCouponCard(offerModel: offer[index]);
              },
            );
          }, loading: () {
            return const Loader();
          }, error: (e, s) {
            return showAwesomeSnackBar(
              context: context,
              title: 'Faild to load!',
              msg: e.toString(),
              type: ContentType.failure,
            );
          });
        })
      ],
    );
  }
}

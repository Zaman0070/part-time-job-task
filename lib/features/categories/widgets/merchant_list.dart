import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:jorden_job_task/commons/common_functions/padding.dart';
import 'package:jorden_job_task/commons/common_imports/apis_commons.dart';
import 'package:jorden_job_task/commons/common_imports/common_libs.dart';
import 'package:jorden_job_task/commons/common_toasts/all_toasts.dart';
import 'package:jorden_job_task/commons/common_widgets/cached_retangular_network_image.dart';
import 'package:jorden_job_task/commons/common_widgets/loader.dart';
import 'package:jorden_job_task/features/categories/controller/category_controller.dart';
import 'package:jorden_job_task/features/categories/controller/category_notifier.dart';
import 'package:jorden_job_task/models/category_model.dart';
import 'package:jorden_job_task/routes/route_manager.dart';

class MerchantList extends StatelessWidget {
  const MerchantList({super.key, required this.categoryModel});
  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final catNotifier = ref.watch(categoryNotifier);

      final merchantStream = ref.watch(catNotifier.alphabet != 'All'
          ? watchMerchantByAlphabetProvider(catNotifier.alphabet)
          : watchMerchantByCatProvider(catNotifier.merchantList));
      return merchantStream.when(data: (merchant) {
        return ListView.builder(
          itemCount: merchant.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return InkWell(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.merchantDetailScreen,
                    arguments: {'merchantModel': merchant[index]});
              },
              child: Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: Row(
                  children: [
                    CachedRectangularNetworkImageWidget(
                        borderColor: context.lightGreyColor,
                        image: merchant[index].logo!,
                        name: merchant[index].title!,
                        width: 70,
                        height: 70),
                    padding12,
                    Text(
                      merchant[index].title!,
                      style: getMediumStyle(
                          color: context.bodyTextColor,
                          fontSize: MyFonts.size18),
                    )
                  ],
                ),
              ),
            );
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
    });
  }
}

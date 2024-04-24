import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jorden_job_task/commons/common_functions/padding.dart';
import 'package:jorden_job_task/commons/common_imports/common_libs.dart';
import 'package:jorden_job_task/commons/common_toasts/all_toasts.dart';
import 'package:jorden_job_task/commons/common_widgets/loader.dart';
import 'package:jorden_job_task/features/categories/controller/category_controller.dart';
import 'package:jorden_job_task/features/categories/controller/category_notifier.dart';
import 'package:jorden_job_task/features/categories/widgets/category_card.dart';
import 'package:jorden_job_task/routes/route_manager.dart';

class AllCategoryWidget extends StatelessWidget {
  const AllCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final categories = ref.watch(watchAllCategoriesProvider);
      final catNotifier = ref.watch(categoryNotifier);
      return categories.when(data: (cat) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'All Categories',
              style: getMediumStyle(
                  color: context.bodyTextColor, fontSize: MyFonts.size18),
            ),
            padding20,
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisExtent: 139.h,
                  mainAxisSpacing: 10.h),
              itemCount: cat.length,
              itemBuilder: (context, index) {
                return CategoryCard(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.subcategoryScreen,
                        arguments: {'categoryModel': cat[index]});
                    catNotifier.setMerchantList(cat[index].numberOfMerchants!);
                    catNotifier.setSelectedCategoryIndex(-1);
                  },
                  categoryModel: cat[index],
                );
              },
            ),
          ],
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

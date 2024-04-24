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

class PopularCategoryWidget extends StatelessWidget {
  const PopularCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final popularCat = ref.watch(watchPopularCategoriesProvider);
      final catNotifier = ref.watch(categoryNotifier);
      return popularCat.when(data: (cat) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Popular Categories',
              style: getMediumStyle(
                  color: context.bodyTextColor, fontSize: MyFonts.size18),
            ),
            padding20,
            SizedBox(
                height: 139.h,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: cat.length,
                  itemBuilder: (context, index) {
                    return CategoryCard(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, AppRoutes.subcategoryScreen,
                            arguments: {'categoryModel': cat[index]});
                        catNotifier
                            .setMerchantList(cat[index].numberOfMerchants!);
                        catNotifier.setSelectedCategoryIndex(-1);
                      },
                      categoryModel: cat[index],
                    );
                  },
                )),
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

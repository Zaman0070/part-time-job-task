import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jorden_job_task/commons/common_functions/padding.dart';
import 'package:jorden_job_task/commons/common_imports/common_libs.dart';
import 'package:jorden_job_task/commons/common_toasts/all_toasts.dart';
import 'package:jorden_job_task/commons/common_widgets/loader.dart';
import 'package:jorden_job_task/features/categories/controller/category_controller.dart';
import 'package:jorden_job_task/features/categories/controller/category_notifier.dart';
import 'package:jorden_job_task/features/categories/widgets/sub_category_card.dart';
import 'package:jorden_job_task/models/category_model.dart';

class SubCategoryWidget extends StatelessWidget {
  const SubCategoryWidget({super.key, required this.categoryModel});
  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final subCatStream = ref.watch(watchSubCategoriesProvider(categoryModel));
      final catNotifier = ref.watch(categoryNotifier);
      return subCatStream.when(data: (subCat) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sub Categories',
              style: getMediumStyle(
                  color: context.bodyTextColor, fontSize: MyFonts.size18),
            ),
            padding20,
            SizedBox(
                height: 115.h,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: subCat.length,
                  itemBuilder: (context, index) {
                    return SubCategoryCard(
                      index: index,
                      onPressed: () {
                        catNotifier
                            .setMerchantList(subCat[index].numberOfMerchants!);
                        catNotifier.setSelectedCategoryIndex(index);
                      },
                      subCategoryModel: subCat[index],
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

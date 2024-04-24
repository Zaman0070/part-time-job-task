import 'package:jorden_job_task/commons/common_functions/padding.dart';
import 'package:jorden_job_task/commons/common_imports/common_libs.dart';
import 'package:jorden_job_task/features/categories/widgets/merchant_list.dart';
import 'package:jorden_job_task/features/categories/widgets/sort_widget.dart';
import 'package:jorden_job_task/features/categories/widgets/sub_category_widget.dart';
import 'package:jorden_job_task/models/category_model.dart';
import 'package:jorden_job_task/utils/constants/app_constants.dart';
import 'package:jorden_job_task/utils/constants/assets_manager.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key, required this.categoryModel});
  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset(
            AppAssets.arrowBackIcon,
            width: 24.w,
            height: 24.h,
          ),
        ),
        title: Text(
          categoryModel.title!,
          style: getMediumStyle(
              color: context.bodyTextColor, fontSize: MyFonts.size18),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(AppConstants.padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubCategoryWidget(categoryModel: categoryModel),
            padding20,
            SortWidget(categoryModel: categoryModel),
            padding20,
            MerchantList(categoryModel: categoryModel),
          ],
        ),
      )),
    );
  }
}

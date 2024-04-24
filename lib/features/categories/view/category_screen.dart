import 'package:jorden_job_task/commons/common_functions/padding.dart';
import 'package:jorden_job_task/commons/common_imports/common_libs.dart';
import 'package:jorden_job_task/commons/common_widgets/custom_text_fields.dart';
import 'package:jorden_job_task/features/categories/widgets/all_category_widget.dart';
import 'package:jorden_job_task/features/categories/widgets/papular_category_widget.dart';
import 'package:jorden_job_task/routes/route_manager.dart';
import 'package:jorden_job_task/utils/constants/app_constants.dart';
import 'package:jorden_job_task/utils/constants/assets_manager.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 45.h,
        automaticallyImplyLeading: false,
        title: Text(
          'Categories',
          style: getMediumStyle(
              color: context.bodyTextColor, fontSize: MyFonts.size18),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(AppConstants.padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              enabled: false,
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.searchScreen);
              },
              controller: searchController,
              hintText: 'Search categories',
              borderColor: MyColors.inputBorderColor,
              borderRadius: 8.r,
              verticalMargin: 0,
              leadigingIconPath: AppAssets.searchSvgIcon,
            ),
            SingleChildScrollView(
                child: Column(
              children: [
                padding20,
                const PopularCategoryWidget(),
                padding20,
                const AllCategoryWidget(),
              ],
            )),
          ],
        ),
      ),
    );
  }
}

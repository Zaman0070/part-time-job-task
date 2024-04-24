import 'package:flutter_svg/flutter_svg.dart';
import 'package:jorden_job_task/commons/common_functions/padding.dart';
import 'package:jorden_job_task/commons/common_imports/apis_commons.dart';
import 'package:jorden_job_task/commons/common_imports/common_libs.dart';
import 'package:jorden_job_task/features/categories/controller/category_notifier.dart';
import 'package:jorden_job_task/models/subcategory_model.dart';

class SubCategoryCard extends ConsumerWidget {
  const SubCategoryCard(
      {super.key,
      required this.subCategoryModel,
      required this.onPressed,
      required this.index});
  final SubCategoryModel subCategoryModel;
  final VoidCallback onPressed;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final catNotifier = ref.watch(categoryNotifier);
    return Column(
      children: [
        InkWell(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          onTap: onPressed,
          child: Container(
            margin: EdgeInsets.only(left: 10.w),
            height: 80.h,
            width: 80.w,
            padding: EdgeInsets.all(4.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: context.cardColor,
              border: Border.all(
                  color: catNotifier.selectedCategoryIndex == index
                      ? context.primary
                      : context.cardColor,
                  width: 1.r),
            ),
            child: Column(
              children: [
                padding4,
                SvgPicture.asset(subCategoryModel.iconPath!,
                    height: 50.h,
                    width: 50.h,
                    colorFilter:
                        ColorFilter.mode(context.primary, BlendMode.srcIn)),
              ],
            ),
          ),
        ),
        padding8,
        Text(subCategoryModel.title!,
            style: getRegularStyle(
                color: context.bodyTextColor, fontSize: MyFonts.size16)),
      ],
    );
  }
}

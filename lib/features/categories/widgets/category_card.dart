import 'package:flutter_svg/flutter_svg.dart';
import 'package:jorden_job_task/commons/common_functions/padding.dart';
import 'package:jorden_job_task/commons/common_imports/common_libs.dart';
import 'package:jorden_job_task/models/category_model.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard(
      {super.key, required this.categoryModel, required this.onPressed});
  final CategoryModel categoryModel;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(left: 10.w),
        height: 139.h,
        width: 106.w,
        padding: EdgeInsets.all(4.r),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: context.cardColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CircleAvatar(
                backgroundColor: context.primary,
                radius: 12.5.r,
                child: Center(
                  child: Text(
                    categoryModel.subcategories!.length.toString(),
                    style: getBoldStyle(
                        color: MyColors.white, fontSize: MyFonts.size12),
                  ),
                )),
            padding4,
            Center(
              child: SvgPicture.asset(
                categoryModel.iconPath!,
                height: 50.h,
                width: 50.h,
              ),
            ),
            padding16,
            Container(
              constraints: BoxConstraints(maxWidth: 100.w),
              child: Center(
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  categoryModel.title!,
                  style: getRegularStyle(
                      color: context.bodyTextColor, fontSize: MyFonts.size16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

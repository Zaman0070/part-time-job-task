import 'package:flutter_svg/flutter_svg.dart';
import 'package:jorden_job_task/commons/common_imports/common_libs.dart';
import 'package:jorden_job_task/models/category_model.dart';

class SearchCard extends StatelessWidget {
  const SearchCard(
      {super.key, required this.categoryModel, required this.onPressed});
  final CategoryModel categoryModel;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        onTap: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10.w),
                  height: 80.h,
                  width: 80.w,
                  padding: EdgeInsets.all(4.r),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: context.cardColor),
                  child: Center(
                    child: SvgPicture.asset(
                      categoryModel.iconPath!,
                      height: 50.h,
                      width: 50.h,
                    ),
                  ),
                ),
                Text(
                  textAlign: TextAlign.center,
                  categoryModel.title!,
                  style: getRegularStyle(
                      color: context.bodyTextColor, fontSize: MyFonts.size16),
                ),
              ],
            ),
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
          ],
        ),
      ),
    );
  }
}

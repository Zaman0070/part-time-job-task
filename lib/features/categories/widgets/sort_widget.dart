import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jorden_job_task/commons/common_functions/padding.dart';
import 'package:jorden_job_task/commons/common_imports/common_libs.dart';
import 'package:jorden_job_task/features/categories/controller/category_notifier.dart';
import 'package:jorden_job_task/models/category_model.dart';
import 'package:jorden_job_task/utils/constants/assets_manager.dart';

class SortWidget extends ConsumerStatefulWidget {
  const SortWidget({super.key, required this.categoryModel});
  final CategoryModel categoryModel;

  @override
  ConsumerState<SortWidget> createState() => _SortWidgetState();
}

class _SortWidgetState extends ConsumerState<SortWidget> {
  List<String> alphabets = [
    "All",
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z"
  ];
  @override
  Widget build(BuildContext context) {
    final catNotifier = ref.read(categoryNotifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: 230.w),
              child: Text(
                'All Offers For ${widget.categoryModel.title}',
                style: getMediumStyle(
                    color: context.bodyTextColor, fontSize: MyFonts.size18),
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Container(
                  height: 32.h,
                  width: 32.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: context.cardColor),
                  child: Center(
                    child: SvgPicture.asset(
                      AppAssets.searchSvgIcon,
                      width: 20.w,
                      height: 20.h,
                      colorFilter:
                          ColorFilter.mode(context.primary, BlendMode.srcIn),
                    ),
                  ),
                ),
                padding12,
                Text(
                  'Sort',
                  style: getSemiBoldStyle(
                      color: context.primary, fontSize: MyFonts.size16),
                ),
                padding4,
                Image.asset(
                  AppAssets.arrowDownIcon,
                  height: 24.h,
                  width: 24.w,
                ),
              ],
            ),
          ],
        ),
        padding20,
        SizedBox(
          height: 34.h,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: alphabets.length,
            itemBuilder: (context, index) {
              return InkWell(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                onTap: () {
                  catNotifier.setAlphabet(alphabets[index]);
                  setState(() {});
                },
                child: Container(
                  margin: EdgeInsets.only(right: 8.w),
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: catNotifier.alphabet == alphabets[index]
                          ? context.cardColor
                          : MyColors.alphabets),
                  child: Text(
                    alphabets[index],
                    style: getMediumStyle(
                        color: catNotifier.alphabet == alphabets[index]
                            ? context.primary
                            : context.bodyTextColor,
                        fontSize: MyFonts.size16),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

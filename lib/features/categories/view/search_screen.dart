import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jorden_job_task/commons/common_imports/common_libs.dart';
import 'package:jorden_job_task/commons/common_toasts/all_toasts.dart';
import 'package:jorden_job_task/commons/common_widgets/custom_text_fields.dart';
import 'package:jorden_job_task/commons/common_widgets/loader.dart';
import 'package:jorden_job_task/features/categories/controller/category_controller.dart';
import 'package:jorden_job_task/features/categories/controller/category_notifier.dart';
import 'package:jorden_job_task/features/categories/widgets/search_card.dart';
import 'package:jorden_job_task/routes/route_manager.dart';
import 'package:jorden_job_task/utils/constants/app_constants.dart';
import 'package:jorden_job_task/utils/constants/assets_manager.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchController = TextEditingController();
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
          'Search Categories',
          style: getMediumStyle(
              color: context.bodyTextColor, fontSize: MyFonts.size18),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(AppConstants.padding),
          child: Column(
            children: [
              CustomTextField(
                controller: searchController,
                hintText: 'Search categories',
                onChanged: (value) {
                  setState(() {
                    searchController.text = value;
                  });
                },
                borderColor: MyColors.inputBorderColor,
                borderRadius: 8.r,
                verticalMargin: 0,
                leadigingIconPath: AppAssets.searchSvgIcon,
              ),
              Consumer(builder: (context, ref, child) {
                final popularCat =
                    ref.watch(searchCategoryProvider(searchController.text));
                final catNotifier = ref.watch(categoryNotifier);
                return popularCat.when(data: (cat) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        padding: EdgeInsets.only(top: 20.h, bottom: 60.h),
                        itemCount: cat.length,
                        itemBuilder: (context, index) {
                          return SearchCard(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, AppRoutes.subcategoryScreen,
                                  arguments: {'categoryModel': cat[index]});
                              catNotifier.setMerchantList(
                                  cat[index].numberOfMerchants!);
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
              })
            ],
          ),
        ),
      ),
    );
  }
}

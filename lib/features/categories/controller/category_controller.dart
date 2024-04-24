import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jorden_job_task/features/categories/data/apis.dart';
import 'package:jorden_job_task/models/category_model.dart';
import 'package:jorden_job_task/models/merchant_model.dart';
import 'package:jorden_job_task/models/subcategory_model.dart';

final categoryControllerProvider =
    StateNotifierProvider<CategoryController, bool>((ref) {
  return CategoryController(
    categoryApis: ref.watch(categoriesApis),
  );
});

final watchPopularCategoriesProvider =
    FutureProvider.autoDispose<List<CategoryModel>>((ref) {
  final homeController = ref.watch(categoryControllerProvider.notifier);
  return homeController.watchPopularCategories();
});

final watchAllCategoriesProvider =
    FutureProvider.autoDispose<List<CategoryModel>>((ref) {
  final homeController = ref.watch(categoryControllerProvider.notifier);
  return homeController.watchAllCategories();
});

final watchSubCategoriesProvider = FutureProvider.autoDispose
    .family<List<SubCategoryModel>, CategoryModel>((ref, categoryModel) {
  final homeController = ref.watch(categoryControllerProvider.notifier);
  return homeController.watchSubCategories(categoryModel);
});

final watchMerchantByCatProvider = FutureProvider.autoDispose
    .family<List<MerchantModel>, List<String>>((ref, merchantList) {
  final homeController = ref.watch(categoryControllerProvider.notifier);
  return homeController.watchMerchantByCat(merchantList);
});

final watchMerchantByAlphabetProvider = FutureProvider.autoDispose
    .family<List<MerchantModel>, String>((ref, alphabet) {
  final homeController = ref.watch(categoryControllerProvider.notifier);
  return homeController.watchMerchantByAlphabet(alphabet);
});

final searchCategoryProvider = FutureProvider.autoDispose
    .family<List<CategoryModel>, String>((ref, title) {
  final homeController = ref.watch(categoryControllerProvider.notifier);
  return homeController.searchCategory(title);
});

class CategoryController extends StateNotifier<bool> {
  final CategoryApis _categoryApis;

  CategoryController({required CategoryApis categoryApis})
      : _categoryApis = categoryApis,
        super(false);

  Future<List<CategoryModel>> watchPopularCategories() async {
    final result = await _categoryApis.watchPopularCategories();
    return result.fold((l) => [], (r) => r);
  }

  Future<List<CategoryModel>> watchAllCategories() async {
    final result = await _categoryApis.watchAllCategories();
    return result.fold((l) => [], (r) => r);
  }

  Future<List<SubCategoryModel>> watchSubCategories(
      CategoryModel categoryModel) async {
    final result = await _categoryApis.watchSubCategories(categoryModel);
    return result.fold((l) => [], (r) => r);
  }

  Future<List<MerchantModel>> watchMerchantByCat(
      List<String> merchantList) async {
    final result = await _categoryApis.watchMerchantByCat(merchantList);
    return result.fold((l) => [], (r) => r);
  }

  Future<List<MerchantModel>> watchMerchantByAlphabet(String alphabet) async {
    final result = await _categoryApis.watchMerchantByAlphabet(alphabet);
    return result.fold((l) => [], (r) => r);
  }

  Future<List<CategoryModel>> searchCategory(String title) async {
    final result = await _categoryApis.searchCategory(title);
    return result.fold((l) => [], (r) => r);
  }
}

import 'package:jorden_job_task/commons/common_imports/apis_commons.dart';
import 'package:jorden_job_task/features/categories/data/category_data.dart';
import 'package:jorden_job_task/features/merchant_detail/data/merchant_data.dart';
import 'package:jorden_job_task/features/categories/data/sub_category_data.dart';
import 'package:jorden_job_task/models/category_model.dart';
import 'package:jorden_job_task/models/merchant_model.dart';
import 'package:jorden_job_task/models/subcategory_model.dart';

final categoriesApis = Provider<CategoryApis>((ref) {
  return CategoryApis();
});

abstract class ICategoryApis {
  Future<Either<String, List<CategoryModel>>> watchPopularCategories();
  Future<Either<String, List<CategoryModel>>> watchAllCategories();
  Future<Either<String, List<SubCategoryModel>>> watchSubCategories(
      CategoryModel categoryModel);
  Future<Either<String, List<MerchantModel>>> watchMerchantByCat(
      List<String> containMerchant);
  Future<Either<String, List<MerchantModel>>> watchMerchantByAlphabet(
      String alphabet);
  Future<Either<String, List<CategoryModel>>> searchCategory(String title);
}

class CategoryApis implements ICategoryApis {
  @override
  Future<Either<String, List<CategoryModel>>> watchPopularCategories() async {
    try {
      List<CategoryModel> categories = [];
      categories.addAll(
          categoryData.where((element) => element.popularityIndicator == true));
      return Right(categories);
    } catch (e) {
      return Left('Failed to fetch popular categories: $e');
    }
  }

  @override
  Future<Either<String, List<CategoryModel>>> watchAllCategories() async {
    try {
      List<CategoryModel> categories = [];
      categories.addAll(categoryData
          .where((element) => element.popularityIndicator == false));
      return Right(categories);
    } catch (e) {
      return Left('Failed to fetch popular categories: $e');
    }
  }

  @override
  Future<Either<String, List<SubCategoryModel>>> watchSubCategories(
      CategoryModel categoryModel) async {
    try {
      List<SubCategoryModel> subCat = [];
      subCat.addAll(subCategoryData.where((subCategory) =>
          categoryModel.subcategories!.contains(subCategory.id)));
      return Right(subCat);
    } catch (e) {
      return Left('Failed to fetch sub categories: $e');
    }
  }

  @override
  Future<Either<String, List<MerchantModel>>> watchMerchantByCat(
      List<String> containMerchant) async {
    try {
      List<MerchantModel> merchants = [];
      merchants.addAll(dummyMerchants
          .where((element) => containMerchant.contains(element.id.toString())));
      return Right(merchants);
    } catch (e) {
      return Left('Failed to fetch sub categories: $e');
    }
  }

  @override
  Future<Either<String, List<MerchantModel>>> watchMerchantByAlphabet(
      String alphabet) async {
    try {
      List<MerchantModel> merchants = [];
      merchants.addAll(dummyMerchants
          .where((element) => element.title!.startsWith(alphabet)));
      return Right(merchants);
    } catch (e) {
      return Left('Failed to fetch sub categories: $e');
    }
  }

  // search category by title
  @override
  Future<Either<String, List<CategoryModel>>> searchCategory(
      String title) async {
    try {
      List<CategoryModel> categories = [];

      categories.addAll(categoryData.where((element) =>
          element.title!.toLowerCase().contains(title.toLowerCase())));
      return Right(categories);
    } catch (e) {
      return Left('Failed to fetch popular categories: $e');
    }
  }
}

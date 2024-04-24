import 'package:flutter/material.dart';
import 'package:jorden_job_task/features/categories/view/category_screen.dart';
import 'package:jorden_job_task/features/categories/view/search_screen.dart';
import 'package:jorden_job_task/features/categories/view/sub_category_screen.dart';
import 'package:jorden_job_task/features/merchant_detail/view/merchant_detail_screen.dart';
import 'navigation.dart';

class AppRoutes {
  static const String categoryScreen = '/categoryScreen';
  static const String subcategoryScreen = '/subcategoryScreen';
  static const String merchantDetailScreen = '/merchantDetailScreen';
  static const String searchScreen = '/searchScreen';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case categoryScreen:
        return _buildRoute(const CategoryScreen());
      case subcategoryScreen:
        Map<String, dynamic> arguments =
            settings.arguments as Map<String, dynamic>;
        return _buildRoute(SubCategoryScreen(
          categoryModel: arguments['categoryModel'],
        ));
      case merchantDetailScreen:
        Map<String, dynamic> arguments =
            settings.arguments as Map<String, dynamic>;
        return _buildRoute(MerchantDeailScreen(
          merchantModel: arguments['merchantModel'],
        ));
      case searchScreen:
        return _buildRoute(const SearchScreen());

      default:
        return unDefinedRoute();
    }
  }

  static unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        backgroundColor: Colors.black,
      ),
    );
  }

  static _buildRoute(Widget widget, {int? duration = 400}) {
    return forwardRoute(widget, duration);
  }
}

import 'package:jorden_job_task/commons/common_imports/common_libs.dart';

extension ThemeColors on BuildContext {
  Color get whiteColor => Theme.of(this).colorScheme.primary;
  Color get buttonColor => Theme.of(this).colorScheme.onPrimary;
  Color get onSecondaryColor => Theme.of(this).colorScheme.onSecondary;
  Color get containerColor => Theme.of(this).colorScheme.primaryContainer;
  Color get secondaryContainerColor =>
      Theme.of(this).colorScheme.secondaryContainer;
  Color get errorColor => Theme.of(this).colorScheme.error;
  Color get scaffoldBackgroundColor => Theme.of(this).scaffoldBackgroundColor;
  Color get bodyTextColor => MyColors.bodyTextColor;
  Color get greyColor => MyColors.grey;
  Color get lightGreyColor => MyColors.lightGrey;
  Color get primary => MyColors.primary;
  Color get cardColor => MyColors.cardColor;
}

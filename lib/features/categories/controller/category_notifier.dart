import 'package:jorden_job_task/commons/common_imports/apis_commons.dart';
import 'package:jorden_job_task/commons/common_imports/common_libs.dart';

final categoryNotifier = ChangeNotifierProvider<CategoryNotifier>((ref) {
  return CategoryNotifier();
});

class CategoryNotifier extends ChangeNotifier {
  List<String>? _merchantList = [];
  List<String> get merchantList => _merchantList!;
  int? _selectedCategoryIndex = -1;
  int get selectedCategoryIndex => _selectedCategoryIndex!;

  String _alphabet = 'All';
  String get alphabet => _alphabet;

  void setAlphabet(String alphabet) {
    _alphabet = alphabet;
    notifyListeners();
  }

  void setMerchantList(List<String> merchantList) {
    _merchantList = merchantList;
    notifyListeners();
  }

  void setSelectedCategoryIndex(int index) {
    _selectedCategoryIndex = index;
    notifyListeners();
  }
}

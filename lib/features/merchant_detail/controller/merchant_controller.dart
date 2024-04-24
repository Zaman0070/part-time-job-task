import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jorden_job_task/features/merchant_detail/data/apis.dart';
import 'package:jorden_job_task/models/merchant_model.dart';
import 'package:jorden_job_task/models/offer_model.dart';

final merchantControllerProvider =
    StateNotifierProvider<MerchantController, bool>((ref) {
  return MerchantController(
    merchantApis: ref.watch(merchantApis),
  );
});

final watchAmmanOfferProvider = FutureProvider.autoDispose
    .family<List<OfferModel>, MerchantModel>((ref, categoryModel) {
  final homeController = ref.watch(merchantControllerProvider.notifier);
  return homeController.watchAmmanOffer(categoryModel);
});

final watchIrbedOfferProvider = FutureProvider.autoDispose
    .family<List<OfferModel>, MerchantModel>((ref, categoryModel) {
  final homeController = ref.watch(merchantControllerProvider.notifier);
  return homeController.watchIrbedOffer(categoryModel);
});

final watchAlzraqOfferProvider = FutureProvider.autoDispose
    .family<List<OfferModel>, MerchantModel>((ref, categoryModel) {
  final homeController = ref.watch(merchantControllerProvider.notifier);
  return homeController.watchAlzraqOffer(categoryModel);
});

class MerchantController extends StateNotifier<bool> {
  final MerchantApis _merchantApis;

  MerchantController({required MerchantApis merchantApis})
      : _merchantApis = merchantApis,
        super(false);

  // watch amman offer
  Future<List<OfferModel>> watchAmmanOffer(MerchantModel merchantModel) async {
    final result = await _merchantApis.watchAmmanOffer(merchantModel);
    return result.fold((l) => [], (r) => r);
  }

  // watch irbed offer
  Future<List<OfferModel>> watchIrbedOffer(MerchantModel merchantModel) async {
    final result = await _merchantApis.watchIrbedOffer(merchantModel);
    return result.fold((l) => [], (r) => r);
  }

  // watch alzraq offer
  Future<List<OfferModel>> watchAlzraqOffer(MerchantModel merchantModel) async {
    final result = await _merchantApis.watchAlzaraqOffer(merchantModel);
    return result.fold((l) => [], (r) => r);
  }
}

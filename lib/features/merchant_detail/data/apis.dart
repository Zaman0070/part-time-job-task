import 'package:jorden_job_task/commons/common_imports/apis_commons.dart';
import 'package:jorden_job_task/models/merchant_model.dart';
import 'package:jorden_job_task/models/offer_model.dart';

final merchantApis = Provider<MerchantApis>((ref) {
  return MerchantApis();
});

abstract class IMerchantApis {
  Future<Either<String, List<OfferModel>>> watchAmmanOffer(
      MerchantModel merchantModel);
  Future<Either<String, List<OfferModel>>> watchIrbedOffer(
      MerchantModel merchantModel);
  Future<Either<String, List<OfferModel>>> watchAlzaraqOffer(
      MerchantModel merchantModel);
}

class MerchantApis implements IMerchantApis {
  @override
  Future<Either<String, List<OfferModel>>> watchAmmanOffer(
      MerchantModel merchantModel) async {
    try {
      List<OfferModel> offers = [];
      offers.addAll(merchantModel.offers!
          .where((element) => element.offerLocation == 'Amman')
          .toList());
      return Right(offers);
    } catch (e) {
      print('Error fetching amman offers: $e');
      return Left('Failed to fetch amman offers: $e');
    }
  }

  @override
  Future<Either<String, List<OfferModel>>> watchIrbedOffer(
      MerchantModel merchantModel) async {
    try {
      List<OfferModel> offers = [];
      offers.addAll(merchantModel.offers!
          .where((element) => element.offerLocation == 'Irbed')
          .toList());
      return Right(offers);
    } catch (e) {
      print('Error fetching amman offers: $e');
      return Left('Failed to fetch amman offers: $e');
    }
  }

  @override
  Future<Either<String, List<OfferModel>>> watchAlzaraqOffer(
      MerchantModel merchantModel) async {
    try {
      List<OfferModel> offers = [];
      offers.addAll(merchantModel.offers!
          .where((element) => element.offerLocation == 'Alzarq')
          .toList());
      return Right(offers);
    } catch (e) {
      print('Error fetching amman offers: $e');
      return Left('Failed to fetch amman offers: $e');
    }
  }
}

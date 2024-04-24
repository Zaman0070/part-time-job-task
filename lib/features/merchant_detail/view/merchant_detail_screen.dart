import 'package:flutter/material.dart';
import 'package:jorden_job_task/commons/common_imports/common_libs.dart';
import 'package:jorden_job_task/features/merchant_detail/widgets/merchant_detail_widget.dart';
import 'package:jorden_job_task/features/merchant_detail/widgets/merchant_image_widget.dart';
import 'package:jorden_job_task/features/merchant_detail/widgets/offer_widget.dart';
import 'package:jorden_job_task/models/merchant_model.dart';

class MerchantDeailScreen extends StatelessWidget {
  const MerchantDeailScreen({super.key, required this.merchantModel});
  final MerchantModel merchantModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MerchantImageWidget(merchantModel: merchantModel),
          Expanded(
            child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MerchantDeatilWidget(merchantModel: merchantModel),
                    OfferWidget(merchantModel: merchantModel),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}

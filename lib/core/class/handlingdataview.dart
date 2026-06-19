import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constant/imageassets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView
    extends StatelessWidget {
  final Statusrequest? statusRequest;
  final Widget widget;
  const HandlingDataView(
    Statusrequest? statusrequest, {
    super.key,
    required this.statusRequest,
    required this.widget,
  });
  @override
  Widget build(BuildContext context) {
    return statusRequest ==
            Statusrequest.loading
        ? Center(
            child: Lottie.asset(
              AppImageAsset.loading,
              width: 250,
              height: 250,
            ),
          )
        : statusRequest ==
              Statusrequest
                  .offlinefailure
        ? Center(
            child: Lottie.asset(
              AppImageAsset.offline,
              width: 250,
              height: 250,
            ),
          )
        : statusRequest ==
              Statusrequest
                  .serverfailure
        ? Center(
            child: Lottie.asset(
              AppImageAsset.server,
              width: 250,
              height: 250,
            ),
          )
        : statusRequest ==
              Statusrequest.failure
        ? Center(
            child: Lottie.asset(
              AppImageAsset.noData,
              width: 250,
              height: 250,
              repeat: true,
            ),
          )
        : widget;
  }
}

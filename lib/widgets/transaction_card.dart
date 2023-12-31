import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../constants/asset_constants.dart';
import '../features/transactions/transaction_summary.dart';
import '../utils/constants.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    super.key,
    required this.type,
    required this.status,
    required this.amount,
    required this.day,
    required this.source,
    required this.fee,
  });

  final String type, status, amount, day, source, fee;

  @override
  Widget build(BuildContext context) {
    // Create a NumberFormat instance with the currency symbol
    var nairaFormat = NumberFormat.currency(symbol: '₦');
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => TransactionSummary(
                  source: source,
                  status: status,
                  type: type,
                  date: day,
                  amount: amount,
                  fee: fee,
                )));
      },
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 18.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      type == 'WITHDRAWAL'
                          ? Container(
                              width: 40.h,
                              height: 40.h,
                              decoration: const ShapeDecoration(
                                color: AppConst.yellowOverlay,
                                shape: OvalBorder(),
                              ),
                              child: SvgPicture.asset(
                                AssetsConstants.sent,
                              ))
                          : Container(
                              width: 40.h,
                              height: 40.h,
                              decoration: const ShapeDecoration(
                                color: AppConst.regOverlay,
                                shape: OvalBorder(),
                              ),
                              child: SvgPicture.asset(
                                AssetsConstants.received,
                              )),
                      SizedBox(
                        width: 10.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            type.toLowerCase(),
                            style: const TextStyle(
                                fontSize: 19,
                                color: AppConst.lightColor,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            status.toLowerCase(),
                            style: const TextStyle(
                                fontSize: 16,
                                color: AppConst.textBlackVariant1,
                                fontWeight: FontWeight.normal),
                          )
                        ],
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '\$$amount',
                        style: const TextStyle(
                            fontSize: 17,
                            color: AppConst.lightColor,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        day.toLowerCase(),
                        style: const TextStyle(
                            fontSize: 16,
                            color: AppConst.textBlackVariant1,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              const Divider(
                color: AppConst.textBlack,
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/asset_constants.dart';
import '../features/transactions/transaction_summary.dart';
import '../utils/constants.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const TransactionSummary()));
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
                      Container(
                          width: 40.h,
                          height: 40.h,
                          decoration: const ShapeDecoration(
                            color: AppConst.yellowOverlay,
                            shape: OvalBorder(),
                          ),
                          child: SvgPicture.asset(
                            AssetsConstants.sent,
                          )),
                      SizedBox(
                        width: 10.h,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Transfer to Bank',
                            style: TextStyle(
                                fontSize: 17,
                                color: AppConst.lightColor,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'processed',
                            style: TextStyle(
                                fontSize: 16,
                                color: AppConst.textBlackVariant1,
                                fontWeight: FontWeight.normal),
                          )
                        ],
                      )
                    ],
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '₦ 20,000',
                        style: TextStyle(
                            fontSize: 17,
                            color: AppConst.lightColor,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Today',
                        style: TextStyle(
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

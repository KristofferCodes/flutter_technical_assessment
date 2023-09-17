import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_technical_assessment/constants/asset_constants.dart';
import 'package:flutter_technical_assessment/features/transactions/trasaction_page.dart';
import 'package:flutter_technical_assessment/widgets/primaryButton.dart';

import '../../utils/constants.dart';
import '../../widgets/transaction_card.dart';

class Wallet extends StatelessWidget {
  const Wallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConst.primaryColor,
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text(
              'Wallet',
              style: TextStyle(
                  fontSize: 22,
                  color: AppConst.lightColor,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'Balance',
                style: TextStyle(
                    fontSize: 15,
                    color: AppConst.textBlackVariant1,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 15.h),
              const Text(
                '\u20A6 34,500.00',
                style: TextStyle(
                    fontSize: 35,
                    color: AppConst.lightColor,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 25.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 120.h),
                child: PrimaryButton(
                  text: 'Withdraw',
                  onTap: () {},
                  textStyle: TextStyle(
                      color: AppConst.lightColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.h),
                ),
              )
            ],
          ),
          SizedBox(height: 25.h),
          const Divider(
            color: AppConst.textBlack,
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 8.0, bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text(
                      'Transactions',
                      style: TextStyle(
                          color: AppConst.textBlackVariant1, fontSize: 18),
                    ),
                    SvgPicture.asset(
                      AssetsConstants.down,
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const TransactionPage()));
                  },
                  child: const Text(
                    'See all',
                    style: TextStyle(
                        color: AppConst.yellow,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: const [
              TransactionCard(),
              TransactionCard(),
              TransactionCard(),
              TransactionCard(),
              TransactionCard(),
            ],
          )
        ],
      ),
    );
  }
}

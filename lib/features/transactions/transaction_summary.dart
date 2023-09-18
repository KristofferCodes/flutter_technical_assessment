import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_technical_assessment/features/transactions/success_page.dart';
import 'package:flutter_technical_assessment/widgets/primaryButton.dart';

import '../../constants/asset_constants.dart';
import '../../utils/constants.dart';
import '../../widgets/back.dart';

class TransactionSummary extends StatelessWidget {
  const TransactionSummary(
      {super.key,
      required this.type,
      required this.source,
      required this.status,
      required this.date,
      required this.amount,
      required this.fee});

  final String type, status, date, amount, fee;
  final String? source;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConst.primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Back(),
                  const Text(
                    'Transaction Summary',
                    style: TextStyle(
                        fontSize: 20,
                        color: AppConst.lightColor,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: 55.h,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 55.h,
            ),
            Column(
              children: [
                type == 'DEPOSIT'
                    ? Container(
                        width: 70.h,
                        height: 70.h,
                        decoration: const ShapeDecoration(
                          color: AppConst.regOverlay,
                          shape: OvalBorder(),
                        ),
                        child: SvgPicture.asset(
                          AssetsConstants.received,
                        ))
                    : Container(
                        width: 70.h,
                        height: 70.h,
                        decoration: const ShapeDecoration(
                          color: AppConst.yellowOverlay,
                          shape: OvalBorder(),
                        ),
                        child: SvgPicture.asset(
                          AssetsConstants.sent,
                        )),
                SizedBox(
                  height: 25.h,
                ),
                Text(
                  '\$$amount',
                  style: const TextStyle(
                      fontSize: 35,
                      color: AppConst.lightColor,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  date,
                  style: TextStyle(
                      fontSize: 15,
                      color: AppConst.textBlackVariant1,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            const Divider(
              color: AppConst.textBlack,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Source',
                        style: TextStyle(
                            fontSize: 18,
                            color: AppConst.textBlackVariant1,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        source ?? 'Booking',
                        style: const TextStyle(
                            fontSize: 18,
                            color: AppConst.lightColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Divider(
                    color: AppConst.textBlack,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Status',
                        style: TextStyle(
                            fontSize: 18,
                            color: AppConst.textBlackVariant1,
                            fontWeight: FontWeight.w500),
                      ),
                      status != 'PENDING'
                          ? Chip(
                              label: Text(status.toLowerCase(),
                                  style: const TextStyle(
                                    color: AppConst.lightColor,
                                  )),
                              backgroundColor: Colors.green,
                            )
                          : Chip(
                              label: Text(status.toLowerCase(),
                                  style: const TextStyle(
                                    color: AppConst.yellow,
                                  )),
                              backgroundColor: AppConst.regOverlay,
                            )
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Divider(
                    color: AppConst.textBlack,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Fee',
                        style: TextStyle(
                            fontSize: 18,
                            color: AppConst.textBlackVariant1,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        '\$$fee',
                        style: const TextStyle(
                            fontSize: 18,
                            color: AppConst.lightColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Divider(
                    color: AppConst.textBlack,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Transaction ID',
                            style: TextStyle(
                                fontSize: 18,
                                color: AppConst.textBlackVariant1,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: 5.h,
                          ),
                          SvgPicture.asset(AssetsConstants.info)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(AssetsConstants.copy),
                          SizedBox(
                            width: 5.h,
                          ),
                          const Text(
                            'HA930929239-52',
                            style: TextStyle(
                                fontSize: 18,
                                color: AppConst.lightColor,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 150.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: SecondaryButton(
                    text: 'Report this transaction',
                    onTap: () {
                      _showBottomSheet(context);
                    },
                    textStyle: TextStyle(
                        color: AppConst.btnColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.h),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void _showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: AppConst.primaryColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30), topRight: Radius.circular(30)),
    ),
    isScrollControlled: false,
    isDismissible: true,
    context: context,
    builder: (BuildContext context) {
      return Container(
        decoration: const BoxDecoration(
          color: AppConst.primaryColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(AssetsConstants.close))
                ]),
                Image.asset('assets/pngBook.png'),
                SizedBox(
                  height: 15.h,
                ),
                const Text(
                  'Leave a remark',
                  style: TextStyle(
                      fontSize: 15,
                      color: AppConst.lightColor,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 15.h,
                ),
                const Text(
                  'Your feedback helps us improve our services and resolve any issues you may have encountered.',
                  style: TextStyle(
                      fontSize: 15,
                      color: AppConst.textBlackVariant1,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 15.h,
                ),
                TextFormField(
                  enabled: false,
                  maxLines: 5,
                  cursorHeight: 17,
                  // onChanged: onchanged,
                  // controller: controller,
                  // keyboardType: keyboardType,
                  style: TextStyle(
                      fontSize: 16.h,
                      color: AppConst.lightColor,
                      fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    fillColor: const Color(0xFF141414),
                    filled: true,
                    hintText: 'Write Something...',
                    // suffixIcon: suffixIcon,
                    // prefixIcon: prefixIcon,
                    suffixIconColor: AppConst.primaryColor,
                    hintStyle: TextStyle(
                        fontSize: 16.h,
                        color: AppConst.textBlack,
                        fontWeight: FontWeight.bold),
                    errorBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(AppConst.radius)),
                        borderSide: const BorderSide(
                          color: AppConst.errorColor,
                          width: 1,
                          style: BorderStyle.solid,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(AppConst.radius)),
                        borderSide: const BorderSide(
                          color: AppConst.yellow,
                          width: 1,
                          style: BorderStyle.solid,
                        )),
                    disabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(AppConst.radius)),
                        borderSide: const BorderSide(
                          color: AppConst.primaryColor,
                          width: 1,
                          style: BorderStyle.solid,
                        )),
                    enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(AppConst.radius)),
                        borderSide: const BorderSide(
                          color: AppConst.textBlack,
                          width: 1,
                          style: BorderStyle.solid,
                        )),
                  ),
                ),
                SizedBox(
                  height: 35.h,
                ),
                PrimaryButton(
                  text: 'Report',
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SuccessPage()));
                  },
                  textStyle: TextStyle(
                      fontSize: 20.h,
                      color: AppConst.lightColor,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}

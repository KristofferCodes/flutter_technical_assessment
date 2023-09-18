import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_technical_assessment/constants/asset_constants.dart';
import 'package:flutter_technical_assessment/utils/constants.dart';
import 'package:flutter_technical_assessment/widgets/transaction_card.dart';
import 'package:intl/intl.dart';

import '../../api/transactions/transaction_controller.dart';
import '../../widgets/back.dart';

class TransactionPage extends ConsumerStatefulWidget {
  const TransactionPage({super.key});

  @override
  ConsumerState<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends ConsumerState<TransactionPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  List<Widget> tabIcons = [
    SvgPicture.asset(AssetsConstants.allP),
    SvgPicture.asset(AssetsConstants.receivedP),
    SvgPicture.asset(AssetsConstants.transferP),
  ];
  List<Widget> tabIcons2 = [
    SvgPicture.asset(AssetsConstants.allHd),
    SvgPicture.asset(AssetsConstants.receivedHd),
    SvgPicture.asset(AssetsConstants.transferHd),
  ];
  List<bool> tabSelected = [false, false, false];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {
      // Update the Chip text and color based on the selected tab index
      final selectedTabIndex = _tabController.index;
      for (int i = 0; i < tabIcons2.length; i++) {
        if (i == selectedTabIndex) {
          tabIcons[i] = tabIcons2[i];
        } else {
          tabIcons[i];
        }
      }
    });
  }

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
                    'Wallet Transactions',
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
            Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18),
              child: SizedBox(
                // decoration: BoxDecoration(
                //     color: AppConst.kLight,
                //     borderRadius:
                //         BorderRadius.all(Radius.circular(AppConst.radius))),
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: Colors.transparent,
                  labelColor: AppConst.lightColor,
                  isScrollable: false,
                  controller: _tabController,
                  labelPadding: const EdgeInsets.all(10),
                  // isScrollable: false,
                  // unselectedLabelColor: AppConst.textFieldGrey,
                  // labelStyle:
                  //     appstyle(17, AppConst.regBlue, FontWeight.normal),
                  tabs: [for (int i = 0; i < tabIcons.length; i++) tabIcons[i]],
                ),
              ),
            ),
            const Divider(
              color: AppConst.textBlack,
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  ref.watch(getTransactionProvider).when(
                      data: (data) {
                        return ListView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: data.length,
                            itemBuilder: (_, index) {
                              return TransactionCard(
                                type: data[index].type!,
                                status: data[index].status!,
                                amount: data[index].amount.toString(),
                                day: DateFormat.yMMMEd()
                                    .format(data[index].createdAtDateOnly!),
                                source: data[index].source.toString(),
                                fee: data[index].fee.toString(),
                              );
                            });
                      },
                      error: (error, st) =>
                          Center(child: Text(error.toString())),
                      loading: () =>
                          const Center(child: CircularProgressIndicator())),
                  ref.watch(getTransactionProvider).when(
                      data: (data) {
                        final secondList = [];
                        data.forEach((element) {
                          element.type == 'DEPOSIT'
                              ? secondList.add(element)
                              : null;
                        });
                        return ListView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: secondList.length,
                            itemBuilder: (_, index) {
                              return TransactionCard(
                                type: secondList[index].type!,
                                status: secondList[index].status!,
                                amount: secondList[index].amount.toString(),
                                day: DateFormat.yMMMEd().format(
                                    secondList[index].createdAtDateOnly!),
                                source: secondList[index].source.toString(),
                                fee: data[index].fee.toString(),
                              );
                            });
                      },
                      error: (error, st) =>
                          Center(child: Text(error.toString())),
                      loading: () =>
                          const Center(child: CircularProgressIndicator())),
                  ref.watch(getTransactionProvider).when(
                      data: (data) {
                        final secondList = [];
                        data.forEach((element) {
                          element.type == 'WITHDRAWAL'
                              ? secondList.add(element)
                              : null;
                        });
                        return ListView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: secondList.length,
                            itemBuilder: (_, index) {
                              return TransactionCard(
                                type: secondList[index].type!,
                                status: secondList[index].status!,
                                amount: secondList[index].amount.toString(),
                                day: DateFormat.yMMMEd().format(
                                    secondList[index].createdAtDateOnly!),
                                source: secondList[index].source.toString(),
                                fee: data[index].fee.toString(),
                              );
                            });
                      },
                      error: (error, st) =>
                          Center(child: Text(error.toString())),
                      loading: () =>
                          const Center(child: CircularProgressIndicator())),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

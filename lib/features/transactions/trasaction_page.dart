import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_technical_assessment/constants/asset_constants.dart';
import 'package:flutter_technical_assessment/utils/constants.dart';
import 'package:flutter_technical_assessment/widgets/transaction_card.dart';

import '../../widgets/back.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  List<String> tabTexts = ['All', 'Received', 'Transfer'];
  List<Color> tabColors = [
    AppConst.textBlackVariant2,
    AppConst.textBlackVariant2,
    AppConst.textBlackVariant2
  ];
  List<Widget> tabIcons = [
    Container(), // Replace with your SVG asset paths
    SvgPicture.asset(AssetsConstants.received),
    SvgPicture.asset(AssetsConstants.sent),
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
      for (int i = 0; i < tabTexts.length; i++) {
        if (i == selectedTabIndex) {
          tabTexts[i] = tabTexts[i];
          tabColors[i] =
              AppConst.yellow; // Change the color for the selected tab
        } else {
          tabTexts[i] = tabTexts[i];
          tabColors[i] = AppConst
              .textBlackVariant2; // Change the color for unselected tabs
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
                  Back(),
                  Text(
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
                  tabs: [
                    for (int i = 0; i < tabTexts.length; i++)
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 2), // Adjust padding here
                        decoration: BoxDecoration(
                          color: tabColors[i],
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            tabIcons[i], // SVG icon
                            Text(tabTexts[i]),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Divider(
              color: AppConst.textBlack,
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView(
                    children: [
                      TransactionCard(),
                      TransactionCard(),
                      TransactionCard(),
                      TransactionCard(),
                      TransactionCard(),
                      TransactionCard(),
                      TransactionCard(),
                      TransactionCard(),
                      TransactionCard(),
                    ],
                  ),
                  ListView(
                    children: [
                      TransactionCard(),
                      TransactionCard(),
                      TransactionCard(),
                      TransactionCard(),
                      TransactionCard(),
                      TransactionCard(),
                      TransactionCard(),
                      TransactionCard(),
                      TransactionCard(),
                    ],
                  ),
                  ListView(
                    children: [
                      TransactionCard(),
                      TransactionCard(),
                      TransactionCard(),
                      TransactionCard(),
                      TransactionCard(),
                      TransactionCard(),
                      TransactionCard(),
                      TransactionCard(),
                      TransactionCard(),
                    ],
                  ),
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_technical_assessment/utils/constants.dart';

import '../constants/asset_constants.dart';
import '../constants/ui_constants.dart';

class HomeView extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const HomeView());
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _page = 0;

  void onPageChange(int index) {
    setState(() {
      _page = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _page, children: UIConstants.bottomTabBarPages),
      bottomNavigationBar: SizedBox(
        height: 80.h,
        child: CupertinoTabBar(
          currentIndex: _page,
          onTap: onPageChange,
          backgroundColor: AppConst.primaryColor,
          items: [
            BottomNavigationBarItem(
              icon: _page == 0
                  ? ColorFiltered(
                      colorFilter: const ColorFilter.mode(
                          AppConst.lightColor, BlendMode.srcIn),
                      child: SvgPicture.asset(
                        AssetsConstants.home,
                        height: 70,
                      ),
                    )
                  : SvgPicture.asset(
                      AssetsConstants.home,
                    ),
            ),
            BottomNavigationBarItem(
              icon: _page == 1
                  ? SvgPicture.asset(
                      AssetsConstants.onWallet,
                    )
                  : ColorFiltered(
                      colorFilter: const ColorFilter.mode(
                          AppConst.textBlack, BlendMode.srcIn),
                      child: SvgPicture.asset(
                        AssetsConstants.onWallet,
                      ),
                    ),
            ),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
              _page == 2 ? AssetsConstants.add : AssetsConstants.add,
            )),
            BottomNavigationBarItem(
              icon: _page == 3
                  ? ColorFiltered(
                      colorFilter: const ColorFilter.mode(
                          AppConst.lightColor, BlendMode.srcIn),
                      child: SvgPicture.asset(
                        AssetsConstants.inbox,
                      ),
                    )
                  : SvgPicture.asset(
                      AssetsConstants.inbox,
                    ),
            ),
            BottomNavigationBarItem(
              icon: _page == 4
                  ? ColorFiltered(
                      colorFilter: const ColorFilter.mode(
                          AppConst.lightColor, BlendMode.srcIn),
                      child: SvgPicture.asset(
                        AssetsConstants.profile,
                      ),
                    )
                  : SvgPicture.asset(
                      AssetsConstants.profile,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

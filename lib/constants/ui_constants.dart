import 'package:flutter/material.dart';

import '../features/add/add_page.dart';
import '../features/homepage/homepage.dart';
import '../features/inbox/inbox.dart';
import '../features/profile/profile.dart';
import '../features/wallet/wallet.dart';

class UIConstants {
  static const List<Widget> bottomTabBarPages = [
    HomePage(),
    Wallet(),
    AddPage(),
    InboxPage(),
    ProfilePage()
  ];
}

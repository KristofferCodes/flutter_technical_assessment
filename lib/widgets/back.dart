import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/asset_constants.dart';

class Back extends StatelessWidget {
  const Back({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: SvgPicture.asset(AssetsConstants.back));
  }
}

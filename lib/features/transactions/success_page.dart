import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_technical_assessment/constants/asset_constants.dart';
import 'package:flutter_technical_assessment/utils/constants.dart';

import '../../widgets/primaryButton.dart';
import '../ui_server.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConst.primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(
              height: 130.h,
            ),
            SvgPicture.asset(AssetsConstants.successful),
            const Text(
              'Transaction Successfully Reported',
              style: TextStyle(
                  color: AppConst.yellow,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const Text(
              'Your report has been received and is under careful review.',
              style: TextStyle(
                  color: AppConst.textBlackVariant1,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 180.h,
            ),
            PrimaryButton(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const HomeView()));
              },
              text: 'Back to Home',
              textStyle: const TextStyle(
                  color: AppConst.lightColor,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}

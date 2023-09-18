import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_technical_assessment/utils/constants.dart';
import 'package:lottie/lottie.dart';

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
            ColorFiltered(
              colorFilter: const ColorFilter.mode(
                AppConst.yellow, // Change this color to the desired color
                BlendMode.srcIn,
              ),
              child: Lottie.asset('assets/successful.json'),
            ),
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
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const HomeView()),
                    (route) => false);
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

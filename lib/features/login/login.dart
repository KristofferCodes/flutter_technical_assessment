import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_technical_assessment/constants/asset_constants.dart';
import 'package:flutter_technical_assessment/features/ui_server.dart';
import 'package:flutter_technical_assessment/utils/constants.dart';

import '../../widgets/primaryButton.dart';
import '../../widgets/text_field.dart';
import '../homepage/homepage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    return Scaffold(
      backgroundColor: AppConst.primaryColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(AssetsConstants.back),
                SvgPicture.asset(AssetsConstants.createAccount),
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back!',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.h),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'Be ready to use Kooha in less than 2min ⚡️',
                  style: TextStyle(
                      color: AppConst.textBlack,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.h),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Text(
                  'Email Address',
                  style: TextStyle(
                      color: AppConst.lightColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.h),
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomTextField(
                  controller: email,
                  hintText: 'john@email.com',
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Password',
                  style: TextStyle(
                      color: AppConst.lightColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.h),
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomTextField(
                  controller: email,
                  hintText: 'Password (min. of 8 characters)',
                ),
                SizedBox(
                  height: 240.h,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: RichText(
                    text: TextSpan(
                        text: "Forgot Password?",
                        style: TextStyle(
                            color: AppConst.textBlack,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.h),
                        children: [
                          TextSpan(
                            text: ' Reset it',
                            style: TextStyle(
                                color: AppConst.yellow,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.h),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const HomePage()));
                              },
                          )
                        ]),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                PrimaryButton(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const HomeView()));
                  },
                  text: 'Log me in',
                )
              ],
            ),
          ],
        ),
      )),
    );
  }
}

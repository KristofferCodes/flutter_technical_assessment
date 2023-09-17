import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_technical_assessment/constants/asset_constants.dart';
import 'package:flutter_technical_assessment/features/ui_server.dart';
import 'package:flutter_technical_assessment/utils/constants.dart';

import '../../api/login/login_controller.dart';
import '../../widgets/primaryButton.dart';
import '../../widgets/text_field.dart';
import '../homepage/homepage.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    final isLoading = ref.watch(loginControllerProvider);
    return Scaffold(
      backgroundColor: AppConst.primaryColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Stack(
          children: [
            ListView(
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
                      controller: password,
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
                                    // Navigator.of(context).push(MaterialPageRoute(
                                    //     builder: (context) => const HomePage()));
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
                        ref.read(loginControllerProvider.notifier).login(
                            context: context,
                            email: email.text,
                            password: password.text);
                      },
                      text: 'Log me in',
                    )
                  ],
                ),
              ],
            ),
            isLoading
                ? Center(
                    child: Container(
                        height: MediaQuery.sizeOf(context).height * .15,
                        width: MediaQuery.sizeOf(context).width * .5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0XFFF2F2F2),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child:
                            const Center(child: CircularProgressIndicator())),
                  )
                : const SizedBox.shrink()
          ],
        ),
      )),
    );
  }
}

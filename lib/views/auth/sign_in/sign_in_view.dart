import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickle_ball/common/widgets/text_form_field_auth.dart';
import 'package:pickle_ball/utils/assets_utils.dart';
import '../../../common/widgets/text_button_widget.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/routes/routes.dart';

class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  _SignInViewState createState() => _SignInViewState();
}

final TextEditingController nameController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController emailController = TextEditingController();

class _SignInViewState extends State<SignInView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AssetUtils.imgSignIn),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            height: ScreenUtil().screenHeight,
            padding:
                const EdgeInsets.only(top: 70, left: 30, right: 30, bottom: 20)
                    .r,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  AssetUtils.imgHeader,
                  height: 70.h,
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  height: 20.h,
                ),
                TextFormFieldAuthWidget(
                  hint: 'UserName',
                  label: "User Name",
                  inputAction: TextInputAction.next,
                  controller: emailController,
                ),
                SizedBox(
                  height: 20.h,
                ),
                TextFormFieldAuthWidget(
                  hint: 'Your password',
                  label: "Password",
                  controller: emailController,
                  inputAction: TextInputAction.done,
                  obscureText: true,
                  suffixIcon: IconButton(
                    onPressed: () => {},
                    icon: const Icon(Icons.visibility),
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                TextButtonWidget(
                  label: 'Login',
                  onPressed: () {
                    Routes.goToBottomNavigatorScreen(context);
                  },
                ),
                SizedBox(
                  height: 40.h,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Didn\'t you have a account? ',
                        style: TextStyle(
                          color: ColorUtils.textColor,
                          fontSize: 14,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Routes.goToSignUpScreen(context),
                        child: Text(
                          'Register',
                          style: TextStyle(
                            color: ColorUtils.textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

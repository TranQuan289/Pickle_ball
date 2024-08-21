import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickle_ball/common/widgets/text_form_field_auth.dart';
import 'package:pickle_ball/utils/assets_utils.dart';
import '../../../common/widgets/text_button_widget.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/routes/routes.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignUpViewState createState() => _SignUpViewState();
}

final TextEditingController emailController = TextEditingController();

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AssetUtils.imgSignUp),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            padding:
                const EdgeInsets.only(top: 70, left: 30, right: 30, bottom: 20)
                    .r,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 4, 39, 68).withOpacity(0.7),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  AssetUtils.imgHeader,
                  height: 70.h,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'Create Your Account',
                  style: TextStyle(
                    color: ColorUtils.textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                TextFormFieldAuthWidget(
                  hint: 'Your full name',
                  label: "User Name",
                  controller: emailController,
                  inputAction: TextInputAction.next,
                ),
                SizedBox(
                  height: 20.h,
                ),
                TextFormFieldAuthWidget(
                  hint: 'Your email address',
                  label: "Email address",
                  inputAction: TextInputAction.next,
                  controller: emailController,
                ),
                SizedBox(
                  height: 20.h,
                ),
                TextFormFieldAuthWidget(
                  hint: 'Your phone number',
                  label: "Phone number",
                  inputAction: TextInputAction.next,
                  controller: emailController,
                  textInputType: TextInputType.phone,
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
                  label: 'Sign Up',
                  onPressed: () {},
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have a account? ',
                        style: TextStyle(
                          color: ColorUtils.textColor,
                          fontSize: 14,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Routes.goToSignInScreen(context),
                        child: Text(
                          'Login',
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

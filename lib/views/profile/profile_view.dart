import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pickle_ball/utils/assets_utils.dart';
import 'package:pickle_ball/utils/color_utils.dart';
import 'package:pickle_ball/utils/routes/routes.dart';
import 'package:pickle_ball/views/profile/widgets/button_settings_widget.dart';
import 'package:pickle_ball/views/profile/views/profile_detail_view.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorUtils.primaryBackgroundColor,
        title: Text(
          'Profile',
          style: TextStyle(
            color: ColorUtils.primaryColor,
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.only(bottom: 40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                    image: AssetImage(AssetUtils.imgSignIn),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    CircleAvatar(
                      maxRadius: 40,
                      backgroundColor: Colors.white,
                      child: SvgPicture.asset(
                        'assets/icons/ic_user_account.svg',
                        color: ColorUtils.greenColor,
                        height: 40,
                      ),
                    ),
                    Text(
                      "Trần Quân",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: ColorUtils.whiteColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "abc@gmail.com",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: ColorUtils.whiteColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              ButtonSettingsWidget(
                  icon: SvgPicture.asset(
                    AssetUtils.icUser,
                    color: Colors.black,
                  ),
                  title: 'Profile Detail',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfileDetailView()),
                    );
                  }),
              Container(
                height: 1,
                width: double.infinity,
                color: ColorUtils.blueColor,
              ),
              ButtonSettingsWidget(
                icon: Icon(
                  Icons.logout,
                  color: Colors.black.withOpacity(0.7),
                ),
                title: 'Logout',
                onPressed: () => Routes.goToSignInScreen(context),
              ),
              Container(
                height: 1,
                width: double.infinity,
                color: ColorUtils.textColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

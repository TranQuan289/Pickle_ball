import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickle_ball/common/widgets/text_button_widget.dart';
import 'package:pickle_ball/common/widgets/text_form_field.dart';
import 'package:pickle_ball/utils/color_utils.dart';
import 'package:pickle_ball/utils/popup_utils.dart';

class ProfileDetailView extends ConsumerWidget {
  const ProfileDetailView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = TextEditingController();
    final dobController = TextEditingController();
    final emailController = TextEditingController();
    final phoneController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Detail'),
        centerTitle: true,
        backgroundColor: ColorUtils.primaryBackgroundColor,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () async => PopupUtils.showBottomSheetAddImageDialog(
                context: context,
                onSelectPressedCamera: () {},
                onSelectPressedGallery: () {},
              ),
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  height: 100.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: ColorUtils.greenColor),
                  ),
                  child: const Icon(Icons.add),
                ),
              ),
            ),
            TextFormFieldCustomWidget(
              label: 'Name',
              controller: nameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFormFieldCustomWidget(
              label: 'Date of Birth',
              controller: dobController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your date of birth';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFormFieldCustomWidget(
              label: 'Email',
              controller: emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email address';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFormFieldCustomWidget(
              label: 'Phone Number',
              controller: phoneController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your phone number';
                }
                return null;
              },
            ),
            const SizedBox(height: 50),
            TextButtonWidget(
              label: 'Update',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

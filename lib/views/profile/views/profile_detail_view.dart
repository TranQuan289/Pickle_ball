import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickle_ball/common/widgets/text_button_widget.dart';
import 'package:pickle_ball/common/widgets/text_form_field.dart';
import 'package:pickle_ball/utils/color_utils.dart';
import 'package:pickle_ball/utils/popup_utils.dart';
import 'package:pickle_ball/models/user_profile_model.dart';
import 'package:pickle_ball/services/auth_service.dart';
import 'package:pickle_ball/services/profile_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pickle_ball/providers/profile_provider.dart';

class ProfileDetailView extends ConsumerStatefulWidget {
  const ProfileDetailView({super.key});

  @override
  ConsumerState<ProfileDetailView> createState() => _ProfileDetailViewState();
}

class _ProfileDetailViewState extends ConsumerState<ProfileDetailView> {
  final nameController = TextEditingController();
  final dobController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final genderController = TextEditingController();
  String? userId;
  UserProfile? userProfile;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUserId();
  }

  Future<void> _loadUserId() async {
    final authService = AuthService();
    userId = await authService.getUserId();
    if (userId != null) {
      _fetchUserProfile();
    }
  }

  Future<void> _fetchUserProfile() async {
    final profileAsync = ref.read(profileProvider(userId!));
    profileAsync.whenData((profile) {
      setState(() {
        userProfile = profile;
        _loadUserData();
        isLoading = false;
      });
    });
  }

  void _loadUserData() {
    if (userProfile != null) {
      nameController.text = userProfile!.fullName ?? '';
      dobController.text = userProfile!.dateOfBirth ?? '';
      emailController.text = userProfile!.email ?? '';
      phoneController.text = userProfile!.phoneNumber ?? '';
      addressController.text = userProfile!.address ?? '';
      genderController.text = userProfile!.gender ?? '';
    }
  }

  Future<void> _updateProfile() async {
    if (userId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User ID not found')),
      );
      return;
    }

    final profileService = ProfileService();
    final updatedProfile = {
      'FullName': nameController.text,
      'DateOfBirth': dobController.text,
      'Email': emailController.text,
      'PhoneNumber': phoneController.text,
      'Address': addressController.text,
      'Gender': genderController.text,
      'Status': 1,
    };

    try {
      await profileService.updateUserProfile(
          int.parse(userId!), updatedProfile);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile updated successfully')),
      );
      // Refresh the profile data in the provider
      ref.read(profileProvider(userId!).notifier).fetchUserProfile();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error updating profile: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Detail'),
        centerTitle: true,
        backgroundColor: ColorUtils.primaryBackgroundColor,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : userProfile == null
              ? const Center(child: Text('Failed to load profile'))
              : SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () async =>
                            PopupUtils.showBottomSheetAddImageDialog(
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
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
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
                      const SizedBox(height: 20),
                      TextFormFieldCustomWidget(
                        label: 'Address',
                        controller: addressController,
                      ),
                      const SizedBox(height: 20),
                      TextFormFieldCustomWidget(
                        label: 'Gender',
                        controller: genderController,
                      ),
                      const SizedBox(height: 50),
                      TextButtonWidget(
                        label: 'Update',
                        onPressed: _updateProfile,
                      ),
                    ],
                  ),
                ),
    );
  }
}

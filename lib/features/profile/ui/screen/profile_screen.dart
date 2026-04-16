import 'package:exam_app/config/routes/app_routes.dart';
import 'package:exam_app/core/constants/profile_constants.dart';
import 'package:exam_app/core/resources/app_images.dart';
import 'package:exam_app/core/resources/style_manager.dart';
import 'package:exam_app/core/resources/values_manager.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/features/profile/domain/entity/request/update_profile_request.dart';
import 'package:exam_app/features/profile/ui/cubit/profile_intint.dart';
import 'package:exam_app/features/profile/ui/cubit/profile_state.dart';
import 'package:exam_app/features/profile/ui/cubit/profile_view_model.dart';
import 'package:exam_app/features/profile/ui/widgets/profile_fields_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/models/quickalert_animtype.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late TextEditingController usernameController;
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;

  bool isInitialized = false;

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();

    context.read<ProfileViewModel>().onIntent(LoadProfileIntent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileViewModel, ProfileState>(
      listener: (context, state) {
        if (state.userData != null && !isInitialized) {
          final user = state.userData!.user;
          usernameController.text = user!.username ?? '';
          firstNameController.text = user.firstName ?? '';
          lastNameController.text = user.lastName ?? '';
          emailController.text = user.email ?? '';
          phoneController.text = user.phone ?? '';
          isInitialized = true;
        }

        /// success
        if (state.successMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(ProfileConstants.profileUpdateSuccess),
              backgroundColor: AppColors.successGreen,
            ),
          );
        }

        /// error
        if (state.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage!),
              backgroundColor: AppColors.errorRed,
            ),
          );
        }

        if (state.isLoggedOut) {
          Navigator.of(
            context,
          ).pushNamedAndRemoveUntil(AppRoutes.login, (route) => false);
        }
      },
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        return Scaffold(
          appBar: AppBar(
            title: Text(
              state.isUpdating
                  ? ProfileConstants.updatingProfile
                  : ProfileConstants.profile,
              style: getMediumStyle(
                color: AppColors.black,
                fontSize: AppSize.s20,
              ),
            ),
            automaticallyImplyLeading: false,
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p16,
                vertical: AppPadding.p8,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    /// Profile Image
                    Padding(
                      padding: const EdgeInsets.only(bottom: AppPadding.p24),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(AppSize.s100),
                        child: Image.asset(
                          AppImages.staticProfile,
                          height: AppSize.s100,
                          width: AppSize.s100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    ProfileFieldsWidget(
                      usernameController: usernameController,
                      firstNameController: firstNameController,
                      lastNameController: lastNameController,
                      emailController: emailController,
                      phoneController: phoneController,
                      hintState: state,
                    ),

                    /// Username
                    const SizedBox(height: AppSize.s50),

                    /// Update Button
                    ElevatedButton(
                      onPressed: state.isUpdating
                          ? null
                          : () {
                              context.read<ProfileViewModel>().onIntent(
                                UpdateProfileIntent(
                                  UpdateProfileRequest(
                                    username: usernameController.text,
                                    firstName: firstNameController.text,
                                    lastName: lastNameController.text,
                                    email: emailController.text,
                                    phone: phoneController.text,
                                  ),
                                ),
                              );
                            },
                      child: state.isUpdating
                          ? SizedBox(
                              height: AppSize.s20,
                              width: AppSize.s20,
                              child: const CircularProgressIndicator(
                                color: AppColors.lightGray,
                                strokeWidth: AppSize.s2,
                              ),
                            )
                          : const Text(ProfileConstants.update),
                    ),
                    SizedBox(height: AppSize.s16),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.errorRed,
                      ),
                      onPressed: () {
                        _buildAlert();
                      },
                      child: const Text(ProfileConstants.logout),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> _buildAlert() {
    return QuickAlert.show(
      context: context,
      type: QuickAlertType.info,
      title: ProfileConstants.signOut,
      text: ProfileConstants.signOutConfirmation,
      confirmBtnText: ProfileConstants.signOut,
      cancelBtnText: ProfileConstants.cancel,
      showCancelBtn: true,
      confirmBtnColor: Colors.red,
      barrierDismissible: false,
      animType: QuickAlertAnimType.scale,

      onConfirmBtnTap: () {
        Navigator.pop(context);
        context.read<ProfileViewModel>().onIntent(LogoutIntent());
      },
    );
  }
}

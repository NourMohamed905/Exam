import 'package:exam_app/core/constants/profile_constants.dart';
import 'package:exam_app/core/resources/style_manager.dart';
import 'package:exam_app/core/resources/values_manager.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/widgets/app_text_field.dart';
import 'package:exam_app/features/profile/change_password_ui/screens/change_password_screen.dart';
import 'package:flutter/material.dart';

class ProfileFieldsWidget extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final dynamic hintState;

  const ProfileFieldsWidget({
    super.key,
    required this.usernameController,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.phoneController,
    required this.hintState,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppSize.s24,
      children: [
        CustomTextFormField(
          controller: usernameController,
          hintText:
              hintState.userData?.user?.username ??
              ProfileConstants.username,
          labelText: ProfileConstants.username,
        ),

        Row(
          spacing: AppSize.s16,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CustomTextFormField(
                controller: firstNameController,
                hintText:
                    hintState.userData?.user?.firstName ??
                    ProfileConstants.firstName,
                labelText: ProfileConstants.firstName,
              ),
            ),
            Expanded(
              child: CustomTextFormField(
                controller: lastNameController,
                hintText:
                    hintState.userData?.user?.lastName ??
                    ProfileConstants.lastName,
                labelText: ProfileConstants.lastName,
              ),
            ),
          ],
        ),

        CustomTextFormField(
          controller: emailController,
          hintText:
              hintState.userData?.user?.email ?? ProfileConstants.email,
          labelText: ProfileConstants.email,
        ),

        CustomTextFormField(
          labelText: ProfileConstants.password,
          suffixIcon: _buildStars(context, 6),
          readOnly: true,
        ),

        CustomTextFormField(
          controller: phoneController,
          hintText:
              hintState.userData?.user?.phone ?? ProfileConstants.phone,
          labelText: ProfileConstants.phone,
        ),
      ],
    );
  }

  Widget _buildStars(BuildContext context, int count) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: List.generate(
              count,
              (index) => const Icon(
                Icons.star,
                color: AppColors.grey,
                size: AppSize.s15,
              ),
            ),
          ),

          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ChangePasswordScreen(),
                ),
              );
            },
            child: Text(
              ProfileConstants.change,
              style: getBoldStyle(
                color: AppColors.primaryBlue,
                fontSize: AppSize.s14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
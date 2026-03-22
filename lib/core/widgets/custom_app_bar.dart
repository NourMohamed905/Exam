import 'package:exam_app/core/resources/style_manager.dart';
import 'package:exam_app/core/resources/values_manager.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackTap;
  final bool showBackButton;
  const CustomAppBar({
    super.key,
    required this.title,
    this.onBackTap,
    this.showBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      automaticallyImplyLeading: showBackButton,
      leading: showBackButton
          ? IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
                size: AppSize.s20,
              ),
              onPressed: onBackTap ?? () => Navigator.pop(context),
            )
          : null,
      title: Text(
        title,
        style: getMediumStyle(color: AppColors.black, fontSize: AppSize.s18.sp),
      ),
      centerTitle: false,
      titleSpacing: showBackButton ? 0 : AppPadding.p16,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

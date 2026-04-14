import 'package:exam_app/config/di/di.dart';
import 'package:exam_app/core/constants/home_constants.dart';
import 'package:exam_app/core/resources/app_images.dart';
import 'package:exam_app/core/resources/style_manager.dart';
import 'package:exam_app/core/resources/values_manager.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/widgets/place_holder_widget.dart';
import 'package:exam_app/features/home/home_subject/ui/cubit/home_subject_Intent.dart';
import 'package:exam_app/features/home/home_subject/ui/cubit/home_subject_view_model.dart';
import 'package:exam_app/features/home/home_subject/ui/screen/home_screen.dart';
import 'package:exam_app/features/home/main_layout/cubit/layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainLayoutCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          body: IndexedStack(
            index: currentIndex,
            children: [
              BlocProvider<HomeSubjectViewModel>(
                create: (_) =>
                    getIt<HomeSubjectViewModel>()..doIntent(LoadSubjects()),
                child: HomeView(),
              ), //*replace with result screen
              PlaceHolderWidget(screenName: 'Result Screen'),
              //* replace with profile screen
              PlaceHolderWidget(screenName: 'Profile Screen'),
            ],
          ),

          bottomNavigationBar: NavigationBarTheme(
            data: NavigationBarThemeData(
              indicatorColor: AppColors.primaryBlue.withAlpha(50),
              backgroundColor: AppColors.lightGray,
              height: AppSize.s60,
              labelTextStyle: WidgetStateProperty.all(
                getMediumStyle(
                  color: AppColors.primaryBlue,
                  fontSize: AppSize.s14,
                ),
              ),
            ),
            child: NavigationBar(
              selectedIndex: currentIndex,
              onDestinationSelected: (index) {
                context.read<MainLayoutCubit>().changeTab(index);
              },
              destinations: [
                NavigationDestination(
                  icon: SvgPicture.asset(AppSvgs.homeSvg),
                  label: HomeConstants.exploreTap,
                ),
                NavigationDestination(
                  icon: SvgPicture.asset(AppSvgs.resultSvg),
                  label: HomeConstants.resultTap,
                ),
                NavigationDestination(
                  icon: SvgPicture.asset(AppSvgs.profileSvg),
                  label: HomeConstants.profileTap,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

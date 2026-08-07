import 'package:exam_app/core/constant/app_text_constants.dart';
import 'package:exam_app/core/utils/color_manager.dart';
import 'package:exam_app/core/utils/router/app_routes.dart';
import 'package:exam_app/feature/explore/presentation/view_model/explore_cubit.dart';
import 'package:exam_app/feature/explore/presentation/view_model/explore_states.dart';
import 'package:exam_app/feature/explore/presentation/widgets/search_text_field.dart';
import 'package:exam_app/feature/explore/presentation/widgets/subject_card.dart';
import 'package:exam_app/core/utils/widgets/custom_snack_bar.dart';
import 'package:exam_app/core/utils/widgets/loading_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExplorePageBody extends StatelessWidget {
  const ExplorePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return BlocConsumer<ExploreCubit, ExploreStates>(
      listenWhen: (prev, curr) => prev.errorMessage != curr.errorMessage,
      listener: (context, state) {
        if (state.errorMessage != null) {
          CustomSnackBar.error(context, state.errorMessage!);
        }
      },
      builder: (context, state) {
        return CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              pinned: false,
              floating: false,
              stretch: true,
              backgroundColor: ColorManager.primeColor,
              expandedHeight: 120,
              elevation: 0,
              automaticallyImplyLeading: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        ColorManager.primeColorDark,
                        ColorManager.primeColor,
                        ColorManager.primeColorLight,
                      ],
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: -30,
                        right: -30,
                        child: Container(
                          width: 140,
                          height: 140,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withValues(alpha: 0.08),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 30,
                        left: -20,
                        child: Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withValues(alpha: 0.06),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                          20,
                          statusBarHeight + 16,
                          20,
                          0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Explore',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28,
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: -0.5,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'What do you want to learn today?',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.15),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: const Icon(
                                Icons.auto_awesome_rounded,
                                color: Colors.white,
                                size: 22,
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

            SliverPersistentHeader(
              pinned: true,
              delegate: _SearchBarDelegate(
                statusBarHeight: statusBarHeight,
                child: Container(
                  color: ColorManager.whiteColor,
                  padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
                  child: const SearchTextField(),
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
                child: Text(
                  AppTextConstants.browseBySubject,
                  style: const TextStyle(
                    color: ColorManager.blackColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),

            if (state.status == ExploreStatus.loading)
              const SliverFillRemaining(
                child: Center(child: LoadingAnimation()),
              )
            else if (state.subjects == null || state.subjects!.isEmpty)
              SliverFillRemaining(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.search_off_rounded,
                        size: 48,
                        color: ColorManager.hintColor,
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        AppTextConstants.noSubjectsFound,
                        style: TextStyle(
                          fontSize: 15,
                          color: ColorManager.greyColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            else
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 1.05,
                  ),
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final subject = state.subjects![index];
                    return SubjectCard(
                      subject: subject,
                      index: index,
                      onTap: () {
                        if (subject.id != null) {
                          Navigator.of(context).pushNamed(
                            AppRoutes.subjectExamScreen,
                            arguments: subject.id,
                          );
                        }
                      },
                    );
                  }, childCount: state.subjects!.length),
                ),
              ),
            const SliverToBoxAdapter(child: SizedBox(height: 100)),
          ],
        );
      },
    );
  }
}

class _SearchBarDelegate extends SliverPersistentHeaderDelegate {
  _SearchBarDelegate({required this.child, required this.statusBarHeight});

  final Widget child;
  final double statusBarHeight;

  static const double _contentHeight = 76;

  @override
  double get minExtent => _contentHeight + statusBarHeight;

  @override
  double get maxExtent => _contentHeight + statusBarHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Material(
      color: ColorManager.whiteColor,
      elevation: overlapsContent ? 2 : 0,
      shadowColor: Colors.black.withValues(alpha: 0.06),
      child: Padding(
        padding: EdgeInsets.only(top: statusBarHeight),
        child: child,
      ),
    );
  }

  @override
  bool shouldRebuild(covariant _SearchBarDelegate oldDelegate) {
    return oldDelegate.child != child ||
        oldDelegate.statusBarHeight != statusBarHeight;
  }
}

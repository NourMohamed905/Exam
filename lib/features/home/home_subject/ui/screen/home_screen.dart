import 'package:exam_app/core/constants/home_constants.dart';
import 'package:exam_app/core/error/app_error_massage.dart';
import 'package:exam_app/core/resources/style_manager.dart';
import 'package:exam_app/core/resources/values_manager.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/features/home/home_subject/domain/entity/subject.dart';
import 'package:exam_app/features/home/home_subject/ui/cubit/home_subject_Intent.dart';
import 'package:exam_app/features/home/home_subject/ui/cubit/home_subject_state.dart';
import 'package:exam_app/features/home/home_subject/ui/cubit/home_subject_view_model.dart';
import 'package:exam_app/features/home/home_subject/ui/screen/widgets/search_subjects_widget.dart';
import 'package:exam_app/features/home/home_subject/ui/screen/widgets/subject_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<Subject> dummySubjects = List.generate(
    6,
    (index) => Subject(id: '', name: '', icon: ''),
  );

  @override
  void initState() {
    super.initState();
    context.read<HomeSubjectViewModel>().doIntent(LoadSubjects());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          HomeConstants.appBarTitle,
          style: getMediumStyle(
            color: AppColors.primaryBlue,
            fontSize: AppSize.s20,
          ),
        ),
      ),
      body: BlocListener<HomeSubjectViewModel, HomeState>(
        listenWhen: (prev, curr) =>
            !prev.showOfflineMessage && curr.showOfflineMessage,
        listener: (context, state) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppMessages.youAreOffline),
                  const Icon(Icons.wifi_off, color: Colors.red),
                ],
              ),
            ),
          );
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p16,
              vertical: AppMargin.m8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchSubjectsWidget(
                  onChanged: (value) {
                    context.read<HomeSubjectViewModel>().doIntent(
                      SearchSubjects(value),
                    );
                  },
                ),
                SizedBox(height: AppSize.s42.h),
                Text(
                  HomeConstants.homeTitle,
                  style: getMediumStyle(
                    color: AppColors.black,
                    fontSize: AppSize.s18,
                  ),
                ),
                SizedBox(height: AppSize.s24.h),
                Expanded(child: buildSubjectList()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSubjectList() {
    return BlocBuilder<HomeSubjectViewModel, HomeState>(
      builder: (context, state) {
        if (state.isLoading) {
          return buildList(state, isLoading: true);
        }

        if (state.errorMessage != null) {
          return ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              SizedBox(
                height: 300.h,
                child: Center(child: Text(state.errorMessage!)),
              ),
            ],
          );
        }

        if (state.filteredSubjects.isEmpty) {
          return ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              SizedBox(
                height: 300.h,
                child: Center(child: Text(HomeConstants.noSubjectsFound)),
              ),
            ],
          );
        }

        return buildList(state);
      },
    );
  }

  Widget buildList(HomeState state, {bool isLoading = false}) {
    final subjects = isLoading ? dummySubjects : state.filteredSubjects;

    return RefreshIndicator(
      onRefresh: () => context.read<HomeSubjectViewModel>().refreshSubjects(),
      child: Skeletonizer(
        enabled: isLoading,
        containersColor: Colors.grey.shade200,
        effect: ShimmerEffect(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          duration: const Duration(milliseconds: 1200),
        ),
        child: ListView.separated(
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: subjects.length,
          separatorBuilder: (context, index) => SizedBox(height: AppSize.s16.h),
          itemBuilder: (context, index) {
            return SubjectItemWidget(subject: subjects[index]);
          },
        ),
      ),
    );
  }
}

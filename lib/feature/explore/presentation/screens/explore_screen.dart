import 'package:exam_app/config/di/di.dart';
import 'package:exam_app/core/utils/color_manager.dart';
import 'package:exam_app/feature/explore/presentation/view_model/explore_cubit.dart';
import 'package:exam_app/feature/explore/presentation/view_model/explore_intent.dart';
import 'package:exam_app/feature/explore/presentation/widgets/explore_body.dart';
import 'package:exam_app/feature/profile/presentation/screens/profile_screen.dart';
import 'package:exam_app/feature/results/presentation/bloc/results_bloc.dart';
import 'package:exam_app/feature/results/presentation/bloc/results_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../results/presentation/screens/results_screen.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  int _currentIndex = 0;
  late ResultsBloc _resultsBloc;

  static const List<(IconData, IconData, String)> _navItems = [
    (Icons.home_outlined, Icons.home_rounded, 'Explore'),
    (Icons.assignment_outlined, Icons.assignment_rounded, 'Result'),
    (Icons.person_outline_rounded, Icons.person_rounded, 'Profile'),
  ];

  @override
  void initState() {
    super.initState();
    _resultsBloc = getIt<ResultsBloc>();
  }

  late final List<Widget> _tabs = [
    BlocProvider(
      create: (_) => getIt<ExploreCubit>()..doIntent(LoadSubjectsIntent()),
      child: const ExplorePageBody(),
    ),
    const ResultsScreen(),
    ProfileScreen(onBack: () => setState(() => _currentIndex = 0)),
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: BlocProvider.value(
        value: _resultsBloc,
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          behavior: HitTestBehavior.opaque,
          child: Scaffold(
            backgroundColor: ColorManager.whiteColor,
            extendBody: true,
            body: IndexedStack(index: _currentIndex, children: _tabs),
            bottomNavigationBar: _FloatingNavBar(
              currentIndex: _currentIndex,
              items: _navItems,
              onTap: (i) {
                setState(() => _currentIndex = i);
                if (i == 1) _resultsBloc.add(LoadResultsEvent());
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _FloatingNavBar extends StatelessWidget {
  const _FloatingNavBar({
    required this.currentIndex,
    required this.items,
    required this.onTap,
  });

  final int currentIndex;
  final List<(IconData, IconData, String)> items;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
      child: Container(
        height: 68,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: ColorManager.whiteColor,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: ColorManager.primeColor.withValues(alpha: 0.06),
              blurRadius: 24,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          children: List.generate(items.length, (i) {
            final selected = i == currentIndex;
            final (outlined, filled, label) = items[i];
            return Expanded(
              child: GestureDetector(
                onTap: () => onTap(i),
                behavior: HitTestBehavior.opaque,
                child: AnimatedContainer(
                  height: 40,
                  duration: const Duration(milliseconds: 220),
                  curve: Curves.easeOut,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: selected
                        ? ColorManager.primeColor.withValues(alpha: 0.1)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        selected ? filled : outlined,
                        color: selected
                            ? ColorManager.primeColor
                            : ColorManager.greyColor,
                        size: 24,
                      ),
                      AnimatedSize(
                        duration: const Duration(milliseconds: 220),
                        child: selected
                            ? Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Text(
                                  label,
                                  style: const TextStyle(
                                    color: ColorManager.primeColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 13,
                                  ),
                                ),
                              )
                            : const SizedBox.shrink(),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

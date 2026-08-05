// subject_card.dart
import 'package:cached_network_image/cached_network_image.dart';
import 'package:exam_app/core/constant/app_text_constants.dart';
import 'package:exam_app/core/utils/color_manager.dart';
import 'package:exam_app/feature/explore/domain/model/subject_entity.dart';
import 'package:flutter/material.dart';

class SubjectCard extends StatelessWidget {
  const SubjectCard({
    super.key,
    required this.subject,
    this.onTap,
    this.index = 0,
  });

  final SubjectEntity? subject;
  final VoidCallback? onTap;
  final int index;

  // Rotating gradient palette so each card feels distinct without
  // needing per-subject color data from the backend.
  static const List<List<Color>> _gradients = [
    [Color(0xFFFFE29A), Color(0xFFFFB347)], // JS-ish yellow/orange
    [Color(0xFF9AD8FF), Color(0xFF4E9CF5)], // blue
    [Color(0xFFB9F5D8), Color(0xFF35C48C)], // green
    [Color(0xFFE0C3FF), Color(0xFFA46BFF)], // purple
    [Color(0xFFFFC3D0), Color(0xFFFF6B8B)], // pink
    [Color(0xFFC9E6FF), Color(0xFF6FA8FF)], // light blue
  ];

  @override
  Widget build(BuildContext context) {
    final iconUrl = subject?.icon;
    final hasIcon = iconUrl != null && iconUrl.isNotEmpty;
    final gradient = _gradients[index % _gradients.length];

    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        splashColor: ColorManager.primeColor.withValues(alpha: 0.06),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 16,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: gradient,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  shape: BoxShape.circle,
                ),
                child: hasIcon
                    ? CachedNetworkImage(
                        imageUrl: iconUrl,
                        height: 32,
                        width: 32,
                        placeholder: (_, __) => const SizedBox(
                          height: 32,
                          width: 32,
                          child: Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        errorWidget: (_, __, ___) => const Icon(
                          Icons.book_rounded,
                          color: Colors.white,
                          size: 28,
                        ),
                      )
                    : const Icon(
                        Icons.book_rounded,
                        color: Colors.white,
                        size: 28,
                      ),
              ),
              const SizedBox(height: 14),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  (subject?.name != null && subject!.name!.isNotEmpty)
                      ? subject!.name!
                      : AppTextConstants.unknown,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: ColorManager.blackColor,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

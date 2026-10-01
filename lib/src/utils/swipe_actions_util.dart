import 'package:flutter/material.dart';

class SwipeActionsUtil {
  static Color categoryColor(String category) {
    switch (category.toLowerCase()) {
      case 'work':
        return const Color(0xFF6366F1);

      case 'personal':
        return const Color(0xFF10B981);

      case 'shopping':
        return const Color(0xFFF59E0B);

      case 'important':
        return const Color(0xFFEF4444);

      default:
        return const Color(0xFF64748B);
    }
  }

  static IconData categoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'work':
        return Icons.work_outline;

      case 'personal':
        return Icons.person_outline;

      case 'shopping':
        return Icons.shopping_bag_outlined;

      case 'important':
        return Icons.priority_high_rounded;

      default:
        return Icons.notes_outlined;
    }
  }

  static Widget actionButton({
    required Color color,
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(18),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(18),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                  size: 22,
                ),
                const SizedBox(width: 7),
                Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
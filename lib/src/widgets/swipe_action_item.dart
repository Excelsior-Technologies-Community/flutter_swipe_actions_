import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../models/swipe_item_model.dart';
import '../utils/swipe_actions_util.dart';

class SwipeActionItem extends StatelessWidget {
  final SwipeItemModel item;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final VoidCallback? onArchive;

  const SwipeActionItem({
    super.key,
    required this.item,
    this.onEdit,
    this.onDelete,
    this.onArchive,
  });

  @override
  Widget build(BuildContext context) {
    final categoryColor =
    SwipeActionsUtil.categoryColor(item.category);

    return Slidable(
      key: ValueKey(item.id),

      startActionPane: ActionPane(
        motion: const StretchMotion(),
        extentRatio: 0.72,
        children: [
          SlidableAction(
            onPressed: (_) => onEdit?.call(),
            backgroundColor: const Color(0xFF6366F1),
            foregroundColor: Colors.white,
            icon: Icons.edit_outlined,
            label: 'Edit',
            borderRadius: BorderRadius.circular(18),
            padding: const EdgeInsets.symmetric(horizontal: 8),
          ),
          SlidableAction(
            onPressed: (_) => onArchive?.call(),
            backgroundColor: const Color(0xFF10B981),
            foregroundColor: Colors.white,
            icon: Icons.archive_outlined,
            label: 'Archive',
            borderRadius: BorderRadius.circular(18),
            padding: const EdgeInsets.symmetric(horizontal: 8),
          ),
        ],
      ),

      endActionPane: ActionPane(
        motion: const StretchMotion(),
        extentRatio: 0.36,
        children: [
          SlidableAction(
            onPressed: (_) => onDelete?.call(),
            backgroundColor: const Color(0xFFEF4444),
            foregroundColor: Colors.white,
            icon: Icons.delete_outline,
            label: 'Delete',
            borderRadius: BorderRadius.circular(18),
            padding: const EdgeInsets.symmetric(horizontal: 8),
          ),
        ],
      ),

      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: const Color(0xFFE2E8F0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 18,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                height: 52,
                width: 52,
                decoration: BoxDecoration(
                  color: categoryColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  SwipeActionsUtil.categoryIcon(item.category),
                  color: categoryColor,
                  size: 25,
                ),
              ),

              const SizedBox(width: 14),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Color(0xFF172033),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      item.subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Color(0xFF64748B),
                        fontSize: 13,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 9,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: categoryColor.withValues(alpha: 0.10),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            item.category,
                            style: TextStyle(
                              color: categoryColor,
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),

                        const Spacer(),

                        const Icon(
                          Icons.access_time_rounded,
                          size: 14,
                          color: Color(0xFF94A3B8),
                        ),

                        const SizedBox(width: 4),

                        Text(
                          item.time,
                          style: const TextStyle(
                            color: Color(0xFF94A3B8),
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 6),

              const Icon(
                Icons.swipe_left_rounded,
                size: 20,
                color: Color(0xFFCBD5E1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
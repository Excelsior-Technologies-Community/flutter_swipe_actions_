class SwipeItemModel {
  final String id;
  final String title;
  final String subtitle;
  final String category;
  final String time;
  final bool isArchived;

  const SwipeItemModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.category,
    required this.time,
    this.isArchived = false,
  });

  SwipeItemModel copyWith({
    String? id,
    String? title,
    String? subtitle,
    String? category,
    String? time,
    bool? isArchived,
  }) {
    return SwipeItemModel(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      category: category ?? this.category,
      time: time ?? this.time,
      isArchived: isArchived ?? this.isArchived,
    );
  }
}
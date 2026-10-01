import 'package:flutter/material.dart';
import 'package:flutter_swipe_actions/flutter_swipe_actions.dart';

void main() {
  runApp(const SwipeActionsDemoApp());
}

class SwipeActionsDemoApp extends StatelessWidget {
  const SwipeActionsDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Swipe Actions',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6366F1),
        ),
      ),
      home: const SwipeActionsHomePage(),
    );
  }
}

class SwipeActionsHomePage extends StatefulWidget {
  const SwipeActionsHomePage({super.key});

  @override
  State<SwipeActionsHomePage> createState() =>
      _SwipeActionsHomePageState();
}

class _SwipeActionsHomePageState
    extends State<SwipeActionsHomePage> {
  final List<SwipeItemModel> _items = [
    const SwipeItemModel(
      id: '1',
      title: 'Complete Flutter Package',
      subtitle: 'Finish swipe actions package',
      category: 'Work',
      time: '10:30 AM',
    ),
    const SwipeItemModel(
      id: '2',
      title: 'Buy Groceries',
      subtitle: 'Milk, fruits and vegetables',
      category: 'Shopping',
      time: '12:00 PM',
    ),
    const SwipeItemModel(
      id: '3',
      title: 'Call Family',
      subtitle: 'Talk with family tonight',
      category: 'Personal',
      time: '06:30 PM',
    ),
    const SwipeItemModel(
      id: '4',
      title: 'Submit Project',
      subtitle: 'Check final documentation',
      category: 'Important',
      time: '08:00 PM',
    ),
    const SwipeItemModel(
      id: '5',
      title: 'Review GitHub Repository',
      subtitle: 'Update README and tests',
      category: 'Work',
      time: '09:30 PM',
    ),
  ];

  final List<SwipeItemModel> _archivedItems = [];

  void _editItem(SwipeItemModel item) {
    final controller = TextEditingController(
      text: item.title,
    );

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Item'),
          content: TextField(
            controller: controller,
            autofocus: true,
            decoration: InputDecoration(
              hintText: 'Enter title',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () {
                final title = controller.text.trim();

                if (title.isEmpty) {
                  return;
                }

                setState(() {
                  final index = _items.indexWhere(
                        (element) => element.id == item.id,
                  );

                  if (index != -1) {
                    _items[index] = item.copyWith(
                      title: title,
                    );
                  }
                });

                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _deleteItem(SwipeItemModel item) {
    final index = _items.indexWhere(
          (element) => element.id == item.id,
    );

    if (index == -1) {
      return;
    }

    setState(() {
      _items.removeAt(index);
    });

    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${item.title} deleted'),
        action: SnackBarAction(
          label: 'UNDO',
          onPressed: () {
            setState(() {
              _items.insert(
                index.clamp(0, _items.length),
                item,
              );
            });
          },
        ),
      ),
    );
  }

  void _archiveItem(SwipeItemModel item) {
    final index = _items.indexWhere(
          (element) => element.id == item.id,
    );

    if (index == -1) {
      return;
    }

    setState(() {
      _items.removeAt(index);
      _archivedItems.add(
        item.copyWith(
          isArchived: true,
        ),
      );
    });

    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${item.title} archived'),
        action: SnackBarAction(
          label: 'UNDO',
          onPressed: () {
            setState(() {
              _archivedItems.removeWhere(
                    (element) => element.id == item.id,
              );

              _items.insert(
                index.clamp(0, _items.length),
                item,
              );
            });
          },
        ),
      ),
    );
  }

  void _showArchivedItems() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.70,
          decoration: const BoxDecoration(
            color: Color(0xFFF8FAFC),
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(28),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 12),

              Container(
                width: 45,
                height: 5,
                decoration: BoxDecoration(
                  color: const Color(0xFFCBD5E1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Archived Items',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF172033),
                        ),
                      ),
                    ),
                    Text(
                      '${_archivedItems.length}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF6366F1),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              Expanded(
                child: _archivedItems.isEmpty
                    ? const Center(
                  child: Text(
                    'No archived items',
                    style: TextStyle(
                      color: Color(0xFF64748B),
                      fontSize: 15,
                    ),
                  ),
                )
                    : ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  itemCount: _archivedItems.length,
                  itemBuilder: (context, index) {
                    final item = _archivedItems[index];

                    return Container(
                      margin: const EdgeInsets.only(
                        bottom: 10,
                      ),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.title,
                                  style: const TextStyle(
                                    fontWeight:
                                    FontWeight.w700,
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  item.subtitle,
                                  style: const TextStyle(
                                    color: Color(0xFF64748B),
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            tooltip: 'Restore',
                            onPressed: () {
                              setState(() {
                                _archivedItems.removeAt(index);
                                _items.add(
                                  item.copyWith(
                                    isArchived: false,
                                  ),
                                );
                              });

                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.unarchive_outlined,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8FAFC),
        elevation: 0,
        titleSpacing: 20,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Swipe Actions',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w800,
                color: Color(0xFF172033),
              ),
            ),
            SizedBox(height: 2),
            Text(
              'Manage your daily tasks',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF64748B),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            tooltip: 'Archived items',
            onPressed: _showArchivedItems,
            icon: const Icon(
              Icons.archive_outlined,
              color: Color(0xFF475569),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),

      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(
              20,
              10,
              20,
              10,
            ),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF6366F1),
                  Color(0xFF8B5CF6),
                ],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.swipe_rounded,
                  color: Colors.white,
                  size: 28,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Swipe to manage',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        'Right: Edit / Archive   •   Left: Delete',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(
              20,
              8,
              20,
              4,
            ),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'My Tasks',
                    style: TextStyle(
                      color: Color(0xFF172033),
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE0E7FF),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    '${_items.length} items',
                    style: const TextStyle(
                      color: Color(0xFF4F46E5),
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 6),

          Expanded(
            child: _items.isEmpty
                ? const Center(
              child: Column(
                mainAxisAlignment:
                MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.task_alt_rounded,
                    size: 64,
                    color: Color(0xFFCBD5E1),
                  ),
                  SizedBox(height: 14),
                  Text(
                    'All tasks completed',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF475569),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Your task list is empty',
                    style: TextStyle(
                      color: Color(0xFF94A3B8),
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            )
                : ListView.builder(
              padding: const EdgeInsets.fromLTRB(
                20,
                4,
                20,
                20,
              ),
              itemCount: _items.length,
              itemBuilder: (context, index) {
                final item = _items[index];

                return SwipeActionItem(
                  item: item,
                  onEdit: () => _editItem(item),
                  onDelete: () => _deleteItem(item),
                  onArchive: () => _archiveItem(item),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
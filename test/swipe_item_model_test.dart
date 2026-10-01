import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_swipe_actions/flutter_swipe_actions.dart';

void main() {
  group('SwipeItemModel', () {
    test('creates item with correct values', () {
      const item = SwipeItemModel(
        id: '1',
        title: 'Test Item',
        subtitle: 'Test subtitle',
        category: 'Work',
        time: '10:00 AM',
      );

      expect(item.id, '1');
      expect(item.title, 'Test Item');
      expect(item.subtitle, 'Test subtitle');
      expect(item.category, 'Work');
      expect(item.time, '10:00 AM');
      expect(item.isArchived, false);
    });

    test('copyWith updates selected values', () {
      const item = SwipeItemModel(
        id: '1',
        title: 'Old Title',
        subtitle: 'Subtitle',
        category: 'Work',
        time: '10:00 AM',
      );

      final updatedItem = item.copyWith(
        title: 'New Title',
        isArchived: true,
      );

      expect(updatedItem.id, '1');
      expect(updatedItem.title, 'New Title');
      expect(updatedItem.subtitle, 'Subtitle');
      expect(updatedItem.category, 'Work');
      expect(updatedItem.time, '10:00 AM');
      expect(updatedItem.isArchived, true);
    });
  });
}
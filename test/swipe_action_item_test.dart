import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_swipe_actions/flutter_swipe_actions.dart';

void main() {
  testWidgets('SwipeActionItem displays item information',
          (tester) async {
        const item = SwipeItemModel(
          id: '1',
          title: 'Flutter Task',
          subtitle: 'Complete package',
          category: 'Work',
          time: '10:00 AM',
        );

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: SwipeActionItem(
                item: item,
                onEdit: () {},
                onDelete: () {},
                onArchive: () {},
              ),
            ),
          ),
        );

        expect(find.text('Flutter Task'), findsOneWidget);
        expect(find.text('Complete package'), findsOneWidget);
        expect(find.text('Work'), findsOneWidget);
        expect(find.text('10:00 AM'), findsOneWidget);
      });
}
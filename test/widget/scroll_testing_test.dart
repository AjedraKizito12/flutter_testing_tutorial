import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_tutorial/widget/scroll_testing.dart';

void main() {
  group("ScrollTestingWidget", () {
    testWidgets("should not scroll with less items",
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: ScrollTestingWidget(
          bookTitles: List.generate(5, (index) => "Book $index"),
        ),
      ));

      await tester.drag(find.byType(ListView), const Offset(0, -300));
      await tester.pump();

      final firstBookFinder = find.text("Book 0");
      expect(firstBookFinder, findsOneWidget);
    });

    testWidgets("should scroll with a lot of items",
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: ScrollTestingWidget(
          bookTitles: List.generate(300, (index) => "Book $index"),
        ),
      ));

      await tester.drag(find.byType(ListView), Offset(0, -300));
      await tester.pump();

      final firstBookFinder = find.text("Book 0");
      final eleventhBookFinder = find.text("Book 11");
      final listTilesFinder = find.byType(ListTile);

      expect(firstBookFinder, findsNothing);
      expect(eleventhBookFinder, findsOneWidget);
      expect(listTilesFinder, findsNWidgets(11));
    });

    testWidgets("should only show 2 on small screens",
        (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = Size(320, 350);
      await tester.pumpWidget(MaterialApp(
        home: ScrollTestingWidget(
          bookTitles: List.generate(50, (index) => "Book $index"),
        ),
      ));
    });

    testWidgets("should throw error if empty list is provided",
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: ScrollTestingWidget(
          bookTitles: [],
        ),
      ));

      expect(tester.takeException(), isAssertionError);
    });
  });
}

import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:clean_framework/clean_framework_tests.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lyric_finder/features/lyricfinder/presentation/lyricfinder_display_ui.dart';
import 'package:lyric_finder/features/lyricfinder/presentation/lyricfinder_ui.dart';
import 'package:lyric_finder/providers.dart';

void main() {
  uiTest(
    "Display Screen",
    context: providersContext,
    builder: () => LyricFinderUI(),
    verify: (tester) async {
      final textfieldFinder = find.byType(
        type<TextFormField>(),
      );
      expect(textfieldFinder, findsNWidgets(2));

      await tester.tap(textfieldFinder.first);
      await tester.pumpAndSettle();

      final searchFinder = find.text('Search');
      expect(searchFinder, findsNWidgets(1));

      final button = find.ancestor(
          of: searchFinder, matching: find.byType(type<ElevatedButton>()));

      // await tester.tap(button);
      // await tester.pumpAndSettle();

      // await tester.pageBack();
      // await tester.pumpAndSettle();

      // expect(textfieldFinder, findsNWidgets(2));
    },
  );
}

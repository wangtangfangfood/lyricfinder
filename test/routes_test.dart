import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lyric_finder/home_page.dart';
import 'package:lyric_finder/providers.dart';
import 'package:lyric_finder/routes.dart';

void main() {
  testWidgets(
    'shows error page when route is not found',
    (tester) async {
      await tester.pumpWidget(buildWidget(const HomePage()));

      router.open("/non-existent");
      await tester.pumpAndSettle();

      expect(find.byType(Page404), findsOneWidget);
    },
  );
}

Widget buildWidget(Widget widget) {
  return AppProvidersContainer(
    providersContext: providersContext,
    onBuild: (_, __) {},
    child: MaterialApp.router(
      routeInformationParser: router.informationParser,
      routerDelegate: router.delegate,
    ),
  );
}

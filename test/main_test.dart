import 'package:clean_framework/clean_framework_defaults.dart'
    hide FeatureState;
import 'package:clean_framework/clean_framework_defaults.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:lyric_finder/features.dart' as feature;
import 'package:lyric_finder/main.dart' as app;
import 'package:lyric_finder/providers.dart';

void main() {
  test('main', () {
    expect(() => app.main(), throwsAssertionError);
  });
  test('Load providers', () {
    loadProviders();
    final rest = restExternalInterface.getExternalInterface(providersContext);
    expect(rest, isA<RestExternalInterface>());
  });
  testWidgets('Main app', (tester) async {
    await tester.pumpWidget(
      const app.MyApp(),
    );
    await tester.pump();
    await tester.pumpAndSettle();

    // Uncomment this to see the widget tree on the console
    // debugDumpApp();

    expect(find.byType(app.MyApp), findsOneWidget);

    final featuresMap =
        providersContext().read(featureStatesProvider.featuresMap);

    expect(featuresMap.defaultState, isA<feature.FeatureState>());
    print("isFeature");
    expect(featuresMap.getStateFor(feature.lyricFinderFeature),
        feature.FeatureState.active);
    print("isActive");
  });
}

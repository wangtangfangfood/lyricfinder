import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:clean_framework/clean_framework_tests.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lyric_finder/features/lyricfinder/presentation/lyricfinder_display_ui.dart';
import 'package:lyric_finder/providers.dart';

void main() {
  final gateway = lyricFinderGatewayProvider.getGateway(providersContext);

  gateway.transport = (request) async {
    return Right(
      RestSuccessResponse(
        data: const {'lyrics': "Hello hello hello how low?"},
      ),
    );
  };

  uiTest("Display Lyrics",
      context: providersContext,
      builder: () => LyricFinderDisplayUI(),
      verify: (tester) async {
        expect(find.textContaining("No Lyrics"), findsOneWidget);
      });
}

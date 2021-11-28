import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:clean_framework/clean_framework_providers.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lyric_finder/features/lyricfinder/domain/lyricfinder_entity.dart';
import 'package:lyric_finder/features/lyricfinder/domain/lyricfinder_usecase.dart';
import 'package:lyric_finder/features/lyricfinder/external_interface/lyricfinder_gateway.dart';
import 'package:lyric_finder/providers.dart';

final useCase = lyricFinderUseCaseProvider.getUseCaseFromContext(
  providersContext,
);

void main() {
  group("hello", () {
    test('fetches lyrics successfully', () async {
      var gateway = LyricFinderGateway();

      gateway.transport = (request) async {
        return Right(
          RestSuccessResponse(
            data: const {"lyrics": "Yellow"},
          ),
        );
      };

      await useCase.fetchLyrics();

      expect(
        useCase.entity,
        LyricFinderEntity(lyrics: "Yellow"),
      );
    });

    test('Lyric failure on yield output', () async {
      resetProvidersContext();

      final useCase = lyricFinderUseCaseProvider.getUseCaseFromContext(
        providersContext,
      );

      var gateway = LyricFinderGateway();

      gateway.transport = (request) async {
        return const Left(FailureResponse());
      };

      await useCase.fetchLyrics();

      expect(useCase.entity, LyricFinderEntity(lyrics: "No such song!"));
    });
  });
}

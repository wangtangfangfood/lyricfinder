import 'package:flutter_test/flutter_test.dart';
import 'package:lyric_finder/features/lyricfinder/domain/lyricfinder_entity.dart';
import 'package:lyric_finder/providers.dart';

void main() {
  setUp(() {
    resetProvidersContext();
    restExternalInterface.getExternalInterface(providersContext);
  });

  test('fetches countries for default continent successfully', () async {
    final useCase =
        lyricFinderUseCaseProvider.getUseCaseFromContext(providersContext);

    expect(
      useCase.entity,
      LyricFinderEntity(
        isLoading: false,
        artist: "",
        lyrics: "No lyrics found",
        title: "",
      ),
    );

    expectLater(
      useCase.stream,
      emitsInOrder(
        [
          LyricFinderEntity(isLoading: true),
          isA<LyricFinderEntity>()
              .having((e) => e.isLoading, 'isLoading', isFalse)
              .having(
                (e) => e.artist,
                'artist',
                'Coldplay',
              )
              .having(
                (e) => e.title,
                'title',
                "Yellow",
              )
              .having(
                  (e) => e.lyrics, "lyrics", contains("And it was all yellow")),
        ],
      ),
    );

    await useCase.fetchLyrics(artist: "Coldplay", title: "Yellow");
    useCase.dispose();
  });
}

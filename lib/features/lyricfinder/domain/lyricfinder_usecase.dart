import 'package:clean_framework/clean_framework_providers.dart';
import 'package:lyric_finder/features/lyricfinder/domain/lyricfinder_entity.dart';

class LyricFinderUseCase extends UseCase<LyricFinderEntity> {
  LyricFinderUseCase()
      : super(
          entity: LyricFinderEntity(),
          outputFilters: {
            LyricFinderUIOutput: (LyricFinderEntity e) {
              return LyricFinderUIOutput(
                  isLoading: e.isLoading,
                  lyrics: e.lyrics,
                  artist: e.artist,
                  title: e.title);
            },
          },
        );

  Future<void> fetchLyrics({
    String? artist,
    String? title,
    bool isRefresh = false,
  }) async {
    if (!isRefresh) entity = entity.merge(isLoading: true);

    final _artist = artist ?? entity.artist;
    final _title = title ?? entity.title;

    return request<LyricFinderGatewayOutput, LyricFinderSuccessInput>(
      LyricFinderGatewayOutput(artist: _artist, title: _title),
      onSuccess: (successInput) => entity.merge(
        lyrics: successInput.lyrics,
        isLoading: false,
        artist: _artist,
        title: _title,
      ),
      onFailure: (failure) =>
          entity.merge(isLoading: false, lyrics: failure.message),
    );
  }
}

class LyricFinderUIOutput extends Output {
  LyricFinderUIOutput({
    required this.isLoading,
    required this.lyrics,
    required this.artist,
    required this.title,
  });

  final bool isLoading;
  final String lyrics;
  final String artist;
  final String title;

  @override
  List<Object?> get props {
    return [isLoading, lyrics, artist, title];
  }
}

class LyricFinderGatewayOutput extends Output {
  final String artist;
  final String title;

  LyricFinderGatewayOutput({required this.title, required this.artist});

  @override
  List<Object?> get props => [artist, title];
}

class LyricFinderSuccessInput extends SuccessInput {
  final String lyrics;

  LyricFinderSuccessInput({required this.lyrics});

  factory LyricFinderSuccessInput.fromJson(Map<String, dynamic> json) {
    return LyricFinderSuccessInput(
      lyrics: json["lyrics"],
    );
  }
}

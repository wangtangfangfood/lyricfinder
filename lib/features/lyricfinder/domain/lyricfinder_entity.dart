import 'package:clean_framework/clean_framework_providers.dart';

class LyricFinderEntity extends Entity {
  LyricFinderEntity({
    this.isLoading = false,
    this.lyrics = "No lyrics found",
    this.artist = "",
    this.title = "",
  });

  final bool isLoading;
  final String artist;
  final String lyrics;
  final String title;
  @override
  List<Object?> get props {
    return [isLoading, lyrics, artist, title];
  }

  LyricFinderEntity merge({
    bool? isLoading,
    String? lyrics,
    String? artist,
    String? title,
  }) {
    return LyricFinderEntity(
      isLoading: isLoading ?? this.isLoading,
      lyrics: lyrics ?? this.lyrics,
      artist: artist ?? this.artist,
      title: title ?? this.title,
    );
  }
}

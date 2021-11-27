import 'package:clean_framework/clean_framework_providers.dart';
import 'package:flutter/material.dart';

class LyricFinderViewModel extends ViewModel {
  LyricFinderViewModel({
    required this.isLoading,
    required this.lyrics,
    required this.artist,
    required this.title,
    required this.fetchLyrics,
  });

  final bool isLoading;
  final String lyrics;
  final String artist;
  final String title;

  final Future<void> Function({
    String? artist,
    String? title,
    bool isLoading,
  }) fetchLyrics;

  @override
  List<Object?> get props {
    return [isLoading, lyrics, artist, title];
  }
}

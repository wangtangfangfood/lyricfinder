import 'package:clean_framework/clean_framework_providers.dart';
import 'package:flutter/material.dart';
import 'package:lyric_finder/features/lyricfinder/domain/lyricfinder_usecase.dart';
import 'package:lyric_finder/features/lyricfinder/domain/lyricfinder_viewmodel.dart';
import 'package:lyric_finder/providers.dart';

class LyricFinderPresenter extends Presenter<LyricFinderViewModel,
    LyricFinderUIOutput, LyricFinderUseCase> {
  LyricFinderPresenter(
      {required PresenterBuilder<LyricFinderViewModel> builder})
      : super(
          builder: builder,
          provider: lyricFinderUseCaseProvider,
        );

  @override
  LyricFinderViewModel createViewModel(
    LyricFinderUseCase useCase,
    LyricFinderUIOutput output,
  ) {
    return LyricFinderViewModel(
      isLoading: output.isLoading,
      lyrics: output.lyrics,
      artist: output.artist,
      title: output.title,
      fetchLyrics: ({bool isLoading = false, String? artist, String? title}) =>
          useCase.fetchLyrics(
              isRefresh: isLoading, artist: artist, title: title),
    );
  }
}

class DisplayPresenter extends LyricFinderPresenter {
  DisplayPresenter({required PresenterBuilder<LyricFinderViewModel> builder})
      : super(
          builder: builder,
        );
}

class SearchPresenter extends LyricFinderPresenter {
  SearchPresenter({required PresenterBuilder<LyricFinderViewModel> builder})
      : super(
          builder: builder,
        );
}

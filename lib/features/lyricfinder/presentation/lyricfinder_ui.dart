// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:clean_framework/clean_framework_providers.dart';
import 'package:flutter/material.dart';
import 'package:lyric_finder/features/lyricfinder/domain/lyricfinder_viewmodel.dart';
import 'package:lyric_finder/features/lyricfinder/presentation/lyricfinder_presenter.dart';
import 'package:lyric_finder/routes.dart';

class LyricFinderUI extends UI<LyricFinderViewModel> {
  @override
  Presenter create(builder) => SearchPresenter(builder: builder);

  @override
  Widget build(BuildContext context, LyricFinderViewModel viewModel) {
    final artist = TextEditingController();
    final title = TextEditingController();

    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            decoration: InputDecoration(hintText: "Artist"),
            key: Key("Artist"),
            controller: artist,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            decoration: InputDecoration(hintText: "Title of the song"),
            key: Key("Title"),
            controller: title,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
              onPressed: () {
                viewModel.fetchLyrics(
                    artist: artist.value.text, title: title.value.text);
                router.to(Routes.lyricDisplay);
              },
              child: const Text("Search")),
        )
      ],
    ));
  }
}

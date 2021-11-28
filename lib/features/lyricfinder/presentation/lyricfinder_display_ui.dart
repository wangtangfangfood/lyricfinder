// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:clean_framework/clean_framework_providers.dart';
import 'package:flutter/material.dart';
import 'package:lyric_finder/features/lyricfinder/domain/lyricfinder_viewmodel.dart';
import 'package:lyric_finder/features/lyricfinder/presentation/lyricfinder_presenter.dart';

class LyricFinderDisplayUI extends UI<LyricFinderViewModel> {
  @override
  Presenter create(builder) => DisplayPresenter(builder: builder);

  @override
  Widget build(BuildContext context, LyricFinderViewModel viewModel) {
    final lyrics = viewModel.lyrics;

    return Scaffold(
      body: LyricDisplayWidget(
        isLoading: viewModel.isLoading,
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  lyrics,
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LyricDisplayWidget extends StatelessWidget {
  const LyricDisplayWidget({
    Key? key,
    required this.isLoading,
    required this.child,
  }) : super(key: key);

  final bool isLoading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox();
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: isLoading
          ? Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 1),
                  ),
                  SizedBox(
                    width: 10,
                    height: 20,
                  ),
                  Text('Fetching Lyrics ...'),
                ],
              ),
            )
          : child,
    );
  }
}

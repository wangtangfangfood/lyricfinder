import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:clean_framework/clean_framework_providers.dart';
import 'package:lyric_finder/features/lyricfinder/domain/lyricfinder_usecase.dart';
import 'package:lyric_finder/providers.dart';

class LyricFinderGateway extends RestGateway<LyricFinderGatewayOutput,
    LyricFinderRequest, LyricFinderSuccessInput> {
  LyricFinderGateway()
      : super(
          context: providersContext,
          provider: lyricFinderUseCaseProvider,
        );

  @override
  LyricFinderRequest buildRequest(LyricFinderGatewayOutput output) {
    return LyricFinderRequest(artist: output.artist, title: output.title);
  }

  @override
  FailureInput onFailure(FailureResponse failureResponse) {
    return FailureInput(message: "No such song!");
  }

  @override
  LyricFinderSuccessInput onSuccess(RestSuccessResponse response) {
    return LyricFinderSuccessInput.fromJson(response.data);
  }
}

class LyricFinderRequest extends GetRestRequest {
  LyricFinderRequest({required this.artist, required this.title});

  final String title;
  final String artist;

  @override
  String get path => "/v1/$artist/$title";

  // @override
  // Map<String, dynamic> get params => {"artist": "Coldplay", "title": keyword};
}

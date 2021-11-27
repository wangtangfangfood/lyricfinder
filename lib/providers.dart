import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart'
    hide FeatureState;
import 'package:clean_framework/clean_framework_providers.dart';
import 'package:clean_framework/clean_framework_tests.dart';
import 'package:lyric_finder/features.dart';
import 'package:lyric_finder/features/lyricfinder/domain/lyricfinder_entity.dart';
import 'package:lyric_finder/features/lyricfinder/domain/lyricfinder_usecase.dart';
import 'package:lyric_finder/features/lyricfinder/external_interface/lyricfinder_gateway.dart';

ProvidersContext _providersContext = ProvidersContext();

ProvidersContext get providersContext => _providersContext;

// @visibleForTesting
void resetProvidersContext([ProvidersContext? context]) {
  _providersContext = context ?? ProvidersContext();
}

final featureStatesProvider =
    FeatureStateProvider<FeatureState, MyFeatureMapper>(
  (_) => MyFeatureMapper(),
);

final lyricFinderUseCaseProvider =
    UseCaseProvider<LyricFinderEntity, LyricFinderUseCase>(
  (_) => LyricFinderUseCase(),
);

final lyricFinderGatewayProvider = GatewayProvider<LyricFinderGateway>(
  (_) => LyricFinderGateway(),
);

final restExternalInterface = ExternalInterfaceProvider(
  (_) => RestExternalInterface(
    baseUrl: 'https://api.lyrics.ovh',
    gatewayConnections: [
      () => lyricFinderGatewayProvider.getGateway(providersContext),
    ],
  ),
);

void loadProviders() {
  // lyricFinderGatewayProvider.getUseCaseFromContext(providersContext);
  lyricFinderGatewayProvider.getGateway(providersContext);
  // firebaseExternalInterface.getExternalInterface(providersContext);
  // graphQLExternalInterface.getExternalInterface(providersContext);
  restExternalInterface.getExternalInterface(providersContext);
}

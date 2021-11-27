import 'package:clean_framework/clean_framework.dart';

const lastLoginFeature = Feature(name: 'last_login');

enum FeatureState { hidden, active, forbidden }

class MyFeatureMapper extends FeatureMapper<FeatureState> {
  static const Map<String, FeatureState> _jsonStateToFeatureStateMap = {
    'HIDDEN': FeatureState.hidden,
    'ACTIVE': FeatureState.active,
    'FORBIDDEN': FeatureState.forbidden,
  };

  @override
  // ignore: avoid_renaming_method_parameters
  FeatureState parseState(String state) {
    return _jsonStateToFeatureStateMap[state] ?? defaultState;
  }

  @override
  get defaultState => FeatureState.hidden;
}

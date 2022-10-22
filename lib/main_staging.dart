import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/config/pre_app_config.dart';
import 'package:flutter_template/log/bloc_events_logger.dart';

import 'app.dart';
import 'config/flavor_config.dart';
import 'config/network_constants.dart';

Future<void> main() async {
  FlavorConfig.set(
    Flavor.STAGING,
    FlavorValues(
      baseUrlApi: baseUrlStage + apiPrefix,
    ),
  );

  await preAppConfig();

  BlocOverrides.runZoned(() => runApp(App()), blocObserver: BlocEventsLogger());
}

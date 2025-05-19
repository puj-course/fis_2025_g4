import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:top_app/core/di/injector.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => getIt.init();

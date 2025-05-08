import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_app/core/di/injector.dart';
import 'package:top_app/core/router/app_router.dart';
import 'package:top_app/core/theme/app_theme.dart';
import 'package:top_app/firebase_options.dart';
import 'package:top_app/shared/global_state/user/domain/state_management/cubit/user_cubit.dart';
import 'package:top_app/test_data/seed_test_challenge.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    print('${bloc.runtimeType} $change');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    print('${bloc.runtimeType} $error $stackTrace');
    super.onError(bloc, error, stackTrace);
  }
}

void main() async {
  configureDependencies();
  final AppRouter appRouter = AppRouter();

  // Initialize Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Set up BlocObserver
  Bloc.observer = AppBlocObserver();

  //TODO: Remove this on production
  await seedTestChallenge();

  runApp(MyApp(appRouter: appRouter));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserCubit>(
      create: (BuildContext context) => getIt<UserCubit>()..getUser(),
      child: MaterialApp.router(
        title: 'T.O.P',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkTheme,
        routerConfig: appRouter.config(),
      ),
    );
  }
}

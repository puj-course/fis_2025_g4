// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [CountdownRecordScreen]
class CountdownRecordRoute extends PageRouteInfo<CountdownRecordRouteArgs> {
  CountdownRecordRoute({
    Key? key,
    required int remainingSeconds,
    required int rank,
    List<PageRouteInfo>? children,
  }) : super(
         CountdownRecordRoute.name,
         args: CountdownRecordRouteArgs(
           key: key,
           remainingSeconds: remainingSeconds,
           rank: rank,
         ),
         initialChildren: children,
       );

  static const String name = 'CountdownRecordRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CountdownRecordRouteArgs>();
      return CountdownRecordScreen(
        key: args.key,
        remainingSeconds: args.remainingSeconds,
        rank: args.rank,
      );
    },
  );
}

class CountdownRecordRouteArgs {
  const CountdownRecordRouteArgs({
    this.key,
    required this.remainingSeconds,
    required this.rank,
  });

  final Key? key;

  final int remainingSeconds;

  final int rank;

  @override
  String toString() {
    return 'CountdownRecordRouteArgs{key: $key, remainingSeconds: $remainingSeconds, rank: $rank}';
  }
}

/// generated route for
/// [NinetyNineScreen]
class NinetyNineRoute extends PageRouteInfo<void> {
  const NinetyNineRoute({List<PageRouteInfo>? children})
    : super(NinetyNineRoute.name, initialChildren: children);

  static const String name = 'NinetyNineRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const NinetyNineScreen();
    },
  );
}

/// generated route for
/// [SignInScreen]
class SignInRoute extends PageRouteInfo<void> {
  const SignInRoute({List<PageRouteInfo>? children})
    : super(SignInRoute.name, initialChildren: children);

  static const String name = 'SignInRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SignInScreen();
    },
  );
}

/// generated route for
/// [SignUpScreen]
class SignUpRoute extends PageRouteInfo<void> {
  const SignUpRoute({List<PageRouteInfo>? children})
    : super(SignUpRoute.name, initialChildren: children);

  static const String name = 'SignUpRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SignUpScreen();
    },
  );
}

/// generated route for
/// [StartOrLevelUpScreen]
class StartOrLevelUpRoute extends PageRouteInfo<void> {
  const StartOrLevelUpRoute({List<PageRouteInfo>? children})
    : super(StartOrLevelUpRoute.name, initialChildren: children);

  static const String name = 'StartOrLevelUpRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const StartOrLevelUpScreen();
    },
  );
}

/// generated route for
/// [ThatOneScreen]
class ThatOneRoute extends PageRouteInfo<void> {
  const ThatOneRoute({List<PageRouteInfo>? children})
    : super(ThatOneRoute.name, initialChildren: children);

  static const String name = 'ThatOneRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ThatOneScreen();
    },
  );
}

/// generated route for
/// [TopIsThePlaceScreen]
class TopIsThePlaceRoute extends PageRouteInfo<void> {
  const TopIsThePlaceRoute({List<PageRouteInfo>? children})
    : super(TopIsThePlaceRoute.name, initialChildren: children);

  static const String name = 'TopIsThePlaceRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TopIsThePlaceScreen();
    },
  );
}

/// generated route for
/// [WelcomeScreen]
class WelcomeRoute extends PageRouteInfo<void> {
  const WelcomeRoute({List<PageRouteInfo>? children})
    : super(WelcomeRoute.name, initialChildren: children);

  static const String name = 'WelcomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const WelcomeScreen();
    },
  );
}

/// generated route for
/// [YourLiveChangesScreen]
class YourLiveChangesRoute extends PageRouteInfo<void> {
  const YourLiveChangesRoute({List<PageRouteInfo>? children})
    : super(YourLiveChangesRoute.name, initialChildren: children);

  static const String name = 'YourLiveChangesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const YourLiveChangesScreen();
    },
  );
}

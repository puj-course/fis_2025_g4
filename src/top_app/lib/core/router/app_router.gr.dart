// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [Add2faScreen]
class Add2faRoute extends PageRouteInfo<void> {
  const Add2faRoute({List<PageRouteInfo>? children})
    : super(Add2faRoute.name, initialChildren: children);

  static const String name = 'Add2faRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const Add2faScreen();
    },
  );
}

/// generated route for
/// [ChallengeDetailScreen]
class ChallengeDetailRoute extends PageRouteInfo<ChallengeDetailRouteArgs> {
  ChallengeDetailRoute({
    Key? key,
    required Challenge challenge,
    List<PageRouteInfo>? children,
  }) : super(
         ChallengeDetailRoute.name,
         args: ChallengeDetailRouteArgs(key: key, challenge: challenge),
         initialChildren: children,
       );

  static const String name = 'ChallengeDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ChallengeDetailRouteArgs>();
      return ChallengeDetailScreen(key: args.key, challenge: args.challenge);
    },
  );
}

class ChallengeDetailRouteArgs {
  const ChallengeDetailRouteArgs({this.key, required this.challenge});

  final Key? key;

  final Challenge challenge;

  @override
  String toString() {
    return 'ChallengeDetailRouteArgs{key: $key, challenge: $challenge}';
  }
}

/// generated route for
/// [ChallengesListScreen]
class ChallengesListRoute extends PageRouteInfo<void> {
  const ChallengesListRoute({List<PageRouteInfo>? children})
    : super(ChallengesListRoute.name, initialChildren: children);

  static const String name = 'ChallengesListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ChallengesListScreen();
    },
  );
}

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
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}

/// generated route for
/// [NavigationScreen]
class NavigationRoute extends PageRouteInfo<void> {
  const NavigationRoute({List<PageRouteInfo>? children})
    : super(NavigationRoute.name, initialChildren: children);

  static const String name = 'NavigationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const NavigationScreen();
    },
  );
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
/// [SubmitActivityProofScreen]
class SubmitActivityProofRoute
    extends PageRouteInfo<SubmitActivityProofRouteArgs> {
  SubmitActivityProofRoute({
    Key? key,
    required Activity activity,
    List<PageRouteInfo>? children,
  }) : super(
         SubmitActivityProofRoute.name,
         args: SubmitActivityProofRouteArgs(key: key, activity: activity),
         initialChildren: children,
       );

  static const String name = 'SubmitActivityProofRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SubmitActivityProofRouteArgs>();
      return SubmitActivityProofScreen(key: args.key, activity: args.activity);
    },
  );
}

class SubmitActivityProofRouteArgs {
  const SubmitActivityProofRouteArgs({this.key, required this.activity});

  final Key? key;

  final Activity activity;

  @override
  String toString() {
    return 'SubmitActivityProofRouteArgs{key: $key, activity: $activity}';
  }
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

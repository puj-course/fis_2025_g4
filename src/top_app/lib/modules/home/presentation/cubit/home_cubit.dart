import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:top_app/modules/home/domain/usecases/get_user_challenges_usecase.dart';
import 'package:top_app/shared/entities/templates/challenge.dart';
import 'package:top_app/shared/global_state/user/api/user_public_api.dart';
import 'package:top_app/shared/global_state/user/domain/entity/user_entity.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required GetUserChallengesUsecase getUserChallengesUsecase,
    required UserPublicApi userPublicApi,
  })  : _getUserChallengesUsecase = getUserChallengesUsecase,
        _userPublicApi = userPublicApi,
        super(const HomeState.initial());

  // Usecases
  final GetUserChallengesUsecase _getUserChallengesUsecase;

  // Repositories
  final UserPublicApi _userPublicApi;

  // Local State
  UserEntity? _user;

  Future<UserEntity?> getUser() async {
    try {
      emit(const HomeState.loadingUser());
      final user = await _userPublicApi.getUser();

      if (user == null) {
        emit(const HomeState.error(
          message: 'User not found',
          isUserError: true,
        ));
        return null;
      }

      _user = user;
      emit(HomeState.loaded(user: user));
      return user;
    } catch (e) {
      emit(HomeState.error(
        message: 'Failed to load user: ${e.toString()}',
        isUserError: true,
      ));
      return null;
    }
  }

  Future<void> getUserChallenges() async {
    try {
      emit(const HomeState.loadingChallenges());

      if (_user == null) {
        emit(const HomeState.error(
          message: 'User not found',
          isUserError: true,
        ));
        return;
      }

      final challenges = await _getUserChallengesUsecase.call(
        _user!.challenges.map((e) => e.challengeId).toList(),
      );

      emit(HomeState.loaded(
        user: _user!,
        challenges: challenges,
      ));
    } catch (e) {
      emit(HomeState.error(
        message: 'Failed to load challenges: ${e.toString()}',
        isUserError: false,
      ));
    }
  }
}

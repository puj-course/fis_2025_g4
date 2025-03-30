import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:top_app/shared/entities/templates/challenge.dart';
import 'package:top_app/modules/show_challenges_feature/sub_features/show_challenges_list/domain/repository/show_challenges_list_repository.dart';

part 'challenges_state.dart';
part 'challenges_cubit.freezed.dart';

@lazySingleton
class ChallengesCubit extends Cubit<ChallengesState> {
  final ShowChallengesListRepository _repository;

  ChallengesCubit({required ShowChallengesListRepository repository})
      : _repository = repository,
        super(ChallengesState.initial());

  Future<void> getChallenges() async {
    try {
      final challenges = await _repository.getChallenges();
      emit(ChallengesState.loadedChallenges(challenges));
    } catch (e) {
      emit(ChallengesState.errorLoadingChallenges(e.toString()));
    }
  }
}

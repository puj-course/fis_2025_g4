import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:top_app/shared/entities/templates/challenge.dart';
import 'package:top_app/modules/challenges/sub_features/challenges_list/domain/repository/challenges_list_repository.dart';

part 'challenges_state.dart';
part 'challenges_cubit.freezed.dart';

@injectable
class ChallengesCubit extends Cubit<ChallengesState> {
  final ChallengesListRepository _repository;

  ChallengesCubit({required ChallengesListRepository repository})
      : _repository = repository,
        super(ChallengesState.initial());

  Future<void> getChallenges() async {
    try {
      final List<Challenge> challenges = await _repository.getChallenges();
      emit(ChallengesState.loadedChallenges(challenges));
    } catch (e) {
      emit(ChallengesState.errorLoadingChallenges(e.toString()));
    }
  }
}

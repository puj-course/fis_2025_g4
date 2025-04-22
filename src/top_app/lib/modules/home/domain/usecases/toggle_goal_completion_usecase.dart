import 'package:injectable/injectable.dart';
import 'package:top_app/shared/global_state/user/api/user_public_api.dart';
import 'package:top_app/shared/global_state/user/domain/entity/user_entity.dart';

@injectable
class ToggleGoalCompletionUsecase {
  final UserPublicApi _userPublicApi;

  ToggleGoalCompletionUsecase({required UserPublicApi userPublicApi})
      : _userPublicApi = userPublicApi;

  Future<UserEntity> call({
    required UserEntity user,
    required String goalId,
  }) async {
    // Update the goal completion status
    final updatedGoals = user.goals.map((goal) {
      if (goal.id == goalId) {
        return goal.copyWith(completion: goal.completion == 1.0 ? 0.0 : 1.0);
      }
      return goal;
    }).toList();

    // Create updated user
    final updatedUser = user.copyWith(goals: updatedGoals);

    // Push changes to Firebase
    await _userPublicApi.updateUser(updatedUser);

    return updatedUser;
  }
}

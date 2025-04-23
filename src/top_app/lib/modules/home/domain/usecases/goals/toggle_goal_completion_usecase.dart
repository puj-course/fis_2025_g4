import 'package:injectable/injectable.dart';
import 'package:top_app/shared/entities/templates/goal.dart';
import 'package:top_app/shared/global_state/user/api/user_public_api.dart';
import 'package:top_app/shared/global_state/user/domain/entity/user_entity.dart';

@injectable
class ToggleGoalCompletionUsecase {
  final UserPublicApi _userPublicApi;

  ToggleGoalCompletionUsecase({required UserPublicApi userPublicApi})
      : _userPublicApi = userPublicApi;

  Future<List<Goal>> call({required String goalId}) async {
    // Update the goal completion status
    final UserEntity? user = await _userPublicApi.getUser();
    if (user == null) {
      throw Exception('User not found');
    }

    final List<Goal> updatedGoals = user.goals.map((Goal goal) {
      if (goal.id == goalId) {
        return goal.copyWith(completion: goal.completion == 1.0 ? 0.0 : 1.0);
      }
      return goal;
    }).toList();

    // Create updated user
    final UserEntity updatedUser = user.copyWith(goals: updatedGoals);

    // Push changes to Firebase
    await _userPublicApi.updateUser(updatedUser);

    return updatedGoals;
  }
}

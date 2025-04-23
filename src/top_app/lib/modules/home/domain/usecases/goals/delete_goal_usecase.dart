import 'package:injectable/injectable.dart';
import 'package:top_app/shared/entities/templates/goal.dart';
import 'package:top_app/shared/global_state/user/api/user_public_api.dart';
import 'package:top_app/shared/global_state/user/domain/entity/user_entity.dart';

@injectable
class DeleteGoalUsecase {
  final UserPublicApi userPublicApi;
  DeleteGoalUsecase(this.userPublicApi);

  Future<List<Goal>> call(String goalId) async {
    final UserEntity? user = await userPublicApi.getUser();
    if (user == null) {
      throw Exception('User not found');
    }

    final List<Goal> updatedGoals = user.goals.where((Goal goal) => goal.id != goalId).toList();
    UserEntity updatedUser = user.copyWith(goals: updatedGoals);
    await userPublicApi.updateUser(updatedUser);
    return updatedGoals;
  }
}

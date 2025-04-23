import 'package:injectable/injectable.dart';
import 'package:top_app/shared/entities/templates/goal.dart';
import 'package:top_app/shared/global_state/user/api/user_public_api.dart';
import 'package:top_app/shared/global_state/user/domain/entity/user_entity.dart';
import 'package:uuid/uuid.dart';

@injectable
class CreateGoalUsecase {
  final UserPublicApi userPublicApi;
  CreateGoalUsecase(this.userPublicApi);

  Future<List<Goal>> call(String name) async {
    final UserEntity? user = await userPublicApi.getUser();
    if (user == null) {
      throw Exception('User not found');
    }

    final DateTime dueDate =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 23, 59, 59);

    final Goal goal = Goal(
      id: Uuid().v4(),
      name: name,
      createdAt: DateTime.now(),
      completion: 0,
      dueDate: dueDate,
      type: 'instant',
    );

    final List<Goal> updatedGoals = <Goal>[...user.goals, goal];
    UserEntity updatedUser = user.copyWith(goals: updatedGoals);

    await userPublicApi.updateUser(updatedUser);

    return updatedGoals;
  }
}
